package com.carcrafter.controller;

import jakarta.servlet.ServletException;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("Login".equals(action)) {
            // Process login
            // Implement your login logic here
            response.sendRedirect("home"); // Redirect to home page or dashboard
        } else if ("Register".equals(action)) {
            // Process signup
            // Implement your signup logic here
            response.sendRedirect("login"); // Redirect to login page
        }
    }
}