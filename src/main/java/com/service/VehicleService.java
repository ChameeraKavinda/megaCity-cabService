package com.service;

import com.doa.VehicleDAO;
import com.model.Vehicle;

public class VehicleService {
    private static VehicleService instance;
    private VehicleDAO vehicleDAO;

    private VehicleService() {
        this.vehicleDAO = new VehicleDAO();
    }

    public static VehicleService getInstance() {
        if (instance == null) {
            instance = new VehicleService();
        }
        return instance;
    }

    public boolean registerVehicle(int driverId, String vehicleType, String licenseNumber, String vehicleColor, 
                                   String manufactureDate, String isAC, String passengerType, String imagePath) {
        Vehicle vehicle = new Vehicle();
        vehicle.setDriverId(driverId);
        vehicle.setVehicleType(vehicleType);
        vehicle.setLicenseNumber(licenseNumber);
        vehicle.setVehicleColor(vehicleColor);
        vehicle.setManufactureDate(manufactureDate);
        vehicle.setIsAC(isAC);
        vehicle.setPassengerType(passengerType);
        vehicle.setImagePath(imagePath);

        return vehicleDAO.addVehicle(vehicle);
    }

    public Vehicle getVehicleByDriverId(int driverId) {
        return vehicleDAO.getVehicleByDriverId(driverId);
    }
}
