package project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CartProvider {
	public static ResultSet getCartTotal(String email) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select sum(total) from cart where email='" + email + "' and address is NULL ");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getCartProduct(String email) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.pid and cart.email='" + email
						+ "' and cart.address is NULL");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getCartBill(String email) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getBillUserInfo(String email) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'  and users.email='"+email+"' ");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getBillProductInfo(String email) {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =st.executeQuery("select * from cart inner join product where cart.pid=product.id and cart.email='"+email+"' and cart.status='bill'");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getDeliveredOrder() {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =st.executeQuery(
						"select * from cart inner join product on cart.pid=product.id and cart.orderDate is not NULL and cart.status='delivered'  ");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getCanceledOrder() {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =st.executeQuery(
						"select * from cart inner join product on cart.pid=product.id and cart.orderDate is not NULL and cart.status='cancel'  ");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
	public static ResultSet getPlacedOrder() {
		   try {
			   Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs =st.executeQuery("select * from cart inner join product on cart.pid=product.id and cart.orderDate is not NULL and cart.status='processing'  ");
				return rs;
			 	}
			 	
			 catch(Exception e){
			 	System.out.print(e);
			 }
		return null;
	   }
}
