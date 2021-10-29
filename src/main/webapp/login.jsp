<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="loginAction.jsp" method="post">
				<input name="email" type="email" placeholder="enter your email"
					pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
					title="Please Enter Valid Email ID" required="required"> 
					<input name="password" type="password"
					placeholder="enter your password" pattern="^((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,})$"
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" required="required"> <input
					type="submit" value="login">

			</form>

			<h2>
				<a href="signup.jsp">SignUp</a>
			</h2>
			<h2>
				<a href="forgotPassword.jsp">Forgot Password?</a>
			</h2>
		</div>
		<div class='whysignLogin'>

			<%
			String msg=request.getParameter("msg");
			if ("notexist".equals(msg)) {
			%>
			<h1>Incorrect Username or Password</h1>
			<%} %>
			
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Some thing Went Wrong! Try Again !</h1>
			<%
			}
			%>

			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>

</body>
</html>