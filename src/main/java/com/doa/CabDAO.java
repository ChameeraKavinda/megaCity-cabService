package com.doa;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.model.Cab;

public class CabDAO {
    
	public boolean addCab(Cab cab) {
	    Connection connection = DBConnectionFactory.getConnection();

	    if (connection == null) {
	        System.out.println("Database connection is null. Check your JDBC setup.");
	        return false;
	    }

	    String query = "INSERT INTO cab (carImage, carModel, registerNumber, description, isAC, kmPerHour,subDescription,rate) VALUES (?,?,?, ?, ?, ?, ?, ?)";

	    try (PreparedStatement statement = connection.prepareStatement(query)) {
	        statement.setString(1, cab.getCarImage()); 
	        statement.setString(2, cab.getCarModel());
	        statement.setString(3, cab.getRegisterNumber());
	        statement.setString(4, cab.getDescription());
	        statement.setBoolean(5, cab.isAC());
	        statement.setDouble(6, cab.getKmPerHour());
	        statement.setString(7, cab.getSubDescription());
	        statement.setDouble(8, cab.getRate());

	        int rowsInserted = statement.executeUpdate();
	        return rowsInserted > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

    public Cab getCabByRegisterNumber(String registerNumber) {
        Cab cab = null;
        String query = "SELECT * FROM cab WHERE registerNumber = ?";

        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, registerNumber);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                cab = new Cab(
                    resultSet.getInt("cabId"),
                    resultSet.getString("carImage"),
                    resultSet.getString("carModel"),
                    resultSet.getString("registerNumber"),
                    resultSet.getString("description"),
                    resultSet.getBoolean("isAC"),
                    resultSet.getDouble("kmPerHour"),
                    resultSet.getString("subDescription"),
                    resultSet.getDouble("rate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cab;
    }
}
