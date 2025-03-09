package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doa.AdminDOA;
import com.model.Admin;
import com.model.Customer;
import com.service.AdminService;

/**
 * Servlet implementation class AdminLoginServelet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDOA adminDOA;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServelet() {
        super();
        // TODO Auto-generated constructor stub
        this.adminDOA= new AdminDOA();
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
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    Admin admin = adminDOA.getAdminByEmail(email);

	    if (admin != null && admin.getPassword().equals(password)) {
	        // Successful login
	        HttpSession session = request.getSession();
	        session.setAttribute("admin", admin);
	        
	        int adminId = admin.getAdminId(); 

	        response.sendRedirect("Admin/viewAllAdmins.jsp?adminId=" + adminId);
	    } else {
	        // Failed login
	        request.setAttribute("errorMessage", "Invalid Email or Password");
	        request.getRequestDispatcher("Admin/adminLogin.jsp").forward(request, response);
	    }
	}


}
