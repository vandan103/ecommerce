<%@page import="project.ConnectionProvider,project.UserProvider, java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@page errorPage="error.jsp" %>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<br><br><br>
<html>
<head>
	<title>Change Details</title>
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
</head>
<body>
<%
	try{
		ResultSet rs = UserProvider.getUser(email);
		while(rs.next()){
%>

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
		                    <tr>    
		                        <td>
		                            <strong>
		                                <span class="glyphicon glyphicon-user  text-primary"></span>    
		                                Name                                                
		                            </strong>
		                        </td>
		                        <td class="text-primary">
		                            <%=rs.getString(2) %> 
		                        </td>
		                    </tr>
		                    
		                    <tr>        
		                        <td>
		                            <strong>
		                                <span class="glyphicon glyphicon-envelope text-primary"></span> 
		                                Email                                                
		                            </strong>
		                        </td>
		                        <td class="text-primary">
		                            <%=rs.getString(3) %>
		                        </td>
		                    </tr>
		                    <tr>        
		                        <td>
		                            <strong>
		                                <span class="glyphicon glyphicon-calendar text-primary"></span>
		                                Mobile Number
		                            </strong>
		                        </td>
		                        <td class="text-primary">
		                            <%=rs.getString(6) %>
		                        </td>
		                    </tr>
		                    <tr>        
		                        <td>
		                            <strong>
		                                <span class="glyphicon glyphicon-calendar text-primary"></span>
		                                Security Question
		                            </strong>
		                        </td>
		                        <td class="text-primary">
		                             <%=rs.getString(4) %>
		                        </td>
		                    </tr>                                    
		                </tbody>
		            </table>
		            </div>
		        </div>
		    </div>
		</div>
	</div>   
	<%}}catch(Exception e){
	out.print(e);
} %>                                     
</body>
</html>