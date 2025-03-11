package com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Admin;

public class AdminDOA {
	
	public boolean addAdmin(Admin admin) {
		Connection connection =DBConnectionFactory.getConnection();
		
		if (connection == null) {
			System.out.println("Database connection is null. Check your JDBC setup.");
			
		}
		  String query = "INSERT INTO admin (name,email,password,phoneNumber,role) VALUES (?,?,?,?,?)";
		    try (
		         PreparedStatement statement = connection.prepareStatement(query)) {

		        statement.setString(1, admin.getName());
		        statement.setString(2, admin.getEmail());
		        statement.setString(3, admin.getPassword());
		        statement.setString(4, admin.getPhoneNumber());
		        statement.setString(5, admin.getRole());

		        int rowsInserted = statement.executeUpdate();
		        return rowsInserted > 0; 
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return false;
		
		
	}

	public Admin getAdminByEmail(String email) {
		Admin admin = null;
		    String query = "SELECT * FROM admin WHERE email = ?";

		    try (Connection connection = DBConnectionFactory.getConnection();
		         PreparedStatement statement = connection.prepareStatement(query)) {

		        statement.setString(1, email);
		        ResultSet resultSet = statement.executeQuery();

		        if (resultSet.next()) {
		            admin = new Admin(
		                resultSet.getInt("adminId"),
		                resultSet.getString("name"),
		                resultSet.getString("email"),
		                resultSet.getString("password"),
		                resultSet.getString("phoneNumber"),
		                resultSet.getString("role")
		            );
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return admin;
	}

	

	public List<Admin> getAllAdmins() throws SQLException {
	    List<Admin> adminList = new ArrayList<>();
	    String query = "SELECT * FROM admin";

	    try (Connection connection = DBConnectionFactory.getConnection();
	         Statement statement = connection.createStatement();
	         ResultSet resultSet = statement.executeQuery(query)) {

	        while (resultSet.next()) {
	            int id = resultSet.getInt("adminId");
	            String name = resultSet.getString("name");
	            String email = resultSet.getString("email");
	            String password = resultSet.getString("password");
	            String phoneNumber = resultSet.getString("phoneNumber");
	            String role = resultSet.getString("role");

	            adminList.add(new Admin(id, name, email, password, phoneNumber, role)); 
	        }
	    }
	    return adminList;
	} 
	
	
	public Admin getAdminrById(int adminId) {
		Admin admin = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT * FROM admin WHERE adminId = ?")) {

            stmt.setInt(1, adminId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                admin = new Admin(
                    rs.getInt("adminId"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("phoneNumber"),
                    rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
	
	
	
    public boolean updateAdmin(Admin admin) {
        String query = "UPDATE admin SET name=?, email=?, password=?, phoneNumber=?, role=? WHERE adminId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, admin.getName());
            statement.setString(2, admin.getEmail());
            statement.setString(3, admin.getPassword());
            statement.setString(4, admin.getPhoneNumber());
            statement.setString(5, admin.getRole());
            statement.setInt(6, admin.getAdminId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean deleteAdmin(int adminId) {
        String query = "DELETE FROM admin WHERE adminId=?";
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, adminId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


	
}

	

