package project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.websocket.Session;

public class ProductProvider {
	
	public static ResultSet getProductsAdmin() {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =  st.executeQuery("select * from product");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getProducts() {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =  st.executeQuery("select * from product where active='yes'");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getProduct(String id) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =  st.executeQuery("select * from product where id ='" + id + "'");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
}
