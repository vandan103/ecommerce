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
 * Servlet implementation class addNewProduct
 */
@WebServlet("/addNewProduct")
public class addNewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("admin/addNewProduct.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		System.out.println(name);
		String category=request.getParameter("category");
		System.out.println(category);
		String price=request.getParameter("price");
		String active=request.getParameter("active");
		/*InputStream inputStream=null;
		Part image
		= request.getPart("photo");
		System.out.println(image);
		if (image != null) {
			  
		    // Prints out some information
		    // for debugging
		    System.out.println(
		        image.getName());
		    System.out.println(
		        image.getSize());
		    System.out.println(
		        image.getContentType());

		    // Obtains input stream of the upload file
		        inputStream= image.getInputStream();
		}*/
		try{

		Connection con = ConnectionProvider.getcon();
		PreparedStatement ps = con.prepareStatement("insert into product (name,category,price,active) values(?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, category);
		ps.setString(3, price);
		ps.setString(4, active);
		//ps.setBlob(5, inputStream);
		ps.executeUpdate();
		response.sendRedirect("admin/addNewProduct.jsp?msg=done");

		}
		catch(Exception e){
			System.out.println(e);
			response.sendRedirect("admin/addNewProduct.jsp?msg=invalid");

			
		}
	}

}
