import com.carcrafter.model.FAQ;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Message;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.List;

@WebServlet("/live_contact")

public class live_Contact extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // Forward the request to the JSP
        request.getRequestDispatcher("live_contact.jsp").forward(request, response);
    }

}
