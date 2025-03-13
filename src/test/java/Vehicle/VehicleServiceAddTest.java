package Vehicle;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.VehicleDAO;
import com.model.Vehicle;
import com.service.VehicleService;

public class VehicleServiceAddTest {
    private VehicleDAO vehicleDAO;
    private VehicleService vehicleService;

    @Before
    public void setUp() {
        vehicleDAO = Mockito.mock(VehicleDAO.class);
        vehicleService = VehicleService.getInstance();
    }

    @Test
    public void testRegisterVehicle_Success() {
        Mockito.when(vehicleDAO.addVehicle(Mockito.any(Vehicle.class))).thenReturn(true);
        
        boolean result = vehicleService.registerVehicle(49, "Car", "ABC-1234", "Black", 
                "2020-05-18", "Yes", "Passenger", "path/to/image.jpg");
        
        assertTrue("Vehicle should be registered successfully", result);
    }

    @Test
    public void testRegisterVehicle_Failure() {
        Mockito.when(vehicleDAO.addVehicle(Mockito.any(Vehicle.class))).thenReturn(false);
        
        boolean result = vehicleService.registerVehicle(0, "", "", "Black", 
                "2020-05-18", "Yes", "Passenger", "path/to/image.jpg");
        
        assertTrue("Vehicle should be registered Failed", result);
    }
}