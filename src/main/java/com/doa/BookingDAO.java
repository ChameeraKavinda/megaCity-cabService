package com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Admin;
import com.model.Booking;

public class BookingDAO {

    public boolean addBooking(Booking booking) {
        Connection connection = DBConnectionFactory.getConnection();

        if (connection == null) {
            System.out.println("Database connection is null. Check your JDBC setup.");
            return false;
        }

        String query = "INSERT INTO booking (bookingDate, pickupLocation, dropLocation, distance, price, bookingStatus, customerId, driverId, vehicleId,tax,discount,totalPrice) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, booking.getBookingDate());
            statement.setString(2, booking.getPickupLocation());
            statement.setString(3, booking.getDropLocation());
            statement.setDouble(4, booking.getDistance());
            statement.setDouble(5, booking.getPrice());
            statement.setString(6, booking.getBookingStatus());
            statement.setInt(7, booking.getCustomerId());
            statement.setInt(8, booking.getDriverId());
            statement.setInt(9, booking.getVehicleId());
            statement.setDouble(10, booking.getTax());
            statement.setDouble(11, booking.getDiscount());
            statement.setDouble(12, booking.getTotalPrice());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookingList = new ArrayList<>();
        String query = "SELECT * FROM booking";

        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int id = resultSet.getInt("bookingId");
                String bookingDate = resultSet.getString("bookingDate");
                String pickupLocation = resultSet.getString("pickupLocation");
                String dropLocation = resultSet.getString("dropLocation");
                double distance = resultSet.getDouble("distance");
                double price = resultSet.getDouble("price");
                String bookingStatus = resultSet.getString("bookingStatus");
                int customerId = resultSet.getInt("customerId");
                int driverId = resultSet.getInt("driverId");
                int vehicleId = resultSet.getInt("vehicleId");
                double tax = resultSet.getDouble("tax");
                double discount = resultSet.getDouble("discount");
                double totalPrice = resultSet.getDouble("totalPrice");

                bookingList.add(new Booking(id, bookingDate, pickupLocation, dropLocation, distance, price, bookingStatus, customerId, driverId, vehicleId,tax,discount,totalPrice));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }
    
    
    public Booking getBookingById(int bookingId) {
    	Booking booking = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT * FROM booking WHERE bookingId = ?")) {

            stmt.setInt(1, bookingId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            	booking = new Booking(
            			rs.getInt("bookingId"),
                        rs.getString("bookingDate"),
                        rs.getString("pickupLocation"),
                        rs.getString("dropLocation"),
                        rs.getDouble("distance"), 
                        rs.getDouble("price"), 
                        rs.getString("bookingStatus"),
                        rs.getInt("customerId"),
                        rs.getInt("driverId"), 
                        rs.getInt("vehicleId"),
                        rs.getDouble("tax"),
                        rs.getDouble("discount"),
                        rs.getDouble("totalPrice")
                        
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }
    

	
    public boolean updateBooking(Booking booking) {
        String query = "UPDATE booking SET bookingDate=?, pickupLocation=?, dropLocation=?, distance=?, price=?, bookingStatus=?, customerId=?, driverId=?,  vehicleId=?, tax=?, discount=?, totalPrice=? WHERE bookingId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

        	 statement.setString(1, booking.getBookingDate());
        	 statement.setString(2, booking.getPickupLocation());
        	 statement.setString(3, booking.getDropLocation());
        	 statement.setDouble(4, booking.getDistance());
        	 statement.setDouble(5, booking.getPrice());
        	 statement.setString(6, booking.getBookingStatus());
        	 statement.setInt(7, booking.getCustomerId());
        	 statement.setInt(8, booking.getDriverId());
        	 statement.setInt(9, booking.getVehicleId());
        	 statement.setDouble(10, booking.getTax());
        	 statement.setDouble(11, booking.getDiscount());
        	 statement.setDouble(12, booking.getTotalPrice());
        	 statement.setInt(13, booking.getBookingId());


            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean deleteBooking(int bookingId) {
        String query = "DELETE FROM booking WHERE bookingId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, bookingId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

	
}
