import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/blog/*")
public class Blog extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Extract the slug from the request URL
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // If no slug is present, redirect to the main blog page
            request.getRequestDispatcher("blog.jsp").forward(request, response);
        } else {
            // Remove the leading '/'
            String blogSlug = pathInfo.substring(1);

            // Retrieve the blog post from the service
            String blogPost = "hello";

            if (blogPost != null) {
                request.setAttribute("blogPost", blogPost);
                response.sendRedirect(request.getContextPath() + "/blog-single.jsp");
                //request.getRequestDispatcher("/blog-single.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        }
    }
}
