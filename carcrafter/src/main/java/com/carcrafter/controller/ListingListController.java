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

        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        try {

            //select voitures
            TypedQuery<Listing> query = em.createQuery("SELECT L FROM Listing L", Listing.class);
            List<Listing> listings = query.getResultList();


            //select brands
            TypedQuery<MakeBrand> queryBrands = em.createQuery("SELECT L FROM MakeBrand L", MakeBrand.class);
            List<MakeBrand> Brands = queryBrands.getResultList();

            //select transmission
            TypedQuery<Transmission> querytransmission = em.createQuery("SELECT L FROM Transmission L", Transmission.class);
            List<Transmission> transmissions = querytransmission.getResultList();

            //select FuelType
            TypedQuery<FuelType> queryFuelType = em.createQuery("SELECT f FROM FuelType f", FuelType.class);
            List<FuelType> fuelTypes = queryFuelType.getResultList();

            //select Features
            TypedQuery<Features> querFeatures = em.createQuery("SELECT f FROM Features f", Features.class);
            List<Features> featureList = querFeatures.getResultList();

            req.setAttribute("Cars", listings);
            req.setAttribute("CountCar", listings.size());
            req.setAttribute("Brands", Brands);
            req.setAttribute("Transmissions", transmissions);
            req.setAttribute("fuelTypes", fuelTypes);
            req.setAttribute("featureList", featureList);
            req.getRequestDispatcher("listing-list.jsp").forward(req, resp);

            em.getTransaction().commit();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }


}
