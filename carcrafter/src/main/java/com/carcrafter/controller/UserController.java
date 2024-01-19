package com.carcrafter.controller;

import com.carcrafter.Factory.ServiceFactory;
import com.carcrafter.service.UserService;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import com.carcrafter.model.UserProfile;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Part;

import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100)
public class UserController extends HttpServlet {

    private final UserService userService;

    public UserController() throws IllegalAccessException, InstantiationException {
        this.userService = ServiceFactory.createService(UserService.class);
    }
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("Login".equals(action)) {
            handleLogin(request, response);
        }else if("Register".equals(action)){
            handleRegister(request,response);
        }
        else if("verifyEmail".equals(action)){
            handleUserExistByEmail(request,response);
        }
        else if("changePassword".equals(action)){
            handleChangePassword(request,response,"reset-password.jsp","Login","errorMessage","successMessage");
        }
        else if("updateProfile".equals(action)){
            handleUpdateProfile(request,response);
        }
        else if("changePasswordInDashboard".equals(action)){
            handleChangePassword(request,response,"Profile","Profile","errorMessageD","successMessageD");
        }
        else{
            handleUpdatePhotoProfile(request,response);
        }
    }



    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean rememberMe = request.getParameter("remember") != null;
        HttpSession session = request.getSession();
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            session.setAttribute("errorMessage", "Email and password must not be empty");
            response.sendRedirect("Login");
            return;
        }
        try {
            UserProfile user = userService.login(email, password);
            if (user != null) {
                session.setAttribute("id", user.getId());
                session.setAttribute("FullName", user.getFirstName() + " " + user.getLastName());
                session.setAttribute("FirstName", user.getFirstName());
                session.setAttribute("LastName", user.getLastName());
                session.setAttribute("Email", user.getEmail());
                session.setAttribute("Phone", user.getPhone());
                session.setAttribute("role", user.getRole());
                session.setAttribute("Image", user.getImage());
                session.setAttribute("Address", user.getAddress());

                String referers = (String) session.getAttribute("URLCARLISTING");

                if (referers != null) {
                    // Step 2: Check if the referer URL is from '/carcrafter/singlecar'
                    if (referers.contains("http://localhost:8080/carcrafter/partials/singlecar.jsp?id=")) {
                        String modifiedUrl = referers.replace("/partials/singlecar.jsp", "/singlecar");
                        session.removeAttribute("URLCARLISTING");
                        response.sendRedirect(modifiedUrl);
                    }
                }else{
                    String lINK = (String) session.getAttribute("redirectTo");
                    if (lINK != null) {
                        response.sendRedirect(lINK);
                    } else {
                        response.sendRedirect("Home");
                    }
                }
            } else {
                session.setAttribute("errorMessage", "Invalid email or password");
                response.sendRedirect("Login");
            }
        } catch (Exception e) {
            session.setAttribute("errorMessage", "An error occurred. Please try again.");
            response.sendRedirect("Login");
        }
    }
    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession();

        if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty() || phone.isEmpty() || address.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
            session.setAttribute("errorMessage", "Missing required fields !!");
            response.sendRedirect("Register");
            return;
        }
        if (!isValidEmail(email)) {
            session.setAttribute("errorMessage", "Invalid email format !!");
            response.sendRedirect("Register");
            return;
        }
        if (!password.equals(confirmPassword)) {
            session.setAttribute("errorMessage", "Invalid password or passwords do not match !!");
            response.sendRedirect("Register");
            return;
        }
        String hashedPassword = hashPassword(password);
        userService.register(firstName,lastName,email,phone,address,hashedPassword);
        session.setAttribute("successMessage", "Registration successful, you can log in now");
        response.sendRedirect("Login");
    }

    private void handleChangePassword(HttpServletRequest request, HttpServletResponse response,String redirictionError,String redirictionSucces,String nameMessageError,String nameMessageSuccess) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("Email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (oldPassword == null || newPassword == null || confirmPassword == null ||
                oldPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            session.setAttribute(nameMessageError, "All fields are required.");
            response.sendRedirect(redirictionError);
            return;
        }
        if (!newPassword.equals(confirmPassword)) {
            session.setAttribute(nameMessageError, "New password and confirmation do not match.");
            response.sendRedirect(redirictionError);
            return;
        }
        if(userService.changePassword(email, oldPassword, newPassword)){
            session.setAttribute(nameMessageSuccess, "Password successfully changed.");
            response.sendRedirect(redirictionSucces);
        }
        else{
            session.setAttribute(nameMessageError, "Invalid current password.");
            response.sendRedirect(redirictionError);
        }
    }
    private void handleUserExistByEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        if (email == null || email.isEmpty()) {
            session.setAttribute("errorMessage", "Please enter an email address.");
            response.sendRedirect("ForgotPassword");
            return;
        }
        if (userService.doesUserExistByEmail(email)) {
            session.setAttribute("Email", email);
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        } else {
            session.setAttribute("errorMessage", "No account found with that email address.");
            response.sendRedirect("ForgotPassword");
        }
    }
    private void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("id");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            UserProfile updatedUser = userService.updateUserProfile(userId, firstName, lastName, email, phone, address);
            if (updatedUser != null) {
                session.setAttribute("user",updatedUser);

                session.setAttribute("FullName", updatedUser.getFirstName() + " " + updatedUser.getLastName());
                session.setAttribute("FirstName", updatedUser.getFirstName());
                session.setAttribute("LastName", updatedUser.getLastName());
                session.setAttribute("Email", updatedUser.getEmail());
                session.setAttribute("Phone", updatedUser.getPhone());
                session.setAttribute("Address", updatedUser.getAddress());
                session.setAttribute("successMessage", "Profile updated successfully.");
                response.sendRedirect("Profile");
            } else {
                session.setAttribute("errorMessage", "User not found or update failed.");
                response.sendRedirect("Profile");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void handleUpdatePhotoProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        String fileName = userId + "_" + filePart.getSubmittedFileName();
        String basePath = getServletContext().getRealPath("/");
        String uploadPath = basePath + "assets/upload/img/user/" + fileName;
        filePart.write(uploadPath);

        String devPath = "C:\\Users\\jouj9\\OneDrive\\Bureau\\EHEI S3&S4\\Projet Java\\ProjectJAKARTA\\carcrafter\\src\\main\\webapp\\assets\\upload\\img\\user\\" + fileName;

        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(devPath)) {
            byte[] buffer = new byte[fileContent.available()];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        if (userId != null) {
            try {
                boolean success = userService.updatePhotoProfile(userId, fileName);
                if (success) {
                    session.setAttribute("Image", fileName);
                    session.setAttribute("successMessage", "Image ajoutée avec succès");
                    response.sendRedirect("Profile");
                } else {
                    session.setAttribute("errorMessage", "Failed to update image or user not found.");
                    response.sendRedirect("Profile");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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