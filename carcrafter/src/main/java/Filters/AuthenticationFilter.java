package Filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthenticationFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code here
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("Email") != null) {
            // User is logged in, proceed with the request
            chain.doFilter(request, response);
        } else {
            // User is not logged in, redirect to login page
            res.sendRedirect("Login.jsp");
        }
    }

    public void destroy() {
        // Cleanup code here
    }
}
