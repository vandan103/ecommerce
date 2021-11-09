<%@page import="project.ConnectionProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<% String msg=request.getParameter("msg");
if("notmatch".equals(msg)){
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>
<%if("wrong".equals(msg)){ %>
<h3 class="alert">Your old Password is wrong!</h3>
<%} %>
<%if("done".equals(msg)){ %>

<h3 class="alert">Password change successfully!</h3>
<%} %>

<%if("invalid".equals(msg)){ %>

<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>

<form action="changePassword" method="post">
<h3>Enter Old Password</h3>
 				<input class="input-style" type="password" name="oldpwd" placeholder=" enter your old password " required="required">
 
  <hr>
 <h3>Enter New Password</h3>
  				<input class="input-style" type="password" name="newpwd" placeholder=" enter your new password " required="required">
 
 <hr>
<h3>Enter Confirm Password</h3>
 				<input class="input-style" type="password" name="cnfpwd" placeholder=" confirm your  password " required="required">

<hr>
 <button class="button" type="submit">save<i class='far fa-arrow-alt-circle-right'></i> </button>
</form>
</body>
<br><br><br>
</html>