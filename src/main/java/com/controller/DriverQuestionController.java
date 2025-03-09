package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.DriverService;

@WebServlet("/Driver/DriverQuestionController")
public class DriverQuestionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverService driverService;

    public DriverQuestionController() {
        super();
        this.driverService = DriverService.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String license = request.getParameter("license");
            int experience = Integer.parseInt(request.getParameter("experience"));
            String ownVehicle = request.getParameter("ownVehicle");
            String preferredWorkType = request.getParameter("preferredWorkType");

            // Save the driver's questionnaire responses
            boolean isUpdated = driverService.saveDriverQuestionnaire(email, license, experience, ownVehicle, preferredWorkType);
            
            if (isUpdated) {
                // Fetch the driverId from the database using email
                int driverId = driverService.getDriverIdByEmail(email);
                
                if (driverId > 0) {
                    // Redirect to the vehicle registration page with driverId
                    response.sendRedirect(request.getContextPath() + "/Driver/driverAddVehicle.jsp?driverId=" + driverId);
                } else {
                    response.getWriter().write("Error: Unable to retrieve driver ID.");
                }
            } else {
                response.getWriter().write("Failed to save driver details.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
