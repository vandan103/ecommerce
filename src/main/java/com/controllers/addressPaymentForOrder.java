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
 * Servlet implementation class addressPaymentForOrder
 */
@WebServlet("/addressPaymentForOrder")
public class addressPaymentForOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addressPaymentForOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		String address=request.getParameter("address");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String country=request.getParameter("country");
		String number=request.getParameter("number");
		String paymentmethod=request.getParameter("paymentmethod");
		String transacionId="";
		transacionId=request.getParameter("transacionId");
		String status="bill";
		try{
			Connection con = ConnectionProvider.getcon();
			PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=?,country=?, mobile_no=? where email=?");
			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setString(4, country);
			ps.setString(5, number);
			ps.setString(6, email);


			ps.executeUpdate();
			
			PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?, mo_number=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentmethod=?,tId=?,status=? where email=? and address is NULL");
			ps1.setString(1, address);
			ps1.setString(2, city);
			ps1.setString(3, state);
			ps1.setString(4, country);
			ps1.setString(5, number);
			ps1.setString(6, paymentmethod);
			ps1.setString(7, transacionId);
			ps1.setString(8, status);
			ps1.setString(9, email);
			ps1.executeUpdate();
			response.sendRedirect("bill.jsp");


		}catch(Exception e){
			 
			System.out.print(" error occurs"+e );
			
		}
	}

}
