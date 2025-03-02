package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.service.CustomerService;
import com.model.Customer;
import com.doa.CustomerDOA;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDOA customerDAO;

    public CustomerLoginServlet() {
        super();
        this.customerDAO = new CustomerDOA(); 
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = customerDAO.getCustomerByEmail(email);

        if (customer != null && customer.getPassword().equals(password)) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer); // Store full customer object
            session.setAttribute("customerId", customer.getCustomerId()); // Store customerId separately

            // Redirect to bookVehicle.jsp with customerId in the URL
            response.sendRedirect(request.getContextPath() + "/View/bookVehicle.jsp?customerId=" + customer.getCustomerId());
        } else {
            // Failed login
            request.setAttribute("errorMessage", "Invalid Email or Password");
            request.getRequestDispatcher("View/login.jsp").forward(request, response);
        }
    }

}
