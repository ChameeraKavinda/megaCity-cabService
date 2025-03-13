package com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Customer;

public class CustomerDOA {
	public boolean addCustomer(Customer customer) {
        Connection connection = DBConnectionFactory.getConnection();

		   if (connection == null) {
	            System.out.println("Database connection is null. Check your JDBC setup.");
	            return false;
	        }
	    String query = "INSERT INTO customer (name,email,password,nicNumber,phoneNumber,address) VALUES (?,?,?,?,?,?)";
	    try (
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setString(1, customer.getName());
	        statement.setString(2, customer.getEmail());
	        statement.setString(3, customer.getPassword());
	        statement.setString(4, customer.getNicNumber());
	        statement.setString(5, customer.getPhoneNumber());
	        statement.setString(6, customer.getAddress());

	        int rowsInserted = statement.executeUpdate();
	        return rowsInserted > 0; 

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

		
	
	
	public List<Customer> getAllCustomers() throws SQLException {
	    List<Customer> customerList = new ArrayList<>();
	    String query = "SELECT * FROM customer";

	    try (Connection connection = DBConnectionFactory.getConnection();
	         Statement statement = connection.createStatement();
	         ResultSet resultSet = statement.executeQuery(query)) {

	        while (resultSet.next()) {
	            int id = resultSet.getInt("customerId");
	            String name = resultSet.getString("name");
	            String email = resultSet.getString("email");
	            String password = resultSet.getString("password");
	            String nicNumber = resultSet.getString("nicNumber");
	            String phoneNumber = resultSet.getString("phoneNumber");
	            String address = resultSet.getString("address");

	            customerList.add(new Customer(id, name, email, password, nicNumber, phoneNumber, address)); 
	        }
	    }
	    return customerList;
	} 
	
	
	public Customer authenticateCustomer(String email, String password) {
        String query = "SELECT * FROM customer WHERE email = ? AND password = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return new Customer(
                    resultSet.getInt("customerId"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getString("nicNumber"),
                    resultSet.getString("phoneNumber"),
                    resultSet.getString("address")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; 
    }
	
	  
    public Customer getCustomerById(int customerId) {
        Customer customer = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT * FROM customer WHERE customerId = ?")) {

            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                    rs.getInt("customerId"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("nicNumber"),
                    rs.getString("phoneNumber"),
                    rs.getString("address")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
	
	
	public Customer getCustomerByEmail(String email) {
	    Customer customer = null;
	    String query = "SELECT * FROM customer WHERE email = ?";

	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setString(1, email);
	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            customer = new Customer(
	                resultSet.getInt("customerId"),
	                resultSet.getString("name"),
	                resultSet.getString("email"),
	                resultSet.getString("password"),
	                resultSet.getString("nicNumber"),
	                resultSet.getString("phoneNumber"),
	                resultSet.getString("address")
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return customer;
	}
	
	
    public boolean updateCustomer(Customer customer) {
        String query = "UPDATE customer SET name=?, email=?, password=?, nicNumber=?, phoneNumber=?, address=? WHERE customerId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, customer.getName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getPassword());
            statement.setString(4, customer.getNicNumber());
            statement.setString(5, customer.getPhoneNumber());
            statement.setString(6, customer.getAddress());
            statement.setInt(7, customer.getCustomerId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean deleteCustomer(int customerId) {
        String query = "DELETE FROM customer WHERE customerId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, customerId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0; // ✅ Returns true if a row is deleted

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



	

}
