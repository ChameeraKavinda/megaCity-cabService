package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Customer;
import com.service.CustomerService;

/**
 * Servlet implementation class UpdateCustomerProfile
 */
@WebServlet("/View/customerProfile")
public class UpdateCustomerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService customerService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerProfile() {
        super();
        this.customerService=CustomerService.getInstance();
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
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            int customerId = Integer.parseInt(request.getParameter("customerId"));
	            String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	            String nicNumber = request.getParameter("nicNumber");
	            String phoneNumber = request.getParameter("phoneNumber");
	            String address = request.getParameter("address");

	            // Create updated customer object
	            Customer customer = new Customer(customerId, name, email, password, nicNumber, phoneNumber, address);

	            // Update customer
	            boolean isUpdated = customerService.updateCustomer(customer);
	            if (isUpdated) {
	            	response.sendRedirect(request.getContextPath() + "/index.jsp?customerId=" +customerId);
	            } else {
	                response.getWriter().write("Update Failed");
	            }
	        } catch (NumberFormatException e) {
	            response.getWriter().write("Invalid Customer ID");
	        }
	    }
	}
