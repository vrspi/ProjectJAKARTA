package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Listing;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/AddListing")
public class CarController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();

        TypedQuery<Listing> query = em.createQuery("SELECT l FROM Listing l", Listing.class);
        List<Listing> listings = query.getResultList();

        for (Listing listing : listings) {
            System.out.println("Listing Title: " + listing.getTitle());
        }

        em.close();
        request.getRequestDispatcher("AddListing.jsp").forward(request, response);
    }
}