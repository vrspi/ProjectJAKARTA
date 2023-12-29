package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import com.carcrafter.model.BodyType;
import com.carcrafter.model.Color;
import com.carcrafter.model.Doors;
import com.carcrafter.model.DriveType;
import com.carcrafter.model.FuelType;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.MakeBrand;
import com.carcrafter.model.Model;
import com.carcrafter.model.Transmission;
import com.carcrafter.model.Year;

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
        if(partialPath.contains("addlist")){
            EntityManager em = JPAUtil.getEntityManager();

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

        TypedQuery<Color> queryColor = em.createQuery("SELECT c FROM Color c", Color.class);
        List<Color> colors = queryColor.getResultList();

        TypedQuery<Doors> queryDoors = em.createQuery("SELECT d FROM Doors d", Doors.class);
        List<Doors> doorsList = queryDoors.getResultList();

        request.setAttribute("bodyTypes", bodyTypes);
        request.setAttribute("makeBrands", makeBrands);
        request.setAttribute("models", models);
        request.setAttribute("years", years);
        request.setAttribute("driveTypes", driveTypes);
        request.setAttribute("transmissions", transmissions);
        request.setAttribute("fuelTypes", fuelTypes);
        request.setAttribute("colors", colors);
        request.setAttribute("doorsList", doorsList);

        em.close();
        request.getRequestDispatcher("/partials/addlisting.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher(partialPath).include(request, response);

        }
        }
}