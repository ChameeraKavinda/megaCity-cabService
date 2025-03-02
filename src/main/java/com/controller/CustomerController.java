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
 * Servlet implementation class CustomerController
 */
@WebServlet("/View/customerRegister")
public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    /**
     * Servlet constructor
     */
    public CustomerController() {
        super();
        this.customerService = CustomerService.getInstance(); // Initialize customerService
    }

    @Override
    public void init() throws ServletException {
        super.init();
        this.customerService = CustomerService.getInstance(); // Ensure initialization
    }

    /**
     * Handles GET requests
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * Handles POST requests for customer registration
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nicNumber = request.getParameter("nicNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        // Create Customer object
        Customer customer = new Customer(0, name, email, password, nicNumber, phoneNumber, address);

        try {
            boolean isRegistered = customerService.registerCustomer(customer);
            if (isRegistered) {
//                response.getWriter().write("Successful Registration");
                response.sendRedirect(request.getContextPath() + "/View/login.jsp"); 
                
            } else {
                response.getWriter().write("Registration Failed");
            }
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }

        System.out.println("Registration Process Completed");
    }
}
