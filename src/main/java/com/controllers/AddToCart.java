package com.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import project.ConnectionProvider;
/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String name = session.getAttribute("name").toString();
		String email = session.getAttribute("email").toString();
		String pid = request.getParameter("id").toString();
		int quantity = 1;
		int product_price = 0;
		int product_total = 0;
		int cart_total = 0;
		int z = 0;
		try {
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from product where id='" + pid + "'");
			while (rs.next()) {
				product_price = rs.getInt(4);
				product_total = product_price;

			}
			ResultSet rs1 = st.executeQuery("select * from cart where pid=" + pid + " and email='" + email + "' and address is Null ");
			while (rs1.next()) {
				cart_total = rs1.getInt(5);
				cart_total = cart_total + product_total;
				quantity = rs1.getInt(3);
				quantity = quantity+1;
				z = 1;
			}
			if (z == 1) {
			  //increase quntity
				st.executeUpdate("update cart set total='" + cart_total + "',quantity='" + quantity + "' where pid=" + pid
				+ " and  email='" + email + "' and address is NULL  ");
				response.sendRedirect("home.jsp?msg=exist");
			
			}
			if (z == 0) {
				//new product will be add
				PreparedStatement ps = con.prepareStatement("insert into cart(email,pid,quantity,price,total) values(?,?,?,?,?)");
				ps.setString(1, email);
				ps.setString(2, pid);
				ps.setInt(3, quantity);
				ps.setInt(4, product_price);
				ps.setInt(5, product_total);
				ps.executeUpdate();
				response.sendRedirect("home.jsp?msg=added");

			}

		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("home.jsp?msg=invalid");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
