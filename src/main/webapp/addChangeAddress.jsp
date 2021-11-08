<%@page import="project.ConnectionProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
</head>
<body>
<% String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
<% if("invalid".equals(msg)){
	%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%
try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"' ");
	while(rs.next()){
%>
<form action="addChangeAddress" method="post">
<h3>Enter Address</h3>
  				<input class="input-style" type="text" name="address" placeholder=" enter your address "  value="<%= rs.getString(8)%>" required="required">
 
 <hr>
 <h3>Enter city</h3>
  				<input class="input-style" type="text" name="city" placeholder=" enter your city "  value="<%= rs.getString(9)%>" required="required">
 
<hr>
<h3>Enter State</h3>
 				<input class="input-style" type="text" name="state" placeholder=" enter your state "  value="<%= rs.getString(10)%>" required="required">

<hr>
<h3>Enter country</h3>
 				<input class="input-style" type="text" name="country" placeholder=" enter your country "   value="<%= rs.getString(11)%>"required="required">

<hr>
 <button class="button" type="submit">save <i class='far fa-arrow-alt-circle-right'></i></button>

</form>
</body>
<% }}catch(Exception e){
	out.print(e);
	//response.sendRedirect("changePassword.jsp?msg=invalid");
} %>
<br><br><br>
</html>