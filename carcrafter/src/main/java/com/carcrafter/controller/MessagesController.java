package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Message;

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

            String qlString = "SELECT m FROM Message m WHERE m.messageID IN (SELECT MAX(m2.messageID) FROM Message m2 WHERE m2.senderID = :currentUserId OR m2.receiverID = :currentUserId GROUP BY CASE WHEN m2.senderID = :currentUserId THEN m2.receiverID ELSE m2.senderID END)";
            List<Message> conversations = em.createQuery(qlString, Message.class)
                                            .setParameter("currentUserId", currentUserId)
                                            .getResultList();
            em.getTransaction().commit();

            req.setAttribute("conversations", conversations);
            req.getRequestDispatcher("/partials/Messages.jsp").forward(req, resp);

        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback(); // Rollback only if the transaction is active
            }
            throw new ServletException("Error retrieving messages : ", e);
        } finally {
            em.close();
        }
    }
}
