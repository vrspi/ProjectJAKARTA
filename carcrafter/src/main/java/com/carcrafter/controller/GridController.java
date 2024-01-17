package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import com.carcrafter.model.*;
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
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Listing> Requet = em.createQuery("SELECT L FROM Listing L", Listing.class);
        List<Listing> Listings = Requet.getResultList();
        TypedQuery<Long> Requet2 = em.createQuery("SELECT count(L) FROM Listing L", Long.class);

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
        Long Count = (Long) Requet2.getSingleResult();
        req.setAttribute("cars", Listings);
        req.setAttribute("carsnumber", Count);
        req.setAttribute("Brands", Brands);
        req.setAttribute("Transmissions", transmissions);
        req.setAttribute("fuelTypes", fuelTypes);
        req.setAttribute("featureList", featureList);
        req.getRequestDispatcher("/partials/gridlisting.jsp").forward(req, resp);

    }
}
