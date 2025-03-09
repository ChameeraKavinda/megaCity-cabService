package com.doa;

import com.model.Vehicle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VehicleDAO {
    public boolean addVehicle(Vehicle vehicle) {
        String query = "INSERT INTO vehicle (driverId, vehicle_type, license_number, vehicle_color, manufacture_date, isAC, passenger_type, image_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, vehicle.getDriverId());
            statement.setString(2, vehicle.getVehicleType());
            statement.setString(3, vehicle.getLicenseNumber());
            statement.setString(4, vehicle.getVehicleColor());
            statement.setString(5, vehicle.getManufactureDate());
            statement.setString(6, vehicle.getIsAC());
            statement.setString(7, vehicle.getPassengerType());
            statement.setString(8, vehicle.getImagePath());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Vehicle getVehicleByDriverId(int driverId) {
        String query = "SELECT * FROM vehicle WHERE driverId = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            statement.setInt(1, driverId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setLicenseNumber(rs.getString("license_number"));
                vehicle.setVehicleColor(rs.getString("vehicle_color"));
                vehicle.setManufactureDate(rs.getString("manufacture_date"));
                vehicle.setIsAC(rs.getString("isAC"));
                vehicle.setPassengerType(rs.getString("passenger_type"));
                vehicle.setImagePath(rs.getString("image_path"));
                return vehicle;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT * FROM vehicle");
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setDriverId(rs.getInt("driverId"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setLicenseNumber(rs.getString("license_number"));
                vehicle.setVehicleColor(rs.getString("vehicle_color"));
                vehicle.setManufactureDate(rs.getString("manufacture_date"));
                vehicle.setIsAC(rs.getString("isAC"));
                vehicle.setPassengerType(rs.getString("passenger_type"));
                vehicle.setImagePath(rs.getString("image_path"));
                vehicles.add(vehicle);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vehicles;
}
}
