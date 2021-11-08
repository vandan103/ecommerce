<%@page import="project.ConnectionProvider, java.sql.*"%>
<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String status="cancel";

try {
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where pid='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
	out.print(e);
	//response.sendRedirect("ordersReceived.jsp?msg=invalid");

}
%>
