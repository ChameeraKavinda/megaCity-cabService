package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminService;

/**
 * Servlet implementation class DeleteAdminServelet
 */
@WebServlet("/Admin/DeleteAdmin")
public class DeleteAdminServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdminServelet() {
        super();
        this.adminService=AdminService.getInstance();
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminId = Integer.parseInt(request.getParameter("adminId"));

        // Delete customer
        boolean isDeleted = adminService.deleteAdmin(adminId);
        if (isDeleted) {
        	response.sendRedirect(request.getContextPath() + "/Admin/viewAllAdmins.jsp");
        } else {
            response.getWriter().write("Delete Failed");
        }
	}

}
