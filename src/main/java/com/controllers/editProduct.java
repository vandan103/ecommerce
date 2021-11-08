package com.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import project.ConnectionProvider;
/**
 * Servlet implementation class editProduct
 */
@WebServlet("/editProduct")
public class editProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		String active = request.getParameter("active");

		try {
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			st.executeUpdate("update product set name='" + name + "',category='" + category + "',price='" + price + "',active='"
			+ active + "' where id='" + id + "'");
			if(active.equals("No")){
				st.executeUpdate("delete from cart where pid='"+id+"' and address is NULL");
			}
			response.sendRedirect("admin/allProductEditProduct.jsp?msg=done");
		} catch (Exception e) {
			System.out.print("exception occurs" + e);
			response.sendRedirect("admin/allProductEditProduct.jsp?msg=invalid");

			//response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
	}

}
