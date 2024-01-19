package com.carcrafter.controller;

import com.carcrafter.model.FAQ;
import com.carcrafter.model.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.text.similarity.LevenshteinDistance;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

@WebServlet("/SendMessageServlet")
public class SendMessageServlet extends HttpServlet {
    private static final double RESEMBLANCE_THRESHOLD = 0.2; // Adjust the threshold as needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the message from the request
        String userMessage = request.getParameter("message");


        // Retrieve FAQ data from the database
        HashMap<String, String> faqMap = new HashMap<>();
        EntityManager em = JPAUtil.getEntityManager();

        try {
            String qlString = "SELECT f FROM FAQ f";
            List<FAQ> faqList = em.createQuery(qlString, FAQ.class)
                    .getResultList();

            for (FAQ faq : faqList) {
                faqMap.put(faq.getQuestion(), faq.getAnswer());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }

        // Process the user's message and find the most closely matched question
        String closestQuestion = findClosestQuestion(userMessage, faqMap.keySet());
// Calculate the percentage of resemblance
        double resemblancePercentage = calculateResemblancePercentage(userMessage, closestQuestion);
// Retrieve the answer based on the resemblance threshold
        String chatbotResponse;
        if (resemblancePercentage >= RESEMBLANCE_THRESHOLD) {
            chatbotResponse = faqMap.getOrDefault(closestQuestion, "I'm sorry, I don't have an answer for that.");
        } else {
            chatbotResponse = "I'm sorry, I don't have an answer for that.";
        }

        // Prepare a JSON-formatted string with chatbot response
        String jsonResponse = "{ \"status\": \"success\", \"message\": \"" + userMessage + "\", \"chatbotresp\": \"" + chatbotResponse + "\" }";

        // Send the JSON response back to the client
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            out.print(jsonResponse);
        }
    }

    // Method to find the most closely matched question using Levenshtein distance
    private String findClosestQuestion(String input, Set<String> questions) {
        return questions.stream()
                .min(Comparator.comparingInt(question -> LevenshteinDistance.getDefaultInstance().apply(question, input)))
                .orElse(null);
    }
    // Method to calculate the percentage of resemblance between two strings
    private double calculateResemblancePercentage(String str1, String str2) {
        int maxLength = Math.max(str1.length(), str2.length());
        int distance = LevenshteinDistance.getDefaultInstance().apply(str1, str2);
        return 1 - (double) distance / maxLength;
    }
}