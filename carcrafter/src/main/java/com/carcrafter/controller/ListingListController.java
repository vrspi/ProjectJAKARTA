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

@WebServlet("/ListingList")
public class ListingListController extends HttpServlet {

    private final CarService carService;
    public ListingListController() throws IllegalAccessException, InstantiationException {
        this.carService = ServiceFactory.createService(CarService.class);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
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

            req.setAttribute("Cars", listings);
            req.setAttribute("CountCar", listings.size());
            req.setAttribute("Brands", Brands);
            req.setAttribute("Transmissions", transmissions);
            req.setAttribute("fuelTypes", fuelTypes);
            req.setAttribute("featureList", featureList);
            req.getRequestDispatcher("listing-list.jsp").forward(req, resp);

        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }


}
