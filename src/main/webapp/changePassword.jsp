<%@page import="project.ConnectionProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@page errorPage="error.jsp" %>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
	<title>Change Password</title>
	<style>
		.inf-content{
					    border:1px solid #DDDDDD;
					    -webkit-border-radius:10px;
					    -moz-border-radius:10px;
					    border-radius:10px;
					    box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
					}
				.size {
					padding:2rem !important;
				}			  
	</style>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<br><br><br>
	<div class="container bootstrap snippets bootdey">
		<div class="panel-body inf-content">
		    <div class="row">
		        <div class="col-md-4 size">
		            <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip" src="https://bootdey.com/img/Content/avatar/avatar7.png" data-original-title="Usuario"> 
		            
		        </div>
		        <div class="col-md-6">
		            <br>
		            <div class="table-responsive">
		            <table class="table table-user-information">		                
		                <tbody>	
		                <form action="changePassword" method="post">	                
		                    <tr>    
		                        <td>
		                            <!-- <strong>
		                                <span class="text-primary"></span>    
		                                Enter Old Password                                                
		                            </strong> -->
		                            <div class="form-group">
									    	<label for="exampleInputPassword1">Enter Old Password</label>
									    	<input type="password" class="form-control" id="exampleInputPassword1" name="oldpwd" placeholder="Password" required>
									 </div>
									<br>
		                             <div class="form-group">
									    	<label for="exampleInputPassword2">Enter New Password</label>
									    	<input type="password" class="form-control" id="exampleInputPassword2" name="newpwd" placeholder="Password" required>
									 </div>
									 <br>
									 <div class="form-group">
									    	<label for="exampleInputPassword3">Confirm New Password</label>
									    	<input type="password" class="form-control" id="exampleInputPassword3" name="cnfpwd" placeholder="Password" required>
									 </div>
									 <br>
									 <button type="submit" class="btn btn-primary">Update Password</button>
		                        	<% String msg=request.getParameter("msg");
										if("notmatch".equals(msg)){
										%>
										<h6 style="color:red;">New password and Confirm password does not match!</h6>
										<%} %>
										<%if("wrong".equals(msg)){ %>
										<h6 style="color:red;">Your old Password is wrong!</h6>
										<%} %>
										<%if("done".equals(msg)){ %>
										
										<h6 style="color:green;">Password change successfully!</h6>
										<%} %>
										
										<%if("invalid".equals(msg)){ %>
										
										<h6 style="color:red;">Some thing went wrong! Try again!</h6>
										<%} %>
		                        	
		                        </td>
		                        <!-- <td class="text-primary">
		                            harsh
		                        </td> -->
		                    </tr>
		                    
		                    <!-- <tr>        
		                        <td>
		                            <strong>
		                                <span class="text-primary"></span> 
		                                Enter New Password                                                
		                            </strong>
		                        </td>
		                        <td class="text-primary">
		                            @gmail
		                        </td>
		                    </tr>
		                    <tr>        
		                        <td>
		                            <strong>
		                                <span class="text-primary"></span>
		                                Confirm New Password
		                            </strong>
		                        </td>
		                        <td class="text-primary">
		                           1234
		                        </td>
		                    </tr> -->
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