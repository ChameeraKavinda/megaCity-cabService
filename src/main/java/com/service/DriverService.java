package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.doa.DBConnectionFactory;
import com.doa.DriverDOA;
import com.model.Customer;
import com.model.Driver;

public class DriverService {
    private static DriverService instance;
    private DriverDOA driverDOA;

    public DriverService() {
        this.driverDOA = new DriverDOA();
    }

    public static DriverService getInstance() {
        if (instance == null) {
            synchronized (DriverService.class) {
                if (instance == null) {
                    instance = new DriverService();
                }
            }
        }
        return instance;
    }

    public boolean registerDriver(Driver driver) {
        boolean isRegistered = driverDOA.addDriver(driver);
        if (!isRegistered) {
            System.err.println("Registration Failed");
        }
        return isRegistered;
    }
    
    public Driver authenticateDriver(String email, String password) {
        return driverDOA.authenticateDriver(email, password);
    }
    
    public boolean saveDriverQuestionnaire(String email, String license, int experience, String ownVehicle, String preferredWorkType) {
        return driverDOA.updateDriverWithQuestions(email, license, experience, ownVehicle, preferredWorkType);
    }
    
    public int getDriverIdByEmail(String email) {
        int driverId = -1; 
        try {
        	Connection connection=DBConnectionFactory.getConnection();
    		
            String query = "SELECT driverId FROM driver WHERE email = ?"; 
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                driverId = rs.getInt("driverId"); 
            }

            rs.close();
            ps.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driverId;
    }
    public boolean updateDriver(Driver driver) {
        return driverDOA.updateDriver(driver);
    }

    public boolean deleteDriver(int driverId) {
        return driverDOA.deleteDriver(driverId);
    }

    
    

}
