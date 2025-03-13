package Vehicle;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.VehicleDAO;
import com.model.Vehicle;
import com.service.VehicleService;

public class VehicleServiceUpdateTest {
    private VehicleDAO vehicleDAO;
    private VehicleService vehicleService;

    @Before
    public void setUp() {
        vehicleDAO = Mockito.mock(VehicleDAO.class);
        vehicleService = VehicleService.getInstance();
    }

    @Test
    public void testUpdateVehicle_Success() {
        int vehicleId = 59;
        int driverId = 49;
        String vehicleType = "Sedan";
        String licenseNumber = "AB-1234";
        String vehicleColor = "Black";
        String manufactureDate = "2020-05-10";
        String isAC = "Yes";
        String passengerType = "Individual";
        String imagePath = "path/to/image.jpg";

        Mockito.when(vehicleDAO.updateVehicle(Mockito.any(Vehicle.class))).thenReturn(true);

        boolean result = vehicleService.updateVehicle(vehicleId, driverId, vehicleType, licenseNumber, vehicleColor, 
                                                     manufactureDate, isAC, passengerType, imagePath);

        assertTrue("Vehicle details should be updated successfully", result);
    }

    @Test
    public void testUpdateVehicle_Failure() {
    	int vehicleId = 1;
        int driverId = 101;
        String vehicleType = "";
        String licenseNumber = "";
        String vehicleColor = "";
        String manufactureDate = "2020-05-10";
        String isAC = "Yes";
        String passengerType = "Individual";
        String imagePath = "path/to/image.jpg";

        Mockito.when(vehicleDAO.updateVehicle(Mockito.any(Vehicle.class))).thenReturn(true);

        boolean result = vehicleService.updateVehicle(vehicleId, driverId, vehicleType, licenseNumber, vehicleColor, 
                                                     manufactureDate, isAC, passengerType, imagePath);

        assertTrue("Vehicle details should be updated Failed", result);
    }
}
