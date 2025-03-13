package Vehicle;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import com.doa.VehicleDAO;
import com.service.VehicleService;
import com.model.Vehicle;

public class VehicleServiceDeleteTest {
    private VehicleDAO vehicleDAO;
    private VehicleService vehicleService;

    @Before
    public void setUp() {
        vehicleDAO = Mockito.mock(VehicleDAO.class);
        vehicleService = VehicleService.getInstance();
    }

    @Test
    public void testVehicleDelete_Success() {
        int vehicleId = 59;
        
        Mockito.when(vehicleDAO.deleteVehicle(vehicleId)).thenReturn(true);

        boolean result = vehicleService.deleteVehicle(vehicleId);

        assertTrue("Vehicle should be deleted successfully", result);
    }

    @Test
    public void testVehicleDelete_Failure() {
    	int vehicleId = 38;
        
        Mockito.when(vehicleDAO.deleteVehicle(vehicleId)).thenReturn(true);

        boolean result = vehicleService.deleteVehicle(vehicleId);

        assertTrue("Vehicle details deleted Failed", result);
    }
}
