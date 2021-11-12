<%@page import="project.ConnectionProvider,project.UserProvider, java.sql.*"%>
<%@include file="header1.jsp"%>
<%@page errorPage="error.jsp" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

	   <!-- Bootstrap CSS -->
		<!-- <link rel="preconnect" href="https://fonts.googleapis.com"> -->
		<!-- <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
		<!-- <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Rubik:wght@300&display=swap" rel="stylesheet"> -->	   
   		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
		<!-- <link rel="stylesheet" href="css/home1.css"> -->
		
		<!-- myCart scripts -->
		<link rel="stylesheet" href="css/myOrders.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
		<!--myCart scripts  -->
		
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<title>Home</title>
	</head>
<body>
	<section class="container-lg-fluid">
	    <div class="row">
	        <aside class="col-lg-9">
	            <div class="card" style="width: 83rem;">    
	                <div class="table-responsive">
	                    <table class="table table-borderless table-shopping-cart">
	                        <thead class="text-muted">
	                            <tr class="small text-uppercase">
	                                 
	  	                            <th scope="col" class="myOrder_menu" style="padding-left: 140px;"><b>Product Name</b></th>
	                                <th scope="col" class="myOrder_menu" style="padding-left: 0px;">Category</th>
	                                <th scope="col" class="myOrder_menu" width="120">Quantity</th>
	                                <th scope="col" class="myOrder_menu" width="120">Price</th>
	                                <th scope="col" class="myOrder_menu" width="120">Sub Total</th>
	                                <th scope="col" class="myOrder_menu" width="120">Order Date</th>
	                                <th scope="col" class="myOrder_menu" width="120">Expected Delivery Date</th>
	                                <th scope="col" class="myOrder_menu" width="120">Payment Method</th>
	                                <th scope="col" class="myOrder_menu" width="120">status</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        <%
	                        
								int sno=0;
								try{
									
									ResultSet rs= UserProvider.getUserOrder(email);
								    while(rs.next()){								    
							%>	                        
	                            <tr>
	                                <td>
	                                    <figure class="itemside align-items-center">
	                                        <div class="aside"><img src="images/<%=rs.getString(21) %>" class="img-sm" style="width:110px;height:80px"></div>
	                                        <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true"><%=rs.getString(17) %></a>
	                                        </figcaption>
	                                    </figure>
	                                </td>
	                                <td><%=rs.getString(18) %></td>
	                                <td><%=rs.getString(3) %></td>
	                                <td><i class="fa fa-inr"></i><%=rs.getString(19) %> </td>
	                                <td><i class="fa fa-inr"></i> <%=rs.getString(5) %></td>
	                                <td><%=rs.getString(11) %></td>
	                                <td><%=rs.getString(12) %></td>
	                                <td><%=rs.getString(13) %></td>
               						<td><%=rs.getString(15) %></td>
	                            </tr>
	                            <%}}catch(Exception e){
								        	 out.print(e); 
								         } %>
	                            
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </aside>
	    </div>
	</section>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
</body>
</html>
