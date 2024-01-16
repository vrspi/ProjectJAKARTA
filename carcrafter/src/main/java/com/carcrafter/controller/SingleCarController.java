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


@WebServlet("/singlecar")
public class SingleCarController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();

        TypedQuery<Listing> queryListing = em.createQuery("SELECT c FROM Listing c", Listing.class);
        List<Listing> Listings = queryListing.getResultList();
        request.setAttribute("CarsList", Listings);

        //select BodyType
        TypedQuery<BodyType> queryBodyType = em.createQuery("SELECT f FROM BodyType f", BodyType.class);
        List<BodyType> BodytypeList = queryBodyType.getResultList();
        request.setAttribute("BodytypeList", BodytypeList);

        //select Transmission
        TypedQuery<Transmission> queryTransmission = em.createQuery("SELECT f FROM Transmission f", Transmission.class);
        List<Transmission> TransmissionList = queryTransmission.getResultList();
        request.setAttribute("TransmissionList", TransmissionList);

        //select FuelType
        TypedQuery<FuelType> queryFuelType = em.createQuery("SELECT f FROM FuelType f", FuelType.class);
        List<FuelType> FuelTypeList = queryFuelType.getResultList();
        request.setAttribute("FuelTypeList", FuelTypeList);

        //select Features
        TypedQuery<Features> queryFeatures = em.createQuery("SELECT f FROM Features f", Features.class);
        List<Features> FeaturesList = queryFeatures.getResultList();
        request.setAttribute("FeaturesList", FeaturesList);

        request.getRequestDispatcher("/partials/singlecar.jsp").forward(request, response);
    }
}