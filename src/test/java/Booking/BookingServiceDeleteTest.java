package Booking;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.BookingDAO;
import com.service.BookingService;

public class BookingServiceDeleteTest {
	private BookingDAO bookingDAO;
	private BookingService bookingService;
	
	@Before
    public void setUp() {
		bookingDAO = Mockito.mock(BookingDAO.class);
		bookingService = new BookingService();
    }
	
	 @Test
	    public void testDeleteBooking_Success() {
	        int bookingId = 60;
	        
	        Mockito.when(bookingDAO.deleteBooking(bookingId)).thenReturn(true);

	        boolean result = bookingService.deleteBooking(bookingId);
	        
	        assertTrue("Booking details deleted successfully", result);
	    }

	    @Test
	    public void testDeleteBooking_Failure() {
	    	int bookingId = 89;
	        
	        Mockito.when(bookingDAO.deleteBooking(bookingId)).thenReturn(true);

	        boolean result = bookingService.deleteBooking(bookingId);
	        
	        
	        assertTrue("Booking details  deleted Failed", result);
	    }

}
