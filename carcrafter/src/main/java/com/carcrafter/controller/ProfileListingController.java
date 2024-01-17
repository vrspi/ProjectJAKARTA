package com.carcrafter.controller;

import com.carcrafter.model.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ProfileListing")
public class ProfileListingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            //select voitures
            TypedQuery<Listing> query = em.createQuery("SELECT L FROM Listing L", Listing.class);
            List<Listing> listings = query.getResultList();
            req.setAttribute("Cars", listings);
            em.getTransaction().commit();
            req.getRequestDispatcher("ProfileListing.jsp").forward(req, resp);
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }

    }
}
