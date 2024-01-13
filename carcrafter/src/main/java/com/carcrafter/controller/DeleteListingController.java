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

@WebServlet("/DeleteListing")
public class DeleteListingController extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String listingIdParameter = req.getParameter("listingId");
        if (listingIdParameter != null && !listingIdParameter.isEmpty())
        {
            long listingId = Long.parseLong(listingIdParameter);
            System.out.println(listingId);
            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();
                Listing listing = em.find(Listing.class, listingId);

                if (listing != null)
                {
                    em.remove(listing);
                    em.getTransaction().commit();
                    resp.sendRedirect("ProfileListing");
                }
                else
                {
                    resp.getWriter().println("Listing with ID " + listingId + " not found.");
                }
            }
            catch (Exception e)
            {
                if (em.getTransaction().isActive())
                {
                    em.getTransaction().rollback();
                }
                e.printStackTrace();
                resp.getWriter().println("Error deleting Listing.");
            }
            finally {
                if (em.isOpen()) {
                    em.close();
                }
            }
        }
        else
        {
            resp.sendRedirect("ProfileListing");
        }
    }
}
