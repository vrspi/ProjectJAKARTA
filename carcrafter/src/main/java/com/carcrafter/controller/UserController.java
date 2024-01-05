package com.carcrafter.controller;

import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.*;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.UserProfile;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jakarta.persistence.EntityManager;

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String errorMessage;
        if ("Login".equals(action)) {

            String login = request.getParameter("email");
            String password = request.getParameter("password");

            if (login.isEmpty() || password.isEmpty()) {
                errorMessage = "Missing required fields !!";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            String hashedPassword = hashPassword(password);

            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();
             //  String jbdl2 = "ALTER TABLE UserProfile " +
                //        "ADD COLUMN role VARCHAR(30), " +
                //        "ADD COLUMN image VARCHAR(100);";
            //    em.createNativeQuery(jbdl2).executeUpdate();

                String jpql = "SELECT COUNT(u) FROM UserProfile u WHERE u.email = :email AND u.password = :hashedPassword";

                TypedQuery<Long> query = em.createQuery(jpql, Long.class);
                query.setParameter("email", login);
                query.setParameter("hashedPassword", hashedPassword);

                Long count = query.getSingleResult();

                if (count > 0) {//etat mliha kolch khedam
                    HttpSession session = request.getSession();
                    session.setAttribute("Login", login);
                    response.sendRedirect("index.jsp");
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }

                em.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace(); // Log the exception
            } finally {
                if (em.isOpen()) {
                    em.close();
                }
            }

            //response.sendRedirect("index.jsp");
        } else if ("Register".equals(action)) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty() || phone.isEmpty() || address.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
                errorMessage = "Missing required fields !!";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }

            // Validate email format
            if (!isValidEmail(email)) {
                request.setAttribute("errorMessage", "Invalid email format !!");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }

            // Validate password criteria and confirm password
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Invalid password or passwords do not match !!");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }

            String hashedPassword = hashPassword(password);

            EntityManager em = JPAUtil.getEntityManager();
            em.getTransaction().begin();

            UserProfile newUser = new UserProfile();
            newUser.setFirstName(firstName);
            newUser.setLastName(lastName);
            newUser.setEmail(email);
            newUser.setPhone(phone);
            newUser.setAddress(address);
            newUser.setPassword(hashedPassword);

            em.persist(newUser);
            em.getTransaction().commit();
            em.close();

            request.setAttribute("successMessage","Registration successful, you can log in now");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedhash = digest.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedhash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}