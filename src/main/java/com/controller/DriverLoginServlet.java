package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.doa.DriverDOA;
import com.model.Driver;

/**
 * Servlet implementation class DriverLoginServlet
 */
@WebServlet("/DriverLoginServlet")
public class DriverLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverDOA driverDOA;

    public DriverLoginServlet() {
        super();
        this.driverDOA = new DriverDOA(); // Initialize DAO instance
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Driver driver = driverDOA.getDriverByEmail(email);

        if (driver != null && driver.getPassword().equals(password)) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("driver", driver);

            // Get driver ID
            int driverId = driver.getDriverId(); // Ensure getId() method exists in the Driver class
            
            // Redirect to dashboard with driverId as a parameter
            response.sendRedirect(request.getContextPath() + "/driverDashboard.jsp?driverId=" + driverId);

        } else {
            // Failed login
            request.setAttribute("errorMessage", "Invalid Email or Password");
            request.getRequestDispatcher("Driver/driverLogin.jsp").forward(request, response);
        }
    }
}
