<%@page import="project.ConnectionProvider,project.UserProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>

<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>Change Mobile Number</title>
	<style>
		.inf-content{
					    border:1px solid #DDDDDD;
					    -webkit-border-radius:10px;
					    -moz-border-radius:10px;
					    border-radius:10px;
					    box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
					}
	</style>
</head>
<body>
	<br><br>
	<div style="padding-left: 23.5%" class="container bootstrap snippets bootdey ">
		<div class="panel-body inf-content" style="max-width: 60%;">
		    <div class="row"  >
		        <div class="col-md-3">
		        </div>
		        <div class="col-md-6">
		            <br>
		            <div class="table-responsive">
		            <table class="table table-user-information">		                
		                <tbody>		
		                <%
							try {
								ResultSet rs = UserProvider.getUser(email);
								while (rs.next()) {
							%>	             
		                <form action="changeMobileNumber" method="post">             
		                        	<div class="form-group">
										<label for="Mnumber">Enter your New Mobile Number</label>
										<input type="text" name="number" class="form-control" id="inputMnmber" placeholder="Eg: 9823458761" required>
									</div>
									<br>
									<div class="form-group">
										<label for="inputpassword">Enter Password(For Security)</label>
										<input type="password" name="password" class="form-control" id="inputpassword" placeholder="Enter your password" required>
									</div>									
									
									<br>
		                        	<button type="submit" class="btn btn-primary">Update Phone Number</button>
		                        	<%
										String msg = request.getParameter("msg");
										if ("done".equals(msg)) {
										%>
										<h6 style="color:green;">Your Mobile Number successfully changed!</h6>
										<%
										}
										%>
										<%
										if ("wrong".equals(msg)) {
										%>
										<h6 style="color:red;">Your Password is wrong!</h6>
										<%
										}
										%>
									
		                        <%
										}
										} catch (Exception e) {
										}
								%>
											<br>
		                </form>  		                                          
		                </tbody>
		            </table>
		            </div>
		        </div>
		    </div>
		</div>
	</div>   
	
</body>
<br>
<br>
<br>
</html>