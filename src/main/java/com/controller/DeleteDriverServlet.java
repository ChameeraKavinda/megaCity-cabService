package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.DriverService;

/**
 * Servlet implementation class DeleteDriverServlet
 */
@WebServlet("/Admin/DeleteDriver")
public class DeleteDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private DriverService driverService;

  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDriverServlet() {
        super();
        this.driverService=DriverService.getInstance();
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
		int driverId = Integer.parseInt(request.getParameter("driverId"));

        // Delete customer
        boolean isDeleted = driverService.deleteDriver(driverId);
        if (isDeleted) {
        	response.sendRedirect(request.getContextPath() + "/Admin/viewAllDrivers.jsp");
        } else {
            response.getWriter().write("Delete Failed");
        }
	}

}
