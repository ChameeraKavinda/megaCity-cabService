package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Customer;
import com.service.CustomerService;

@WebServlet("/Admin/UpdateCustomer")
public class UpdateCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    public UpdateCustomerServlet() {
        super();
        this.customerService = CustomerService.getInstance();
    }

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
            	response.sendRedirect(request.getContextPath() + "/Admin/veiwAllCustomers.jsp");
            } else {
                response.getWriter().write("Update Failed");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid Customer ID");
        }
    }
}
