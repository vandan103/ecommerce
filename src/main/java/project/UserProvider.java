package project;
import java.sql.*;
public class UserProvider {
	public static ResultSet getUser(String email) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users where email='"+email+"' ");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getUserOrder(String email) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from cart inner join product on cart.pid=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
}
