package com.carcrafter.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Message;
import com.carcrafter.model.UserProfile;

import jakarta.persistence.EntityManager;

public class MessageService {

    private EntityManager em;

    public MessageService() {
        this.em = JPAUtil.getEntityManager();
    }

    public void createMessage(int senderId, int receiverId, String content) {
        Message newMessage = new Message();
        em.getTransaction().begin();
        try {
            newMessage.setSenderID(senderId);
            newMessage.setReceiverID(receiverId);
            newMessage.setContent(content);
            newMessage.setTimestamp(LocalDateTime.now());
            em.persist(newMessage);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public List<Message> getConversations(int currentUserId) {
        em.getTransaction().begin();
        try {
            String qlString = "SELECT m FROM Message m WHERE m.messageID IN (SELECT MAX(m2.messageID) FROM Message m2 WHERE m2.senderID = :currentUserId OR m2.receiverID = :currentUserId GROUP BY CASE WHEN m2.senderID = :currentUserId THEN m2.receiverID ELSE m2.senderID END)";
            List<Message> conversations = em.createQuery(qlString, Message.class)
                                            .setParameter("currentUserId", currentUserId)
                                            .getResultList();
            em.getTransaction().commit();
            return conversations;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public Map<Integer, String> getUserIdToNameMap(List<Message> conversations) {
        Map<Integer, String> userIdToNameMap = new HashMap<>();
        for (Message message : conversations) {
            int senderId = message.getSenderID();
            int receiverId = message.getReceiverID();

            if (!userIdToNameMap.containsKey(senderId)) {
                userIdToNameMap.put(senderId, getUserName(senderId)); 
            }

            if (!userIdToNameMap.containsKey(receiverId)) {
                userIdToNameMap.put(receiverId, getUserName(receiverId));
            }
        }
        return userIdToNameMap;
    }

    private String getUserName(int userId) {
        try {
            UserProfile user = em.find(UserProfile.class, userId);
            if (user != null) {
                return user.getFirstName() + " " + user.getLastName();
            } else {
                return "Unknown User";
            }
        } catch (Exception e) {
            return "Error: User Not Found";
        }
    }
    
    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
