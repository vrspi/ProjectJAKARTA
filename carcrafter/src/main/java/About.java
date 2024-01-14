import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/about")
public class About extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //todo: add variable to check in the about section to hide the button when use in the about page
        request.setAttribute("is in about page", true);
        request.getRequestDispatcher("about.jsp").forward(request, response);
    }
}
