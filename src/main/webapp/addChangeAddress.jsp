<%@page import="project.ConnectionProvider,project.UserProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@page errorPage="error.jsp" %>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
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
							try{
								ResultSet rs = UserProvider.getUser(email);
								while(rs.next()){
						%>
		                <form action="addChangeAddress" method="post">	                
		                        	<div class="form-group">
										<label for="inputAddress">Address</label>
										<input type="text" name="address" class="form-control" id="inputAddress" value="<%=rs.getString(8)%>" placeholder="House No" required>
									</div>
									<br>
									<div class="form-group">
										<label for="inputCity">City</label>
										<input type="text" name="city" class="form-control" id="inputCity" value="<%=rs.getString(9)%>" placeholder="Vadodara" required>
									</div>
									<br>
									<div class="form-group">
										<label for="inputState">State</label>
										<input type="text" name="state" class="form-control" id="inputState" value="<%=rs.getString(10)%>" placeholder="Gujarat" required>
									</div>
									<br>
									<div class="form-group">
										<label for="inputCountry">Country</label>
										<input type="text" name="country" class="form-control" id="inputCountry" value="<%=rs.getString(11)%>" placeholder="India" required>
									</div>
									<br>
		                        	<button type="submit" class="btn btn-primary">Update Address</button>
		                        	<% String msg=request.getParameter("msg");
										if("valid".equals(msg)){
										%>
										<h6 style="color:green;">Address Successfully Updated !</h6>
										<%} %>
										<% if("invalid".equals(msg)){
											%>
										<h6 style="color:red;">Some thing Went Wrong! Try Again!</h6>
										<%} %>
									
		                        	<br>
		                </form>  	
		                <% }}catch(Exception e){
								out.print(e);
								response.sendRedirect("changePassword.jsp?msg=invalid");
							} %>                             
		                </tbody>
		            </table>
		            </div>
		        </div>
		    </div>
		</div>
	</div>   
</body>
</html>