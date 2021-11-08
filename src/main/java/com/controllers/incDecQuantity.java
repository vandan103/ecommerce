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
 * Servlet implementation class incDecQuantity
 */
@WebServlet("/incDecQuantity")
public class incDecQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public incDecQuantity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		String id=request.getParameter("id");
		String incdec=request.getParameter("quantity");
		int price=0;
		int total=0;
		int quantity=0;
		int final_total=0;
		try{
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and pid='"+id+"' and address is NULL ");
			while(rs.next()){
				
				price=rs.getInt(4);
				total=rs.getInt(5);
				quantity=rs.getInt(3);
			}
			if(quantity==1 && incdec.equals("dec")){
				response.sendRedirect("myCart.jsp?msg=notpossible");
			}
			else if(quantity!=1 && incdec.equals("dec")){
				total=total-price;
				quantity-=1;
				st.executeUpdate("update cart set total='"+total+"' ,quantity='"+quantity+"' where email='"+email+"' and pid='"+id+"' and address is NULL ");
				response.sendRedirect("myCart.jsp?msg=dec");
			}else{
				total=total+price;
				quantity+=1;
				st.executeUpdate("update cart set total='"+total+"' ,quantity='"+quantity+"' where email='"+email+"' and pid='"+id+"' and address is NULL ");
				response.sendRedirect("myCart.jsp?msg=inc");
			}
			}
		catch(Exception e){
			 
			System.out.print(" error occurs"+e );
			
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
