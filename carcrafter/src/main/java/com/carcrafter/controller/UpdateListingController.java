package com.carcrafter.controller;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Listing;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UpdateListing")
public class UpdateListingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String listingIdParameter = req.getParameter("listingId");
        if (listingIdParameter != null && !listingIdParameter.isEmpty())
        {
            resp.sendRedirect("ProfileListing");
        }
        else
        {
            resp.sendRedirect("ProfileListing");
        }
    }
}
