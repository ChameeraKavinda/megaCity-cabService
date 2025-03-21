package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Driver;
import com.service.DriverService;

/**
 * Servlet implementation class UpdateDriverProfile
 */
@WebServlet("/Driver/profileupdate")
public class UpdateDriverProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriverService driverService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDriverProfile() {
        super();
        this.driverService=DriverService.getInstance();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String nic = request.getParameter("nic");
            String phoneNumber = request.getParameter("phoneNumber");
            String availability = request.getParameter("availability");

            // Create updated customer object
            Driver driver = new Driver(driverId, name, email, password, nic, phoneNumber, availability);

            // Update driver
            boolean isUpdated = driverService.updateDriver(driver);
            if (isUpdated) {
            	response.sendRedirect(request.getContextPath() + "/driverDashboard.jsp?driverId=" + driverId);
            } else {
                response.getWriter().write("Update Failed");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid Driver ID");
        }
}

}

