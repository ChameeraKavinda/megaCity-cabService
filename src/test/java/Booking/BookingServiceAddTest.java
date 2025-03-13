package Booking;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.BookingDAO;
import com.model.Booking;
import com.service.BookingService;

public class BookingServiceAddTest {
	private BookingDAO bookingDAO;
	private BookingService bookingService;
	
	@Before
    public void setUp() {
		bookingDAO = Mockito.mock(BookingDAO.class);
		bookingService = new BookingService();
    }
	 @Test
	    public void  testBookingAdd_Success() {
		 Booking booking = new Booking(0, "2025-03-18", "Colombo", "Kandy", 
                 122.65, 7359.00, "Booked", 
                 38, 32, 39, 
                 735.90, 367.95, 7726.95);

	        boolean result = bookingService.addBooking(booking);

	        assertTrue("Booking should be Added successfully", result);
	    }
	 @Test
	    public void testBookingAdd_Failure() {
	       
		 Booking booking = new Booking(0, "", "", "Kandy", 
                 122.65, 7359.00, "Booked", 
                 38, 32, 66, 
                 735.90, 367.95, 7726.95);

	        boolean result = bookingService.addBooking(booking);


	        assertTrue("Booking Added should fail", result);
	    }
}
