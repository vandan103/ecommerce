<%@page import="project.ConnectionProvider, java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if ("admin@gmail.com".equals(email) && "Admin@123".equals(password)) {
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");

} else {
	try {
		Connection con = ConnectionProvider.getcon();
		Statement st = con.createStatement();
		System.out.println("heyy");
		ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'  ");
		//System.out.println(rs);
		if (rs.next()) {
	        session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		} else {

	System.out.print("not exist");
	response.sendRedirect("login.jsp?msg=notexist");
		}

	} catch (Exception e) {
		System.out.print("exception occurs");
		response.sendRedirect("login.jsp?msg=invalid");
	}

}
%>
