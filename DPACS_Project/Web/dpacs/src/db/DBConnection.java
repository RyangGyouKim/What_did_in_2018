package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection getCon() throws SQLException {
		Connection con = null;
		try {
			String jdbcClass = "com.mysql.jdbc.Driver";
			Class.forName(jdbcClass);
			String id ="root";
			String pw = "password";
			String url = "jdbc:mysql://localhost:3306/dpacs";
			con = DriverManager.getConnection(url, id, pw);
			return con;
		} catch(ClassNotFoundException ce) {
			System.out.println(ce.getMessage());
			return null;
		}
	}
}

