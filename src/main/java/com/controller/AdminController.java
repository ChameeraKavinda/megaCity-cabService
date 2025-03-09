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
 * Servlet implementation class AdminController
 */
@WebServlet("/Admin/adminRegister")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
        this.adminService=AdminService.getInstance();
    }
    @Override
    public void init() throws ServletException {
        super.init();
        this.adminService = adminService.getInstance(); // Ensure initialization
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
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phoneNumber=request.getParameter("phoneNumber");
		String role=request.getParameter("role");
		
		Admin admin=new Admin(0, name, email, password, phoneNumber,role);
		
		 try {
	            boolean isRegistered = adminService.registerAdmin(admin);
	            if (isRegistered) {
//	                response.getWriter().write("Successful Registration");
	                response.sendRedirect(request.getContextPath() + "/Admin/adminLogin.jsp"); 
	            } else {
	                response.getWriter().write("Registration Failed");
	            }
	        } catch (Exception e) {
	            response.getWriter().write("Error: " + e.getMessage());
	        }

	        System.out.println("Registration Process Completed");
	}

}

