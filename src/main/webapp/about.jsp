<%@include file="header1.jsp"%>
<%@page errorPage="error.jsp" %>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>About</title>
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
		                    Hey everyone!! we are here
							<br>
							<b>
							Vandan Bhingradiya
							<br>
							Ujas Patel
							<br>
							Harsh shah
							</b>
							<br><br>
							<b>
							Project: <i><u>E-Commerce WebApp</u></i></b>
							<br><br>
							<b><i>Contact us at :- <u>vandanujasharsh@gmail.com</u></i></b>
							<br>
							or
							<br>
							<b>contact us at Linkedin</b>
							
																								
																
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