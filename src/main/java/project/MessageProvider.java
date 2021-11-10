package project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class MessageProvider {
	public static ResultSet getMessage() {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =  st.executeQuery("select * from message");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
}
}
