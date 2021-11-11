<html>
<head>
	<!-- <link rel="stylesheet" href="css/signup-style.css"> -->
	<title>Login</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<script>
		if(window.history.forward(1) !=null)
			window.history.forward(1);
	</script>
	
	<style>
		body {
			  background: #c9ccd1;
			}
		.form-style input {
			  border: 0;
			  height: 50px;
			  border-radius: 0;
			  border-bottom: 1px solid #ebebeb;
			}
		.form-style input:focus {
			  border-bottom: 1px solid #007bff;
			  box-shadow: none;
			  outline: 0;
			  background-color: #ebebeb;
			}
		.sideline {
			  display: flex;
			  width: 100%;
			  justify-content: center;
			  align-items: center;
			  text-align: center;
			  color: #ccc;
			}
		button {
			  height: 50px;
			}
		.sideline:before,
		.sideline:after {
			  content: "";
			  border-top: 1px solid #ebebeb;
			  margin: 0 20px 0 0;
			  flex: 1 0 20px;
			}
 
		.sideline:after {
			  margin: 0 0 0 20px;
			}
	</style>
</head>

<body>
	<div class="container">
  		<div class="row m-5 no-gutters shadow-lg">
    		<div class="col-md-6 d-none d-md-block">
      			<img src="https://images.unsplash.com/photo-1586077427825-15dca6b44dba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80" class="img-fluid" style="min-height:100%;" />
    		</div>
    		<div class="col-md-6 bg-white p-5">
      			<h4 class="pb-3">Login</h4>
      			<div class="form-style">
	        		<form action="login" method="post">
				          <div class="form-group pb-3">
				            <input type="email" name="email" placeholder="Enter Your Email" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please Enter Valid Email ID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
				          </div>
				          <div class="form-group pb-3">
				            <input type="password" name="password" placeholder="Enter Password" pattern="^((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,})$" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" class="form-control" id="exampleInputPassword1" required>
				          </div>
				          <div class="d-flex align-items-center justify-content-between">
				            <div class="d-flex align-items-center"><input name="" type="checkbox" value="" /> <span class="pl-2 font-weight-bold">Remember Me</span></div>
				            <div><a href="forgotPassword.jsp">Forgot Password?</a></div>
				          </div>
				          <div class="pb-2">
				            <button type="submit" class="btn btn-primary w-100 font-weight-bold mt-2" value="login">Submit</button>
				          </div>						<!-- btn btn-dark w-100 font-weight-bold mt-2 -->
				          <div class='whysignLogin'>
								<%
									String msg=request.getParameter("msg");
									if ("notexist".equals(msg)) {
									%>
									<h6 style="color:red;">Incorrect Username or Password</h6>
									<%} %>
									
									<%
									if ("invalid".equals(msg)) {
									%>
									<h6 style="color:red;">Some thing Went Wrong! Try Again !</h6>
									<%
									}
									%>
							</div>
				          
	        		</form>
        <!-- <div class="sideline">OR</div>
        <div>
          <button type="submit" class="btn btn-primary w-100 font-weight-bold mt-2"><i class="fa fa-facebook" aria-hidden="true"></i> Login With Facebook</button>
        </div> -->
			        <div class="pt-4 text-center">
			          If you are not Signed In. <a href="signup">Sign Up</a>
			        </div>
      			</div>
    		</div>
  		</div>
	</div>
</body>
</html>

