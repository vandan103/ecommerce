<%@page import="project.ConnectionProvider,project.CartProvider, java.sql.*"%>
<%@include file="header1.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<%@page errorPage="error.jsp" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

	   <!-- Bootstrap CSS -->
		<!-- <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Rubik:wght@300&display=swap" rel="stylesheet">	   
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		 -->
		
		<!-- myCart scripts -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/home1.css">
		<link rel="stylesheet" href="css/myCart.css">
		<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
		<!--myCart scripts  -->
		
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<title>Home</title>
	</head>
<body>	
	<%
	String msg = request.getParameter("msg");
	if ("notpossible".equals(msg)) {
	%>
	<h5 style="color:red;">There is only one Quantity! So click on remove!</h5>
	<%
	}
	%>
	<%
	if ("inc".equals(msg)) {
	%>
	<h6 style="color:green;text-align:center;">Quantity Increased Successfully!</h6>
	<%
	}
	%>
	<%
	if ("dec".equals(msg)) {
	%>
	<h6 style="color:green;text-align:center;">Quantity Decreased Successfully!</h6>
	<%
	}
	%>
	<%
	if ("removed".equals(msg)) {
	%>
	<h6 style="color:green;text-align:center;">Product Successfully Removed!</h6>
	<%
	}
	%>
	
	<section class="container-lg-fluid">
		<div class="row">
			<aside class="col-lg-9">
				<div class="card">
					<div class="table-responsive">
						<table class="table table-borderless table-shopping-cart">
							<thead class="text-muted">
								<tr class="big text-uppercase">
									<th scope="col" class="myCart_menu" style="padding-left: 100px;"><b>Product Name</b></th>
									<th scope="col" class="myCart_menu" style="padding-left: 0px;color: black"><b>Category</b></th>
									<th scope="col" class="myCart_menu" width="100"><b>Quantity</b></th>
									<th scope="col" class="myCart_menu" width="140"><b>Price</b></th>	
						          <th scope="col" class="myCart_menu" width="140"><b>Sub Total</b></th>									
																	
								</tr>
							</thead>
							
							<tbody>
							<%
								try {
									ResultSet rs1 = CartProvider.getCartProduct(email);
									while (rs1.next()) {	
							%>
							
								<tr>					
									<td>
										<figure class="itemside align-items-center">
											<div class="aside">
												<img src="images/<%=rs1.getString(6) %>" class="img-sm" style="width:110px;height:80px"> <!-- image -->
											</div>
											<figcaption class="info"><!-- product name -->
												<a href="#" class="title text-dark" data-abc="true"><%=rs1.getString(2)%></a>
											</figcaption>
										</figure>
									</td>							<!-- category -->
									<td class="text-center-left" style="padding-left: 0px;"><%=rs1.getString(3)%></td>
									<td><a href="incDecQuantity?id=<%=rs1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%= rs1.getString(9) %> <a	href="incDecQuantity?id=<%=rs1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
									<td><i class="fa fa-inr"></i><%=rs1.getString(10)%></td>
								<td><i class="fa fa-inr"></i><%=rs1.getString(11)%></td>
									
									<td class="text-right d-none d-md-block">
									<a href="removeFromCart?id=<%=rs1.getString(1) %>" class="btn btn-light" data-abc="true">Remove</a></td>
								</tr>
							<%}}catch(Exception e){ System.out.print(e); } %> 
							</tbody>
						</table>
					</div>
				</div>
			</aside>
			<aside class="col-lg-3">
				<%
								try {
									ResultSet rs2 = CartProvider.getCartTotal(email);
									while (rs2.next()) {	
							%>
				<div class="card">
					<div class="card-body">
						<dl class="dlist-align">						
							<dt>Total price:</dt>
							<dd class="text-right ml-3"><%= rs2.getString(1) %></dd>
						</dl>
						<dl class="dlist-align">
							<dt>Discount:</dt>
							<dd class="text-right text-danger ml-3">- 0.0</dd>
						</dl>
						<dl class="dlist-align">
							<dt>Total:</dt>
							<dd class="text-right text-dark b ml-3">
								<strong><%= rs2.getString(1) %></strong>
							</dd>
														<%}}catch(Exception e){ System.out.print(e); } %> 
							
						</dl>
						<hr>
						<a href="addressPaymentForOrder.jsp" class="btn btn-out btn-primary btn-square btn-main"
							data-abc="true"> Proceed to Order </a> 
							<a href="home.jsp" class="btn btn-out btn-success btn-square btn-main mt-2"
							data-abc="true">Continue Shopping</a>
					</div>
				</div>
			</aside>
		</div>
		<%-- <%}}catch(Exception e){ System.out.print(e); } %>  --%>
	</section>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
</body>
</html>


