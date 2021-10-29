<%@page import="project.ConnectionProvider, java.sql.*"%>
<% 
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from cart where pid='"+id+"' and email='"+email+"'and address is NULL ");
	response.sendRedirect("myCart.jsp?msg=removed");		
}
catch(Exception e){
	System.out.print(" error occurs"+e );
	
}
%>