package com.service.Driver;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.doa.DriverDOA;
import com.model.Driver;
import com.service.DriverService;



public class DriverServiceRegisterTest {

    private DriverDOA driverDOA;
    private DriverService driverrService;

    @Before
    public void setUp() {
    	driverDOA = new DriverDOA();
    	driverrService = new DriverService();
    }

    @Test
    public void testRegisterDriver_Success() {
        Driver driver = new Driver(0, "Gihan Bnadara", "gihanh@example.com", "password123", "4544589V", "0712347878", "Available");

        boolean result = driverrService.registerDriver(driver);

        assertTrue("Customer should be registered successfully", result);
    }

    @Test
    public void testRegisterDriver_Failure() {
       
    	Driver driver = new Driver(1, "dd", "", "password456", "987654321V", "0723456789", "Available");

    	  boolean result = driverrService.registerDriver(driver);

        assertFalse("Customer registration should fail", result);
    }
}
