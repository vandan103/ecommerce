<%@page import="project.ConnectionProvider, java.sql.*"%>

<% 
String name=request.getParameter("name");
String email=request.getParameter("email");
String number=request.getParameter("number");
String question=request.getParameter("question");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
try{
Connection con = ConnectionProvider.getcon();
PreparedStatement ps = con.prepareStatement("insert into users (name,email,mobile_no,question,answer,password) values(?,?,?,?,?,?)");
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, number);
ps.setString(4, question);
ps.setString(5, answer);
ps.setString(6, password);
ps.executeUpdate();
response.sendRedirect("signup.jsp?msg=valid");

}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");

	
}







 
%>