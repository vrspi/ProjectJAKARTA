package com.carcrafter.controller;

import com.carcrafter.model.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Id;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;


@WebServlet("/singlecar")
public class SingleCarController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if(session.getAttribute("id") != null){
            int currentUserId = (int)session.getAttribute("id");
            request.setAttribute("id", currentUserId); 

        }else{
            request.setAttribute("id", null); 

        }
       
        String ID =  request.getParameter("id");
        if(ID == null){
            response.sendRedirect("Home");
            // request.getRequestDispatcher("/index").forward(request, response);
        }
        EntityManager em = JPAUtil.getEntityManager();

        TypedQuery<Listing> queryListing = em.createQuery("SELECT c FROM Listing c where c.listingID = " + ID, Listing.class);
        Listing Listing = queryListing.getSingleResult();
        request.setAttribute("Car", Listing);

        // TypedQuery<BodyType> queryBodyType = em.createQuery("SELECT f FROM BodyType f", BodyType.class);
        // List<BodyType> BodytypeList = queryBodyType.getResultList();
        // request.setAttribute("BodytypeList", BodytypeList);

        // TypedQuery<Transmission> queryTransmission = em.createQuery("SELECT f FROM Transmission f", Transmission.class);
        // List<Transmission> TransmissionList = queryTransmission.getResultList();
        // request.setAttribute("TransmissionList", TransmissionList);

        // TypedQuery<FuelType> queryFuelType = em.createQuery("SELECT f FROM FuelType f", FuelType.class);
        // List<FuelType> FuelTypeList = queryFuelType.getResultList();
        // request.setAttribute("FuelTypeList", FuelTypeList);

        // TypedQuery<Features> queryFeatures = em.createQuery("SELECT f FROM Features f", Features.class);
        // List<Features> FeaturesList = queryFeatures.getResultList();
        // request.setAttribute("FeaturesList", FeaturesList);

        request.getRequestDispatcher("/partials/singlecar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        Message newMessage = new Message();
        em.getTransaction().begin();
        newMessage.setSenderID(Integer.parseInt(req.getParameter("currentID")));
        newMessage.setReceiverID(Integer.parseInt(req.getParameter("AdminID")));
        newMessage.setContent(req.getParameter("message"));
        newMessage.setTimestamp(LocalDateTime.now());
        em.persist(newMessage);
        em.getTransaction().commit();
        
        doGet(req, resp);
    }
}