package com.service.Driver;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.DriverDOA;
import com.model.Customer;
import com.model.Driver;
import com.service.DriverService;

public class DriverServiceUpdateTest {
	 private DriverDOA driverDOA;
	    private DriverService driverrService;

	    @Before
	    public void setUp() {
	    	driverDOA = Mockito.mock(DriverDOA.class);
	        driverrService = new DriverService();
	    }
	    

	    @Test
	    public void testUpdateDriver_Failure() {
	        Driver driver = new Driver(88, "Unit Test", "testdruve@example.com", "password123", "4544589V", "0712347878", "Available");
	         
	         Mockito.when(driverDOA.updateDriver(driver)).thenReturn(true);

	         boolean result = driverrService.updateDriver(driver);
	         
	         assertTrue("Driver details should be updated Unsuccessfully", result);
	    }
	    
	    @Test
	    public void testUpdateDriver_Success() {
	        Driver driver = new Driver(55, "Unit Test", "testdruve@example.com", "password123", "4544589V", "0712347878", "Available");
	        
	        Mockito.when(driverDOA.updateDriver(driver)).thenReturn(true);

	         boolean result = driverrService.updateDriver(driver);
	        
	        assertTrue("Driver details should be updated successfully", result);
	    }

}
