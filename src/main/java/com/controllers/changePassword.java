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
 * Servlet implementation class changePassword
 */
@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassword() {
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
		String oldpwd=request.getParameter("oldpwd");
		String newpwd=request.getParameter("newpwd");
		String cnfpwd=request.getParameter("cnfpwd");
		/*
		 * out.println(oldpwd); out.println(newpwd); out.println(cnfpwd);
		 */


		if(!cnfpwd.equals(newpwd)){
			response.sendRedirect("changePassword.jsp?msg=notmatch");
		}else{
			int chk=0;
			try{
				Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+oldpwd+"' ");
				if(rs.next()){
					chk=1;
					st.executeUpdate("update users set password='"+newpwd+"' where email='"+email+"' ");
					response.sendRedirect("changePassword.jsp?msg=done");
				}
				if(chk==0){
					response.sendRedirect("changePassword.jsp?msg=wrong");

				}
			}catch(Exception e){
				//out.print(e);
				response.sendRedirect("changePassword.jsp?msg=invalid");

			}
			
			
		}
	}

}
