<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>SignUp</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
		<!--whenever this form has been submitted, response will be send to  
		signupAction.jsp page-->
			<form action="signupAction.jsp" method="post">
				<input type="text" name="name" placeholder=" enter your name "

					required="required"> <input type="email" name="email"
					placeholder="enter your email "
					pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
					title="Please Enter Valid Email ID" required="required"> <input
					type="text" name="number" placeholder="enter your number "
					pattern="^[0-9]{10}$" title="Mobile Number Should Be 10 Digit only"
					required="required"> select security question<select
					name="question">

					<option value="pet name">pet name</option>
					<option value="car name">car name</option>
				</select> <input type="text" name="answer"
					placeholder="enter answer for question" required="required">
				<input type="password" name="password" placeholder="enter password"
					pattern="^((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,8})$"
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters"
					required="required"> <input type="submit" value="signup">
			</form>

			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>

		<div class='whysign'>



			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Successfully Registered</h1>
			<%
			}
			%>

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