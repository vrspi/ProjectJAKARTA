package com.carcrafter.controller;

import com.carcrafter.Factory.ServiceFactory;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Listing;
import com.carcrafter.service.CarService;
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

    private final CarService carService;
    public DeleteListingController() throws IllegalAccessException, InstantiationException {
        this.carService = ServiceFactory.createService(CarService.class);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String listingIdParameter = req.getParameter("listingId");
        if (listingIdParameter != null && !listingIdParameter.isEmpty())
        {
            long listingId = Long.parseLong(listingIdParameter);
            carService.DeleteListing(listingId);
        }
        resp.sendRedirect("ProfileListing");
    }
}
