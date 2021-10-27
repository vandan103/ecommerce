<%@page import="project.ConnectionProvider, java.sql.*"%>

<%
String email = request.getParameter("email");
String number = request.getParameter("number");
String question = request.getParameter("question");
String answer = request.getParameter("answer");
String password = request.getParameter("password");

try {
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and mobile_no='" + number
	+ "'  and question='" + question + "' and answer='" + answer + "' ");
	if (rs.next()) {
		st.executeUpdate("update users set password='" + password + "'  where email='" + email + "' ");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	} else {
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
	
} catch (Exception e) {
	System.out.print("exception occurs");
	//response.sendRedirect("forgotPassword.jsp?msg=invalid");
}
%>
