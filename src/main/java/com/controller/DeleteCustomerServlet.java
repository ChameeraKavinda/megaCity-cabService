package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.service.CustomerService;

@WebServlet("/Admin/DeleteCustomer")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    public DeleteCustomerServlet() {
        super();
        this.customerService = CustomerService.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));

        // Delete customer
        boolean isDeleted = customerService.deleteCustomer(customerId);
        if (isDeleted) {
        	response.sendRedirect(request.getContextPath() + "/Admin/veiwAllCustomers.jsp");
        } else {
            response.getWriter().write("Delete Failed");
        }
    }
}
