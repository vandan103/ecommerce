<%@page import="project.ConnectionProvider, project.UserProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>

<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>Change Security Question</title>
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
		                <form action="changeSecurityQuestion" method="post">	                
		                    <!-- <tr>    
		                        <td> -->
		                        	<h6>Select New Security Question</h6>
		                        	<select name="question" class="form-select" aria-label="Default select example">								
										  <option value="pet name" selected>Pet name</option>
										  <option value="car name">Car name</option>										  
									</select>
									<br>									
						
									<div class="form-group">
										<label for="inputAnswer">Enter New Answer</label>
										<input type="text" name="newans" class="form-control" id="inputAnswer" placeholder="Eg: max" required>
									</div>
									<br>
									<div class="form-group">
										<label for="inputpass">Enter Password(For Security)</label>
										<input type="password" name="password" class="form-control" id="inputpass" placeholder="Enter your password" required>
									</div>									
									
									<br>
		                        	<button type="submit" class="btn btn-primary">Update Security Question</button>
		                        	<%
										String msg = request.getParameter("msg");
										if ("done".equals(msg)) {
										%>
										<h6 style="color:green;">Your security Question successfully changed !</h6>
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
</html>