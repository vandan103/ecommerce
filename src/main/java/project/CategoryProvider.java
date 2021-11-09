package project;

import java.sql.*;

public class CategoryProvider {
   public static ResultSet getCategory() {
	   try {
		 	Connection con = ConnectionProvider.getcon();
		 	Statement st = con.createStatement();
		 	ResultSet rs = st.executeQuery("select * from category");
		 	return rs;
		 	}
		 	
		 catch(Exception e){
		 	System.out.print(e);
		 }
	return null;
   }
}
