package com.service.Driver;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.DriverDOA;
import com.service.DriverService;

public class DriverServiceDeleteTest {
	private DriverDOA driverDOA;
    private DriverService driverrService;

    @Before
    public void setUp() {
    	driverDOA = Mockito.mock(DriverDOA.class);
        driverrService = new DriverService();
    }
    

    @Test
    public void testDeleteDriver_Success() {
        int driverId = 55;
        
        Mockito.when(driverDOA.deleteDriver(driverId)).thenReturn(true);

        boolean result = driverrService.deleteDriver(driverId);
        
        assertTrue("Driver should be deleted successfully", result);
    }

    @Test
    public void testDeleteDriver_Failure() {
    	int driverId = 87;
        
    	   Mockito.when(driverDOA.deleteDriver(driverId)).thenReturn(true);

           boolean result = driverrService.deleteDriver(driverId);
        
        assertTrue("Driver should be deleted Failed", result);
    }

}
