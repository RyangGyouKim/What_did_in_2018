package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDao() {
		try {
			String url ="jdbc:mysql://localhost::3306/dpacs?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "password";
			String driver = "com.mysql.cj.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbId,dbPw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("userdao ??");
	}
	
	public int login(String id, String pw) {
		String sql = "select pw from dpacsdb where id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1; //success login
				} else {
					return 0; // pw not match
				}
			} else {
				return -1; // no id
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2;//db error;
	}
	
	
}
