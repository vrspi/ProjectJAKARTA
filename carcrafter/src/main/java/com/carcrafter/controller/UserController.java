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
import java.util.List;
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

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (email.isEmpty() || password.isEmpty()) {
                errorMessage = "Missing required fields !!";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            String hashedPassword = hashPassword(password);

            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();
                String jpql = "SELECT u FROM UserProfile u WHERE u.email = :email AND u.password = :hashedPassword";

                TypedQuery<UserProfile> query = em.createQuery(jpql, UserProfile.class);
                query.setParameter("email", email);
                query.setParameter("hashedPassword", hashedPassword);

                List<UserProfile> users = query.getResultList();

                if (!users.isEmpty()) {
                    UserProfile user = users.get(0);
                    HttpSession session = request.getSession();
                    session.setAttribute("id", user.getId());
                    session.setAttribute("FullName", user.getFirstName() + " " + user.getLastName());
                    session.setAttribute("FirstName", user.getFirstName());
                    session.setAttribute("LastName", user.getLastName());
                    session.setAttribute("Email", user.getEmail());
                    session.setAttribute("Phone", user.getPhone());
                    session.setAttribute("role", user.getRole());

                    String redirectTo = (String) session.getAttribute("redirectTo");
                    if (redirectTo != null) {
                        session.removeAttribute("redirectTo");
                        response.sendRedirect(redirectTo);
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
                em.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (em.isOpen()) {
                    em.close();
                }
            }

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
        else if ("Logout".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate();
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        else if ("verifyEmail".equals(action)) {
            String email = request.getParameter("email");

            if (email == null || email.isEmpty()) {
                errorMessage = "Please enter an email address.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
                return;
            }

            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();
                String jpql = "SELECT COUNT(u) FROM UserProfile u WHERE u.email = :email";
                TypedQuery<Long> query = em.createQuery(jpql, Long.class);
                query.setParameter("email", email);
                Long count = query.getSingleResult();
                if (count > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("Email",email);
                    request.getRequestDispatcher("reset-password.jsp").forward(request, response);
                } else {
                    errorMessage = "No account found with that email address.";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
                }

                em.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (em.isOpen()) {
                    em.close();
                }
            }
        }
        else if ("changePassword".equals(action)) {
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("Email");

            if (oldPassword == null || newPassword == null || confirmPassword == null ||
                    oldPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
                errorMessage = "All fields are required.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);
                return;
            }

            if (!newPassword.equals(confirmPassword)) {
                errorMessage = "New password and confirmation do not match.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);
                return;
            }

            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();
                String hashedOldPassword = hashPassword(oldPassword);

                String jpql = "SELECT u FROM UserProfile u WHERE u.email = :email AND u.password = :hashedOldPassword";
                TypedQuery<UserProfile> query = em.createQuery(jpql, UserProfile.class);
                query.setParameter("email", email);
                query.setParameter("hashedOldPassword", hashedOldPassword);

                List<UserProfile> users = query.getResultList();

                if (!users.isEmpty()) {
                    UserProfile user = users.get(0);
                    String hashedNewPassword = hashPassword(newPassword);
                    user.setPassword(hashedNewPassword);
                    em.persist(user);

                    em.getTransaction().commit();
                    request.setAttribute("successMessage", "Password successfully changed.");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                } else {
                    errorMessage = "Invalid current password.";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("reset-password.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
            } finally {
                if (em.isOpen()) {
                    em.close();
                }
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