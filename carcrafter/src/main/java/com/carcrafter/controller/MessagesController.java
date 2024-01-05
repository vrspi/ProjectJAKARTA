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
            List<Message> messages = em.createQuery("SELECT m FROM Message m", Message.class).getResultList();
            em.getTransaction().commit();
    
            req.setAttribute("messages", messages);
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
