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
 * Servlet implementation class DriverController
 */
@WebServlet("/Driver/driverRegister")
public class DriverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriverService driverService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverController() {
        super();
        // TODO Auto-generated constructor stub
        this.driverService=DriverService.getInstance();
        }
    @Override
    public void init() throws ServletException{
    	super.init();
    	this.driverService=DriverService.getInstance();
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    try {
	        String name = request.getParameter("name");
	        String email=request.getParameter("email");
	        String password =request.getParameter("password");
	        String nic = request.getParameter("nic");
	        String phoneNumber = request.getParameter("phoneNumber");
	        String gender = request.getParameter("gender");


	        // Debugging: Print values to check if phoneNumber is null
	        System.out.println("Name: " + name);
	        System.out.println("Email: " + email);
	        System.out.println("Password : " + password);
	        System.out.println("NIC: " + nic);
	        System.out.println("Phone Number: " + phoneNumber);
	        System.out.println("Gender: " + gender);


	        // If phoneNumber is null, return an error message
	        if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
	            response.getWriter().write("Error: Phone number cannot be empty!");
	            return;
	        }

	        Driver driver = new Driver(0, name,email,password, nic, phoneNumber,gender);
	        boolean isRegistered = driverService.registerDriver(driver);

	        if (isRegistered) {
	            response.sendRedirect(request.getContextPath() + "/Driver/driverQuestion.jsp?email=" + email);
	        } else {
	            response.getWriter().write("Registration Failed");
	        }

	    } catch (Exception e) {
	        response.getWriter().write("Error: " + e.getMessage());
	        e.printStackTrace();  // Print the stack trace for debugging
	    }
	}


}
