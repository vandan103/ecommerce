<%@page import="project.ConnectionProvider,project.UserProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try{
	ResultSet rs = UserProvider.getUser(email);
	while(rs.next()){
%>
<h3>Name:<%=rs.getString(2) %> </h3>
<hr>
 <h3>Email: <%=rs.getString(3) %> </h3>
 <hr>
 <h3>Mobile Number:<%=rs.getString(6) %>  </h3>
 <hr>
<h3>Security Question: <%=rs.getString(4) %> </h3>
<hr>
      <br>
      <br>
      <br>
<%}}catch(Exception e){
	out.print(e);
} %>
</body>
</html>