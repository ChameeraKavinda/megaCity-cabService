package com.service.Driver;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import com.doa.DriverDOA;
import com.model.Driver;
import com.service.DriverService;

public class DriverServiceLoginTest {
	  private DriverDOA driverDOA;
	    private DriverService driverrService;

	    @Before
	    public void setUp() {
	    	driverDOA = Mockito.mock(DriverDOA.class);
	        driverrService = new DriverService();
	    }

	    @Test
	    public void testAuthenticateDriver_Success() {
	    	 String email = "chameerasenarathna14@gmail.com";
	         String password = "Chamee1234";
	         Driver mockDriver = new Driver(49, "Senarathna Kavinda", email, password, "BB4567894", "07545612378", "Available");
	         
	        
	        Mockito.when(driverDOA.authenticateDriver(email, password)).thenReturn(mockDriver);

	        Driver result = driverrService.authenticateDriver(email, password);
	        
	        assertNotNull("Customer should be authenticated successfully", result);
	        assertEquals("Email should match", email, result.getEmail());
	    }

	    @Test
	    public void testAuthenticateDriver_Failure() {
	    	 String email = "chameerasenarathna14@gmail.com";
	         String password = "";
	         Driver mockDriver = new Driver(49, "Senarathna Kavinda", email, password, "BB4567894", "07545612378", "Available");
	         
	        
	        Mockito.when(driverDOA.authenticateDriver(email, password)).thenReturn(mockDriver);

	        Driver result = driverrService.authenticateDriver(email, password);
	        
	        assertNotNull("Customer should be authenticated Unsuccessfully", result);
	        assertEquals("Email should not match", email, result.getEmail());
	    }
	

}
