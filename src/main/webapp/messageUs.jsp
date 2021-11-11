<%@page import="project.ConnectionProvider, project.UserProvider, java.sql.*"%>
<%@include file="header1.jsp"%>

<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>Message Us</title>
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
		                           
		                <form action="messageUs" method="post">             
		                        	<div class="mb-3">
										<label for="inputSubject" class="form-label">Subject</label>
										<input type="text" name="subject" class="form-control" id="inputSubject" placeholder="Eg: Defect in Product" required>
									</div>
									<div class="mb-3">
										<label for="inputMessage" class="form-label">Message</label>
										<textarea class="form-control" name="body" id="inputMessage" rows="3" placeholder="Type your message here" required></textarea>
									</div>								
									<br>
		                        	<button type="submit" class="btn btn-primary">Send Message</button>
									<%
										String msg = request.getParameter("msg");
										if ("valid".equals(msg)) {
										%>
										<h6 style="color:green;">Message successfully sent. Our team will contact you soon!</h6>
										<%
										}
										%>
										<%
										if ("invalid".equals(msg)) {
										%>
										<h6 style="color:red;">Some thing Went Wrong! Try Again!</h6>
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