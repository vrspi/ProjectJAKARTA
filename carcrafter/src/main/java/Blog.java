import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/blog")
public class Blog extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String slugg = request.getParameter("s");

        if (slugg != null && !slugg.isEmpty()) {
            // If blogId is present, retrieve specific blog content
            //BlogContent blogContent = getBlogContentById(blogId);
            String blogPost = "hello";

            if (blogPost != null) {
                request.setAttribute("blogPost", blogPost);
                request.getRequestDispatcher("blog-single.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            request.getRequestDispatcher("blog.jsp").forward(request, response);
        }

    }
}
