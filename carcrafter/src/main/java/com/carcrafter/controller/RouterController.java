package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import com.carcrafter.model.*;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RouterController")
public class RouterController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String partialPath = request.getParameter("partial");
        if(partialPath.contains("Messages.jsp")){
            request.getRequestDispatcher("/Messages").forward(request, response);

        }
        else if(partialPath.contains("profilelisting.jsp")){
            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();
                TypedQuery<Listing> query = em.createQuery("SELECT L FROM Listing L", Listing.class);
                List<Listing> listings = query.getResultList();
                request.setAttribute("Cars", listings);
                request.getRequestDispatcher("/partials/profilelisting.jsp").forward(request, response);
                em.getTransaction().commit();
            } finally {
                if (em.isOpen()) {
                    em.close();
                }
            }
        }
        else if(partialPath.contains("addlist")){
            EntityManager em = JPAUtil.getEntityManager();
        try{

            if( request.getAttribute("listingTitle")==null)
            {
                request.setAttribute("listingTitle","");
                request.setAttribute("price","");
                request.setAttribute("mileage","");
                request.setAttribute("engineSize","");
                request.setAttribute("vin","");
                request.setAttribute("tags","");
                request.setAttribute("description","");

                request.setAttribute("selectedcondition","-1");
                request.setAttribute("selectedbodyType","-1");
                request.setAttribute("selectedmakeBrand","-1");
                request.setAttribute("selectedmodel","-1");
                request.setAttribute("selecteddriveType","-1");
                request.setAttribute("selectedyear","-1");
                request.setAttribute("selectedtransmission","-1");
                request.setAttribute("selectedfuelType","-1");
                request.setAttribute("selectedcylinders","-1");
                request.setAttribute("selectedcolor","-1");
                request.setAttribute("selecteddoors","-1");


                request.setAttribute("Name","kadi");
                request.setAttribute("Email","kadi@gmail.com");
                request.setAttribute("Phone","0682653265");

            }



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
            request.getRequestDispatcher("/partials/addlisting.jsp").forward(request, response);
        }catch (Exception ex){
            System.out.println(ex.getMessage());        }
        }else{
            request.getRequestDispatcher(partialPath).include(request, response);

        }
        }
}