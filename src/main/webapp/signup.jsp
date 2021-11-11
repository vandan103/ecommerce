<%-- <!DOCTYPE html>
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
			<form action="signup" method="post">
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
					pattern="^((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,})$"
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
			<%
			if ("exist".equals(msg)) {
			%>
			<h1>Email Already Registered Please <a href="login.jsp">Login</a></h1>
			<%
			}%>

			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>


	</div>

</body>
</html> --%>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <!-- <link rel="stylesheet" href="css/style.css"> -->
    <link rel="stylesheet" href="css/style.css">
	
    <title>Sign Up</title>
  </head>
  <body>
  

  <div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">
    		
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7 py-5 space">
            <h3>Register</h3>
            <br>
            <form action="signup" method="post">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group first">
                    <label for="fname">Name</label>
                    <input type="text" name="name" class="form-control" placeholder="Enter your name" id="fname" required>
                  </div>    
                </div>
                <div class="col-md-6">
                  <div class="form-group first">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" class="form-control" placeholder="e.g. harsh@your-domain.com" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please Enter Valid Email ID" id="email" required>
                  </div>    
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group first">
                    <label for="email">Select Security Question</label>
                    <br>
                    <!-- <input type="email" class="form-control" placeholder="e.g. john@your-domain.com" id="email"> -->
                  		<select class="selectpicker form-control" name="question">
						  <!-- <option selected>Select Security Question</option> -->
						  <option value="pet name" selected>pet name</option>
						  <option value="car name">car name</option>
						  <!-- <option value="3">Three</option> -->
						</select>
                  </div>    
                </div>
                <div class="col-md-6">
                  <div class="form-group last mb-3">
                    <label for="sec_answer">Answer</label>
                    <input type="text" name="answer" class="form-control" placeholder="Enter Answer for Question" id="sec_answer" required>
                  </div>    
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group first">
                    <label for="phnumber">Phone Number</label>
                    <input type="text" name="number" class="form-control" placeholder="Enter your number" pattern="^[0-9]{10}$" title="Mobile Number Should Be 10 Digit only" id="phnumber" required>
                  </div>    
                </div>
                <div class="col-md-6">
                  <div class="form-group last mb-3">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Your Password" pattern="^((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,})$" id="password" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" required>
                  </div>    
                </div>
              </div>
              <!-- <div class="row">
                <div class="col-md-6">
                  <div class="form-group last mb-3">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Your Password" pattern="^((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,})$" id="password" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group last mb-3">
                    <label for="re-password">Re-type Password</label>
                    <input type="password" class="form-control" placeholder="Your Password" id="re-password">
                  </div>
                </div>
              </div> -->
              
              <!-- <div class="d-flex mb-5 mt-4 align-items-center">
                <div class="d-flex align-items-center">
                	<label class="control control--checkbox mb-0"><span class="caption">Creating an account means you're okay with our <a href="#">Terms and Conditions</a> and our <a href="#">Privacy Policy</a>.</span>
                  		<input type="checkbox" checked="checked"/>
                  		<div class="control__indicator"></div>
                	</label>
              	</div>
              </div> -->

              <input type="submit" value="signup" class="btn px-5 btn-primary">
              <!-- <a href="login.jsp"><input type="button" class="btn px-5 btn-primary" value="login"></a>  -->
              <!-- <a href="login.jsp"><button type="submit" class="btn px-5 btn-primary" value="login">Login</button></a> -->
            <div class='whysign'>
			    	<%
						String msg = request.getParameter("msg");
						if ("valid".equals(msg)) {
						%>
						<h6 style="color:green;">Successfully Registered</h6>
						<%
						}
						%>
			
						<%
						if ("invalid".equals(msg)) {
						%>
						<h6 style="color:red;">Some thing Went Wrong! Try Again !</h6>
						<%
						}
						%>
						<%
						if ("exist".equals(msg)) {
						%>
						<h6 style="color:red;">Email Already Registered Please <a href="login.jsp">Login</a></h6>
						<%
						}%>
			    	
			    </div>
            
            </form>
            <a href="login.jsp"><button type="submit" class="btn px-5 btn-primary" value="login">Login</button></a>
            <!-- <form> 
            	<a href="login.jsp"><button type="submit" class="btn px-5 btn-primary" value="login">Login</button></a>
            </form> -->
          </div>
        </div>
      </div>
    </div>
	
    
  </div>
	
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>