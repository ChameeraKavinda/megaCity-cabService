package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BookingService;

/**
 * Servlet implementation class DeleteBookingServlet
 */
@WebServlet("/Admin/DeleteBooking")
public class DeleteBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookingServlet() {
        super();
        this.bookingService=BookingService.getInstance();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DeleteBookingServlet reached");
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        // Delete customer
        boolean isDeleted = bookingService.deleteBooking(bookingId);
        if (isDeleted) {
        	response.sendRedirect(request.getContextPath() + "/Admin/viewAllBooking.jsp");
        } else {
            response.getWriter().write("Delete Failed");
        }
	}

}
