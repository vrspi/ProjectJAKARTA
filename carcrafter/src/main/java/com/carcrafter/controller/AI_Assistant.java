package com.carcrafter.controller;

import jakarta.servlet.annotation.WebServlet;
import org.json.JSONObject;
import org.json.JSONArray;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet("/Ai")
public class AI_Assistant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user's message from the request
        String userMessage = request.getParameter("message");

        // Call the method to send the API request and get the response
        String apiResponse = sendPostRequest(userMessage);

        // Set response content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Create a JSON object to hold the response
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("chatbotresp", apiResponse);

        // Write the JSON to the response
        System.out.println("Sending response: " + jsonResponse.toString());

        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();

    }


    private String sendPostRequest(String userMessage) {
        StringBuilder response = new StringBuilder();
        try {
            URL url = new URL("https://api.together.xyz/inference");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            conn.setRequestProperty("Authorization", "Bearer 54793ae82c75ae5120d446b68b515e16884e23f2899946b27f885cdfb9ac7da5");
            conn.setDoOutput(true);

            String jsonInputString = "{"
                    + "\"model\": \"togethercomputer/llama-2-70b-chat\","
                    + "\"max_tokens\": 512,"
                    + "\"prompt\": \""
                    + "<s>[INST]\\n"
                    + "Car Crafter emerges as a distinguished force in the automotive industry anchoring its presence in Oujda and redefining the car-buying experience with unparalleled dedication to quality and customer satisfaction.Operating from the heart of Rue Al Houria Hay Al Hikma Car Crafter offers a seamless integration of luxury performance and innovation showcased in their exquisite selection of vehicles including coveted brands like Ferrari Hyundai Mercedes Benz Toyota BMW Nissan Lamborghini Urus Bugatti Chiron, and Mercedes G900. With a legacy spanning 15 years, Car Crafter has solidified its reputation as Oujda's largest car dealer marketplace, not only by providing an extensive array of top-notch vehicles but also through a comprehensive suite of services designed to meet every automotive need.The company's commitment to excellence is further exemplified by its robust service offerings. From brake and repair services, engine and transmission maintenance, to advanced heating & AC repairs, engine upgrades, and a broad selection of quality tires and genuine auto parts, Car Crafter ensures that every vehicle remains at its peak performance. Moreover, the company excels in auto electric services, guaranteeing the flawless operation of the vehicle's electrical systems.Car Crafter's foundation is deeply rooted in its core values of authenticity and dedication, ensuring that every client's voice is heard and valued. This client-centric approach is further supported by a team of highly skilled engineers, including CHIBANI Mohammed Amine, MEZIANI Youssef, BENNANI DOSSE Omar, DAALA Khaireddine, KADI Mohammed, ABBAOUI Khalil, HASHAS Jad El Mawla, and BAZHAR Ayoub, who are steadfast in their commitment to delivering unparalleled service and expertise.In addition to its impressive vehicle selection and service offerings, Car Crafter is committed to maintaining the privacy and security of its clients. The company's Privacy Policy is a testament to its dedication to safeguarding personal information, employing industry-standard security measures and respecting the confidentiality of user data. Furthermore, the Terms of Service and the comprehensive FAQ section reflect Car Crafter's transparency and its endeavor to address client inquiries and concerns promptly and efficiently.With a vision that transcends the ordinary, Car Crafter invites clients to explore the myriad of possibilities it offers. From the pursuit of the dream car to the assurance of quality service and the guarantee of a secure and transparent process, Car Crafter stands as a beacon of excellence and innovation in the automotive sector. The journey with Car Crafter is not just about purchasing a vehicle; it's about embarking on a journey defined by quality, trust, and an unwavering commitment to customer satisfaction.\\n"
                    + "answer any question from this text and don't mention you are reading from a text, don't give additional information answer just what the user ask for\\n"
                    + "\\n"
                    + "\\n"
                    + "user\\n" + userMessage + "\\n"
                    + "assistant [/INST]\\n\","
                    + "\"request_type\": \"language-model-inference\","
                    + "\"temperature\": 0.7,"
                    + "\"top_p\": 0.7,"
                    + "\"top_k\": 50,"
                    + "\"repetition_penalty\": 1,"
                    + "\"stop\": [\"[/INST]\", \"</s>\"],"
                    + "\"negative_prompt\": \"\","
                    + "\"type\": \"chat\""
                    + "}";

            try(OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            InputStream is;
            if (responseCode >= HttpURLConnection.HTTP_BAD_REQUEST) {
                is = conn.getErrorStream();
            } else {
                is = conn.getInputStream();
            }

            StringBuilder rawResponse = new StringBuilder();
            try(BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
                String responseLine = null;
                while ((responseLine = br.readLine()) != null) {
                    rawResponse.append(responseLine.trim());
                }
            }

            // Parse the raw response string into a JSONObject
            JSONObject jsonResponse = new JSONObject(rawResponse.toString());

            // Navigate through the JSON structure to get the text field
            JSONArray choices = jsonResponse.getJSONObject("output").getJSONArray("choices");
            if (choices != null && choices.length() > 0) {
                // Assuming you want the text of the first choice
                String text = choices.getJSONObject(0).getString("text");
                response.append(text);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions properly in real code
            response = new StringBuilder("{\"error\": \"" + e.getMessage() + "\", \"detailedError\": \"" + e.toString() + "\"}");
        }
        return response.toString();
    }
    // Method to handle GET method request, can redirect to POST or handle separately
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
