<%@page import="project.ConnectionProvider, java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String password=request.getParameter("password");
String newans=request.getParameter("newans");
String question=request.getParameter("question");
int t=0;
try{
	Connection con = ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		t=1;
		st.executeUpdate("update users set question='"+question+"' ,answer='"+newans+"' where email='"+email+"' ");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
		
	}
	if(t==0)
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
}catch(Exception e){
	
out.print(e);
	
}
%>