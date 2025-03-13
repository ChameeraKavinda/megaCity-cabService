package Booking;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.BookingDAO;
import com.model.Booking;
import com.model.Driver;
import com.service.BookingService;

public class BookingServiceUpdateTest {
	private BookingDAO bookingDAO;
	private BookingService bookingService;
	
	@Before
    public void setUp() {
		bookingDAO = Mockito.mock(BookingDAO.class);
		bookingService = new BookingService();
    }
	
	@Test
    public void testUpdateBooking_Failure() {
		 Booking booking = new Booking(100, "2025-03-18", "Colombo", "Kandy", 
                 122.65, 7359.00, "Canceled", 
                 38, 32, 39, 
                 735.90, 367.95, 7726.95);
         
         Mockito.when(bookingDAO.updateBooking(booking)).thenReturn(true);

         boolean result = bookingService.updateBooking(booking);
         
         assertTrue("Booking details should be updated Unsuccessfully", result);
    }
    
    @Test
    public void testUpdateBooking_Success() {
    	 Booking booking = new Booking(60, "2025-03-18", "Trinco", "Kandy", 
                 122.65, 7359.00, "Canceled", 
                 38, 32, 39, 
                 735.90, 367.95, 7726.95);
        
    	 
         Mockito.when(bookingDAO.updateBooking(booking)).thenReturn(true);

         boolean result = bookingService.updateBooking(booking);
        
        assertTrue("Booking details should be updated successfully", result);
    }

}
