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
 * Servlet implementation class changeMobileNumber
 */
@WebServlet("/changeMobileNumber")
public class changeMobileNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeMobileNumber() {
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
		String email = session.getAttribute("email").toString();
		String password=request.getParameter("password");

		String number=request.getParameter("number");
		int t=0;
		try{
			Connection con = ConnectionProvider.getcon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
			while(rs.next()){
				t=1;
				st.executeUpdate("update users set mobile_no='"+number+"' where email='"+email+"' ");
				response.sendRedirect("changeMobileNumber.jsp?msg=done");
				
			}
			if(t==0)
				response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		}catch(Exception e){
			
		System.out.print(e);
			
		}
	}

}
