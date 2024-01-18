package com.carcrafter.controller;

import com.carcrafter.Factory.ServiceFactory;
import com.carcrafter.model.*;
import com.carcrafter.service.CarService;
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
    private final CarService carService;
    public ProfileListingController() throws IllegalAccessException, InstantiationException {
        this.carService = ServiceFactory.createService(CarService.class);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Listing> listings = carService.SelectAllListings();
        req.setAttribute("Cars", listings);
        req.getRequestDispatcher("ProfileListing.jsp").forward(req, resp);
    }
}
