package com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Driver;


public class DriverDOA {
	public boolean addDriver(Driver driver) {
		Connection connection=DBConnectionFactory.getConnection();
		
		if(connection==null) {
			System.out.println("Database connection is null. Check your JDBC setup.");
            return false;
		}
		 String query = "INSERT INTO driver (name,email,password,nic,phoneNumber,availability) VALUES (?,?,?,?,?,?)";
		    try (
		         PreparedStatement statement = connection.prepareStatement(query)) {

		        statement.setString(1, driver.getName());
		        statement.setString(2, driver.getEmail());
		        statement.setString(3, driver.getPassword());
		        statement.setString(4, driver.getNic());
		        statement.setString(5, driver.getPhoneNumber());
		        statement.setString(6, driver.getAvailability());

		        int rowsInserted = statement.executeUpdate();
		        return rowsInserted > 0; 

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return false;
		}
		
	
	public Driver authenticateDriver(String email, String password) {
        String query = "SELECT * FROM driver WHERE email = ? AND password = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return new Driver(
                    resultSet.getInt("driverId"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getString("nic"),
                    resultSet.getString("phoneNumber"),
                    resultSet.getString("availability")

                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; 
    }
	
	
	public Driver getDriverByEmail(String email) {
		Driver driver = null;
	    String query = "SELECT * FROM driver WHERE email = ?";

	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setString(1, email);
	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            driver = new Driver(
	            		 resultSet.getInt("driverId"),
	                     resultSet.getString("name"),
	                     resultSet.getString("email"),
	                     resultSet.getString("password"),
	                     resultSet.getString("nic"),
	                     resultSet.getString("phoneNumber"),
	                     resultSet.getString("availability")

	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return driver;
	}

	
	 
    public Driver getDriverById(int driverId) {
        Driver driver = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT * FROM driver WHERE driverId = ?")) {

            stmt.setInt(1, driverId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            	driver = new Driver(
                		 rs.getInt("driverId"),
                		 rs.getString("name"),
                		 rs.getString("email"),
                		 rs.getString("password"),
                		 rs.getString("nic"),
                		 rs.getString("phoneNumber"),
                		 rs.getString("availability")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return driver;
    }
	
	
	public boolean updateDriverWithQuestions(String email, String license, int experience, String ownVehicle, String preferredWorkType) {
	    String query = "UPDATE driver SET license=?, experience=?, ownVehicle=?, preferredWorkType=? WHERE email=?";
	    
	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setString(1, license);
	        statement.setInt(2, experience);
	        statement.setString(3, ownVehicle);
	        statement.setString(4, preferredWorkType);
	        statement.setString(5, email);

	        int rowsUpdated = statement.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	
	
	public List<Driver> getAllDriverss() throws SQLException {
	    List<Driver> driverList = new ArrayList<>();
	    String query = "SELECT * FROM driver";

	    try (Connection connection = DBConnectionFactory.getConnection();
	         Statement statement = connection.createStatement();
	         ResultSet resultSet = statement.executeQuery(query)) {

	        while (resultSet.next()) {
	        	
	        	int id = resultSet.getInt("driverId");
	        	String name= resultSet.getString("name");
	        	String email= resultSet.getString("email");
	        	String password=resultSet.getString("password");
	        	String nic=resultSet.getString("nic");
	        	String phoneNumber=resultSet.getString("phoneNumber");
	        	String availability=resultSet.getString("availability");
	        	
	           

	        	driverList.add(new Driver(id, name, email, password, nic, phoneNumber, availability)); 
	        }
	    }
	    return driverList;
	} 
	
	
	
    public boolean deleteDriver(int driverId) {
        String query = "DELETE FROM driver WHERE driverId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, driverId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
 
    public boolean updateDriver(Driver driver) {
        String query = "UPDATE driver SET name=?, email=?, password=?, nic=?,phoneNumber=?, availability=? WHERE driverId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, driver.getName());
            statement.setString(2, driver.getEmail());
            statement.setString(3, driver.getPassword());
            statement.setString(4, driver.getNic());
            statement.setString(5, driver.getPhoneNumber());
            statement.setString(6, driver.getAvailability());  
            statement.setInt(7, driver.getDriverId());


            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

	

}