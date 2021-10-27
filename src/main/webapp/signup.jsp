<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>SignUp</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="signupAction.jsp" method="post">
				<input type="text" name="name" placeholder=" enter your name "
					required="required">
				 <input type="email" name="email"
					placeholder="enter your email " required="required">
				 <input type="text" name="number" placeholder="enter your number "
					required="required"> 
				select security question<select name="question">
					<option value="pet name">pet name</option>
					<option value="car name">car name</option>
				</select> 
				<input type="text" name="answer" placeholder="enter answer for question"
					required="required">
			    <input type="password" name="password"
					placeholder="enter password" required="required">
			    <input type="submit" value="signup">
			</form>

			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>
		
		<div class='whysign'>



<% String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
			<h1>Successfully Registered</h1>
<%} %>

<%
if("invalid".equals(msg))
{
%>
			<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>

			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
		
		
	</div>

</body>
</html>