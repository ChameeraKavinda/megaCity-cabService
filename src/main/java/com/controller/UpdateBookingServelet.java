package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Booking;
import com.service.BookingService;


@WebServlet("/Booking/updateBooking")
public class UpdateBookingServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService;
       
    
    public UpdateBookingServelet() {
        super();
        this.bookingService=BookingService.getInstance();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		    int bookingId = Integer.parseInt(request.getParameter("bookingId"));
		    String bookingDate = request.getParameter("bookingDate");
		    String pickupLocation = request.getParameter("pickupLocation");
		    String dropLocation = request.getParameter("dropLocation");
		    double distance = Double.parseDouble(request.getParameter("distance"));
		    double price = Double.parseDouble(request.getParameter("price"));
		    String bookingStatus = request.getParameter("bookingStatus");
		    int customerId = Integer.parseInt(request.getParameter("customerId"));
		    int driverId = Integer.parseInt(request.getParameter("driverId"));
		    int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
		    double tax = Double.parseDouble(request.getParameter("tax"));
	        double discount = Double.parseDouble(request.getParameter("discount"));
	        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

	        Booking booking = new Booking(bookingId, bookingDate, pickupLocation, dropLocation, distance, price, bookingStatus, customerId, driverId, vehicleId, tax, discount, totalPrice);
	        
		    // Update booking
		    boolean isUpdated = bookingService.updateBooking(booking);
		    
		    if (isUpdated) {
            	response.sendRedirect(request.getContextPath() + "/driverDashboard.jsp?driverId=" + driverId);
		        
		    } else {
		        response.getWriter().write("Update Failed");
		    }
		} catch (NumberFormatException e) {
		    response.getWriter().write("Invalid Input Data");
		    e.printStackTrace();
		}

	}

}
