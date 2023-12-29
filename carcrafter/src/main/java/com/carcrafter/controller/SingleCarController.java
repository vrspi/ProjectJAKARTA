package com.carcrafter.controller;

import java.io.IOException;
import java.util.List;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Listing;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/SingleCar")
public class SingleCarController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        request.getRequestDispatcher("SingleCar.jsp").forward(request, response);
    }
}