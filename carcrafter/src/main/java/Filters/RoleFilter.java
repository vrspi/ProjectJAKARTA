package Filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class RoleFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code here
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        String requestedUri = req.getRequestURI();


        // Corrected the string comparison
        if (session.getAttribute("role") != null && "admin".equals(session.getAttribute("role"))) {
            // User has admin role, proceed with the request
            chain.doFilter(request, response);
        } else {
            // Save the requested URL for later use after successful login
            if (session == null) {
                session = req.getSession(true);
            }
            session.setAttribute("redirectTo", requestedUri);

            // User is not logged in, redirect to login page
            res.sendRedirect("Login.jsp");
        }
    }

    public void destroy() {
        // Cleanup code here
    }
}
