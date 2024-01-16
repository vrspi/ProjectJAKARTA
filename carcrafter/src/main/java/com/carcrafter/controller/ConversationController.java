package com.carcrafter.controller;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Message;



@WebServlet("/FetchMessages")

public class ConversationController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            int otherUserId = Integer.parseInt(request.getParameter("otherUserId"));
            int currentUserId = Integer.parseInt(request.getParameter("CurrentUserId")); // Implement this to get the current user's ID

            em.getTransaction().begin();
            String qlString = "SELECT m FROM Message m WHERE (m.senderID = :currentUserId AND m.receiverID = :otherUserId) OR (m.senderID = :otherUserId AND m.receiverID = :currentUserId) ORDER BY m.timestamp";
            List<Message> messages = em.createQuery(qlString, Message.class)
                                        .setParameter("currentUserId", currentUserId)
                                        .setParameter("otherUserId", otherUserId)
                                        .getResultList();
            em.getTransaction().commit();

            JSONArray jsonMessages = new JSONArray();
            for (Message message : messages) {
                JSONObject jsonMessage = new JSONObject();
                jsonMessage.put("senderId", message.getSenderID());
                jsonMessage.put("receiverId", message.getReceiverID());
                jsonMessage.put("content", message.getContent());
                jsonMessage.put("timestamp", message.getTimestamp().toString());
                // Add more fields as needed
                jsonMessages.put(jsonMessage);
            }

            response.setContentType("application/json");
            response.getWriter().write(jsonMessages.toString());
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new ServletException("Error retrieving messages: ", e);
        } finally {
            em.close();
        }
    }
}
