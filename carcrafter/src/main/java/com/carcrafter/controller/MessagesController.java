package com.carcrafter.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Message;
import com.carcrafter.model.UserProfile;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Messages")
public class MessagesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            int currentUserId = 2; // The ID of the currently logged-in user

            // Query to fetch messages
            String qlString = "SELECT m FROM Message m WHERE m.messageID IN (SELECT MAX(m2.messageID) FROM Message m2 WHERE m2.senderID = :currentUserId OR m2.receiverID = :currentUserId GROUP BY CASE WHEN m2.senderID = :currentUserId THEN m2.receiverID ELSE m2.senderID END)";
            List<Message> conversations = em.createQuery(qlString, Message.class)
                                            .setParameter("currentUserId", currentUserId)
                                            .getResultList();

            // Create a map for user IDs to names
            Map<Integer, String> userIdToNameMap = new HashMap<>();
            for (Message message : conversations) {
                int senderId = message.getSenderID();
                int receiverId = message.getReceiverID();

                if (!userIdToNameMap.containsKey(senderId)) {
                    userIdToNameMap.put(senderId, getUserName(senderId, em)); // Assume getUserName is a method to fetch user name by ID
                }

                if (!userIdToNameMap.containsKey(receiverId)) {
                    userIdToNameMap.put(receiverId, getUserName(receiverId, em));
                }
            }

            em.getTransaction().commit();

            // Add the conversations and the map to the request
            req.setAttribute("conversations", conversations);
            req.setAttribute("userIdToNameMap", userIdToNameMap);

            // Forward to JSP
            req.getRequestDispatcher("/partials/Messages.jsp").forward(req, resp);

        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new ServletException("Error retrieving messages : ", e);
        } finally {
            em.close();
        }
    }

    private String getUserName(int userId, EntityManager em) {
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
    
}
