package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Admin;
import com.service.AdminService;

/**
 * Servlet implementation class UpdateAdminServelet
 */
@WebServlet("/Admin/UpdateAdmin")
public class UpdateAdminServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminServelet() {
        super();
        this.adminService=AdminService.getInstance();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            int adminId = Integer.parseInt(request.getParameter("adminId"));
	            String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	            String phoneNumber = request.getParameter("phoneNumber");
	            String role = request.getParameter("role");

	            // Create updated admin object
	            Admin admin = new Admin(adminId, name, email, password, phoneNumber, role);

	            // Update customer
	            boolean isUpdated = adminService.updateAdmin(admin);
	            if (isUpdated) {
	            	response.sendRedirect(request.getContextPath() + "/Admin/viewAllAdmins.jsp");
	            } else {
	                response.getWriter().write("Update Failed");
	            }
	        } catch (NumberFormatException e) {
	            response.getWriter().write("Invalid Admin ID");
	        }
	}

}
