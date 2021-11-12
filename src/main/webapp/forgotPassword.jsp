<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<!DOCTYPE html>
<html>
<head>
	<title>ForgotPassword</title>
	<link rel="stylesheet" href="css/forgotPassword.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
</head>
<body>
	<div id="content" class="flex">
    <div class="">
        <div class="page-content page-container" id="page-content">
            <div class="padding">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header"><strong>Reset Password</strong></div>
                            <div class="card-body">
                                <form action="forgotPassword" method="post">
                                    <div class="form-group">
                                    	<label class="text-muted" for="exampleInputEmail1">Email address</label>
                                    	<input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="example@gmail.com" required> 
                                    </div>
                                    
                                    <div class="form-group">
                                    	<label class="text-muted" for="exampleNumber">Enter Your Number</label>
                                    	<input type="text" name="number" class="form-control" id="exampleNumber" aria-describedby="emailHelp" placeholder="9812345678" required> 
                                    </div>
                                    
                                    <div class="form-group">
									    <label for="exampleFormControlSelect1">Select Security Question</label>
									    <select name="question" class="form-control" id="exampleFormControlSelect1">
									    	<option value="pet name">Pet name</option>
											<option value="car name">Car name</option>		
									    </select>
									</div>
									
									<div class="form-group">
                                    	<label class="text-muted" for="exampleAnswer">Answer</label>
                                    	<input type="text" name="answer" class="form-control" id="exampleAnswer" aria-describedby="emailHelp" placeholder="Eg: Max" required> 
                                    </div>
									
                                    <div class="form-group">
                                    	<label class="text-muted" for="exampleInputPassword1">Password</label>
                                    	<input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" required> </div>
                                    <button type="submit" value="save" class="btn btn-primary">Reset Password</button>
                                	<%
										String msg=request.getParameter("msg");
										if ("done".equals(msg)) {
										%>
											<h5 style="color:green;">Password Changed Successfully!</h5>
											<%} %>
											<%
											if ("invalid".equals(msg)) {
											%>
											<h5 style="color:red;">Some thing Went Wrong! Try Again !</h5>
										<%} %>
                                </form>
                                <br>
                                <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>