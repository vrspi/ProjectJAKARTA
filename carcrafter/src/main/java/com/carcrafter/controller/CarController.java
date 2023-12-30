package com.carcrafter.controller;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.*;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/AddListing")
public class CarController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if( request.getAttribute("listingTitle")==null)
        {
            request.setAttribute("listingTitle","");
            request.setAttribute("price","");
        }





        EntityManager em = JPAUtil.getEntityManager();

        TypedQuery<ConditionT> queryConditionT = em.createQuery("SELECT c FROM ConditionT c", ConditionT.class);
        List<ConditionT> ConditionTs = queryConditionT.getResultList();

        TypedQuery<BodyType> queryBodyType = em.createQuery("SELECT b FROM BodyType b", BodyType.class);
        List<BodyType> bodyTypes = queryBodyType.getResultList();

        TypedQuery<MakeBrand> queryMakeBrand = em.createQuery("SELECT m FROM MakeBrand m", MakeBrand.class);
        List<MakeBrand> makeBrands = queryMakeBrand.getResultList();

        TypedQuery<Model> queryModel = em.createQuery("SELECT m FROM Model m", Model.class);
        List<Model> models = queryModel.getResultList();

        TypedQuery<Year> queryYear = em.createQuery("SELECT y FROM Year y", Year.class);
        List<Year> years = queryYear.getResultList();

        TypedQuery<DriveType> queryDriveType = em.createQuery("SELECT d FROM DriveType d", DriveType.class);
        List<DriveType> driveTypes = queryDriveType.getResultList();

        TypedQuery<Transmission> queryTransmission = em.createQuery("SELECT t FROM Transmission t", Transmission.class);
        List<Transmission> transmissions = queryTransmission.getResultList();

        TypedQuery<FuelType> queryFuelType = em.createQuery("SELECT f FROM FuelType f", FuelType.class);
        List<FuelType> fuelTypes = queryFuelType.getResultList();

        TypedQuery<Cylinders> queryCylinders = em.createQuery("SELECT c FROM Cylinders c", Cylinders.class);
        List<Cylinders> cylinders = queryCylinders.getResultList();

        TypedQuery<Color> queryColor = em.createQuery("SELECT c FROM Color c", Color.class);
        List<Color> colors = queryColor.getResultList();

        TypedQuery<Doors> queryDoors = em.createQuery("SELECT d FROM Doors d", Doors.class);
        List<Doors> doorsList = queryDoors.getResultList();

        TypedQuery<Features> querFeatures = em.createQuery("SELECT f FROM Features f", Features.class);
        List<Features> featureList = querFeatures.getResultList();

        request.setAttribute("ConditionTs", ConditionTs);
        request.setAttribute("bodyTypes", bodyTypes);
        request.setAttribute("makeBrands", makeBrands);
        request.setAttribute("models", models);
        request.setAttribute("years", years);
        request.setAttribute("driveTypes", driveTypes);
        request.setAttribute("transmissions", transmissions);
        request.setAttribute("fuelTypes", fuelTypes);
        request.setAttribute("cylinders", cylinders);
        request.setAttribute("colors", colors);
        request.setAttribute("doorsList", doorsList);
        request.setAttribute("featureList", featureList);

        em.close();
        request.getRequestDispatcher("AddListing.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String listingTitle = req.getParameter("listingTitle");
        String condition = req.getParameter("Condition");
        String bodyType = req.getParameter("bodyType");
        String makeBrand = req.getParameter("makeBrand");
        String model = req.getParameter("model");
        String price = req.getParameter("price");
        String year = req.getParameter("year");
        String driveType = req.getParameter("driveType");
        String transmission = req.getParameter("transmission");
        String fuelType = req.getParameter("fuelType");
        String mileage = req.getParameter("mileage");
        String engineSize = req.getParameter("engineSize");
        String cylinders = req.getParameter("cylinders");
        String color = req.getParameter("color");
        String doors = req.getParameter("doors");
        String vin = req.getParameter("vin");
        String tags = req.getParameter("tags");


        Map<String, String> errors = new HashMap<>();

        String pattern = "^[a-zA-Z0-9]{5,20}$";
        if (listingTitle == null || listingTitle.isEmpty() || !listingTitle.matches(pattern)) {
            errors.put("listingTitle", "Le titre de l'annonce doit contenir entre 5 et 20 caractères et ne peut inclure que des lettres et des chiffres.");
        }

        String pricePattern = "^(\\d{1,10})(\\.\\d{1,2})?$";

        if (price == null || price.isEmpty() || !price.matches(pricePattern)) {
            errors.put("price", "Le prix doit être un nombre valide avec jusqu'à 2 chiffres après la virgule");
        }


        //charger les input
        req.setAttribute("listingTitle",listingTitle);
        req.setAttribute("price",price);


        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            doGet(req, resp);
        }

    }
}
