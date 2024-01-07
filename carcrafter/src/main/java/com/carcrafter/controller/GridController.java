package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import org.hibernate.query.criteria.JpaQueryGroup;

import com.carcrafter.model.ConditionT;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Listing;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ListingGrid")
public class GridController extends HttpServlet{
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Listing> Requet = em.createQuery("SELECT L FROM Listing L", Listing.class);
        List<Listing> Listings = Requet.getResultList();
        TypedQuery<Long> Requet2 = em.createQuery("SELECT count(L) FROM Listing L", Long.class);
        Long Count = (Long) Requet2.getSingleResult();
        req.setAttribute("lwata", Listings);
        req.setAttribute("ChhalMenLotoKayna", Count);
        req.getRequestDispatcher("/partials/omar.jsp").forward(req, resp);

    }
}
