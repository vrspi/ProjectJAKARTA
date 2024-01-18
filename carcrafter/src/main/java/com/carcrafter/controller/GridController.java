package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import com.carcrafter.Factory.ServiceFactory;
import com.carcrafter.service.CarService;
import com.carcrafter.model.*;
import com.carcrafter.service.CarService;
import org.hibernate.query.criteria.JpaQueryGroup;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ShopListing")
public class GridController extends HttpServlet{
    private final CarService carService;
    public GridController() throws IllegalAccessException, InstantiationException {
        this.carService = ServiceFactory.createService(CarService.class);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //select voitures
        List<Listing> listings = carService.SelectAllListings();

        System.out.println(listings.size());
        //select brands
        List<MakeBrand> Brands = carService.SelectMakeBrand();

        //select transmission
        List<Transmission> transmissions = carService.SelectTransmission();

        //select FuelType
        List<FuelType> fuelTypes = carService.SelectFuelType();

        //select Features
        List<Features> featureList = carService.SelectFeatures();
        req.setAttribute("cars", listings);
        req.setAttribute("carsnumber",listings.size());
        req.setAttribute("Brands", Brands);
        req.setAttribute("Transmissions", transmissions);
        req.setAttribute("fuelTypes", fuelTypes);
        req.setAttribute("featureList", featureList);
        req.getRequestDispatcher("/partials/gridlisting.jsp").forward(req, resp);

    }
}
