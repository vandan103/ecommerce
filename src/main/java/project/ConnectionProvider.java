package project;
import java.sql.*;
public class ConnectionProvider {
	static String url="jdbc:mysql://localhost:3306/ecommerce";
	public static Connection getcon() throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection(url,"root","");
			System.out.println(con);
			return con;
		} catch (ClassNotFoundException e) {
			System.out.println(e);
			return null;
		}
		
		
	}

}
