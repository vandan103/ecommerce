<%@page import="project.ConnectionProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Your security Question successfully changed !</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Your Password is wrong!</h3>
	<%
	}
	%>

	<form action="changeSecurityQuestion" method="post">

		<h3>Select Your New Security Question</h3>
		<select name="question" class="input-style">

			<option value="pet name">pet name</option>
			<option value="car name">car name</option>
		</select>

		<hr>
		<h3>Enter Your New Answer</h3>
		<input class="input-style" type="text" name="newans"
			placeholder=" enter your new answer " required="required">

		<hr>
		<h3>Enter Password (For Security)</h3>
		<input class="input-style" type="password" name="password"
			placeholder=" enter your password " required="required">	<hr>
<button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
	</form>

	

</body>
<br>
<br>
<br>
</html>