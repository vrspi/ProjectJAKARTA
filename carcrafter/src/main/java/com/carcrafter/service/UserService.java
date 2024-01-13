package com.carcrafter.service;

import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.UserProfile;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserService {
    public UserProfile login(String email, String password){
        String hashedPassword = hashPassword(password);
        try (EntityManager em = JPAUtil.getEntityManager()){
            String jpql = "SELECT u FROM UserProfile u WHERE u.email = :email AND u.password = :hashedPassword";
            TypedQuery<UserProfile> query = em.createQuery(jpql, UserProfile.class);
            query.setParameter("email", email);
            query.setParameter("hashedPassword", hashedPassword);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public void register(String firstName, String lastName, String email, String phone, String address, String hashedPassword) {
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
    }

    public boolean changePassword(String email, String oldPassword, String newPassword) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            String hashedOldPassword = hashPassword(oldPassword);

            String jpql = "SELECT u FROM UserProfile u WHERE u.email = :email AND u.password = :hashedOldPassword";
            TypedQuery<UserProfile> query = em.createQuery(jpql, UserProfile.class);
            query.setParameter("email", email);
            query.setParameter("hashedOldPassword", hashedOldPassword);
            UserProfile user = query.getSingleResult();
            em.getTransaction().begin();
            String hashedNewPassword = hashPassword(newPassword);
            user.setPassword(hashedNewPassword);
            em.persist(user);
            em.getTransaction().commit();
            return true;
        } catch (NoResultException e) {
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    public boolean doesUserExistByEmail(String email) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            String jpql = "SELECT COUNT(u) FROM UserProfile u WHERE u.email = :email";
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            query.setParameter("email", email);
            Long count = query.getSingleResult();
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }
    public UserProfile updateUserProfile(int userId, String firstName, String lastName, String email, String phone, String address) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();

            UserProfile user = em.find(UserProfile.class, userId);
            if (user != null) {
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPhone(phone);
                user.setAddress(address);

                em.merge(user);
                em.getTransaction().commit();
                return user;
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
        return null;
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
