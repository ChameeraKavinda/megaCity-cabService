package com.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private  static final String DB_URL="jdbc:mysql://127.0.0.1:3306/megacitycab";
	private static final String DB_USER="root";
	private static final String DB_PASSWORD="Chameera2705";
	
	private static DBConnection instance;
	private Connection connection;
	
	private DBConnection() {
	    try {
	        System.out.println("Attempting to load JDBC Driver...");
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        System.out.println("JDBC Driver loaded successfully!");

	        System.out.println("Attempting to connect to database...");
	        this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	        
	        if (this.connection != null) {
	            System.out.println("Database Connection Established!");
	        } else {
	            System.out.println("Database Connection Failed!");
	        }

	    } catch (ClassNotFoundException e) {
	        System.out.println("JDBC Driver Not Found!");
	        e.printStackTrace();
	    } catch (SQLException e) {
	        System.out.println("Database Connection Failed! Check DB credentials or server.");
	        e.printStackTrace();
	    }
	}

	public static DBConnection getInstance() {
		if(instance==null) {
			synchronized (DBConnection.class) {
				if (instance==null) {
					instance=new DBConnection();
					
				}
				
			}
		}
		return instance;
	}
	
	public Connection getConnection() {
		try {
			if (connection==null || connection.isClosed()) {
				System.out.println("Reconecting..");
				connection=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
				connection.setCatalog("megacitycab");
				
			}
		}catch (Exception e) {
				// TODO: handle exception
				System.err.println("Failed reconnect:" + e.getMessage());
				e.printStackTrace();
			}
		return connection;
		
	}

}
