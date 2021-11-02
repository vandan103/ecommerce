<%@page import="project.ConnectionProvider, java.sql.*"%>
<%
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
	
out.print(e);
	
}

%>