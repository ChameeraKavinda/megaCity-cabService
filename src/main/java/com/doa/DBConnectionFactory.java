package com.doa;

import java.sql.Connection;

public class DBConnectionFactory {
	public static Connection getConnection() {
		return DBConnection.getInstance().getConnection();
	}

}
