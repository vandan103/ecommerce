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
 * Servlet implementation class deliveredOrder
 */
@WebServlet("/deliveredOrder")
public class deliveredOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deliveredOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String status="delivered";

		try {
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			st.executeUpdate("update cart set status='"+status+"' where pid='"+id+"' and email='"+email+"' and address is not NULL");
			response.sendRedirect("admin/ordersReceived.jsp?msg=delivered");
		}
		catch(Exception e){
			//out.print(e);
			response.sendRedirect("admin/ordersReceived.jsp?msg=invalid");

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
