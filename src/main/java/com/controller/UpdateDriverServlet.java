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
 * Servlet implementation class UpdateDriverServlet
 */
@WebServlet("/Admin/UpdateDriver")
public class UpdateDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriverService driverService;
       
  
    public UpdateDriverServlet() {
        super();
        this.driverService= DriverService.getInstance();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            int driverId = Integer.parseInt(request.getParameter("driverId"));
	            String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	            String nic = request.getParameter("nic");
	            String phoneNumber = request.getParameter("phoneNumber");
	            String gender = request.getParameter("gender");

	            // Create updated customer object
	            Driver driver = new Driver(driverId, name, email, password, nic, phoneNumber, gender);

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
