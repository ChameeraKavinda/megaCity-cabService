package com.service;

import com.doa.BookingDAO;
import com.model.Booking;
import com.model.Customer;

public class BookingService {
	 private static BookingService instance;
	    private BookingDAO bookingDAO;

	    public BookingService() {
	        this.bookingDAO = new BookingDAO();
	    }

	    public static BookingService getInstance() {
	        if (instance == null) {
	            synchronized (BookingService.class) {
	                if (instance == null) {
	                    instance = new BookingService();
	                }
	            }
	        }
	        return instance;
	    }

	 
	    
	    public boolean addBooking(Booking booking) {
	        boolean isBooking = bookingDAO.addBooking(booking);
	        if (!isBooking) {
	            System.err.println("Booking Added Failed");
	        }
	        return isBooking;
	    }
	    
	    public boolean updateBooking(Booking booking) {
	        return bookingDAO.updateBooking(booking);
	    }

	    // **Delete Customer**
	    public boolean deleteBooking(int bookingId) {
	        return bookingDAO.deleteBooking(bookingId);
	    }
	    


}
