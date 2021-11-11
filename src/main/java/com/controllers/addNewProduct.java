package com.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;
import project.ConnectionProvider;
/**
 * Servlet implementation class addNewProduct
 */
@MultipartConfig(maxFileSize = 16177215)
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
		Part file=request.getPart("image");
		String imageFileName=file.getSubmittedFileName();
		System.out.println("Selected Image File Name : "+imageFileName);
		String uploadPath="C:\\Users\\146732\\git\\repository2\\ecommerce demo\\src\\main\\webapp\\images\\"+imageFileName;
		try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//String myloc=request.getParameter("img");
		//System.out.println(myloc);
	
		try{

		Connection con = ConnectionProvider.getcon();
		PreparedStatement ps = con.prepareStatement("insert into product (name,category,price,active,image) values(?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, category);
		ps.setString(3, price);
		ps.setString(4, active);
		ps.setString(5, imageFileName);
		//File image= new File(myloc);
		//FileInputStream fis=new FileInputStream(image);
		//ps.setBinaryStream(5,(InputStream) fis, (int) (image.length()));
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
