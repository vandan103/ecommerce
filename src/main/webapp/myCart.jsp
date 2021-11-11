<%@page import="project.ConnectionProvider,project.CartProvider, java.sql.*"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>

<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

	   <!-- Bootstrap CSS -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Rubik:wght@300&display=swap" rel="stylesheet">	   
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/home1.css">
		
		<!-- myCart scripts -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
		<!--myCart scripts  -->
		
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<title>Home</title>
		<style>
			@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

				body {
				    background-color: #eeeeee;
				    font-family: 'Open Sans', serif;
				    font-size: 14px
				}
				
				.container-fluid {
				    margin-top: 70px
				}
				
				.card-body {
				    -ms-flex: 1 1 auto;
				    flex: 1 1 auto;
				    padding: 1.40rem
				}
				
				.img-sm {
				    width: 80px;
				    height: 80px
				}
				
				.itemside .info {
				    padding-left: 15px;
				    padding-right: 7px
				}
				
				.table-shopping-cart .price-wrap {
				    line-height: 1.2
				}
				
				.table-shopping-cart .price {
				    font-weight: bold;
				    margin-right: 5px;
				    display: block
				}
				
				.text-muted {
				    color: #969696 !important
				}
				
				a {
				    text-decoration: none !important
				}
				
				.card {
				    position: relative;
				    display: -ms-flexbox;
				    display: flex;
				    -ms-flex-direction: column;
				    flex-direction: column;
				    min-width: 0;
				    word-wrap: break-word;
				    background-color: #fff;
				    background-clip: border-box;
				    border: 1px solid rgba(0, 0, 0, .125);
				    border-radius: 0px
				}
				
				.itemside {
				    position: relative;
				    display: -webkit-box;
				    display: -ms-flexbox;
				    display: flex;
				    width: 100%
				}
				
				.dlist-align {
				    display: -webkit-box;
				    display: -ms-flexbox;
				    display: flex
				}
				
				[class*="dlist-"] {
				    margin-bottom: 5px
				}
				
				.coupon {
				    border-radius: 1px
				}
				
				.price {
				    font-weight: 600;
				    color: #212529
				}
				
				.btn.btn-out {
				    outline: 1px solid #fff;
				    outline-offset: -5px
				}
				
				.btn-main {
				    border-radius: 2px;
				    text-transform: capitalize;
				    font-size: 15px;
				    padding: 10px 19px;
				    cursor: pointer;
				    color: #fff;
				    width: 100%
				}
				
				.btn-light {
				    color: #ffffff;
				    background-color: #F44336;
				    border-color: #f8f9fa;
				    font-size: 12px
				}
				
				.btn-light:hover {
				    color: #ffffff;
				    background-color: #F44336;
				    border-color: #F44336
				}
				
				.btn-apply {
				    font-size: 11px
				}
		</style>
	</head>
<body>
	<%String name=session.getAttribute("name").toString(); %>
    <%String email=session.getAttribute("email").toString(); %>
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="#">Ecommerce</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav m-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="myCart.jsp">My Cart</a></li>
					<li class="nav-item"><a class="nav-link" href="myOrders.jsp">My Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="changeDetails.jsp">Change Details</a></li>
					<li class="nav-item"><a class="nav-link" href="messageUs.jsp">Message Us</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
				</ul>
				<form class="d-flex" action="searchHome.jsp" method="post">
					<input class="px-2 search" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn0" type="submit">Search</button>
				<%-- <a href="#"><h5 style="margin-right: 3px;margin-left: 2px;color:black;"><% out.println(name); %> <i class='glyphicon glyphicon-search'></i></h5></a> --%>
				</form>
			</div>
		</div>
	</nav>
	
	<!--Displaying products in myCart page  -->
	
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
	<h5 style="color:green;">Quantity Increased Successfully!</h5>
	<%
	}
	%>
	<%
	if ("dec".equals(msg)) {
	%>
	<h5 style="color:green;">Quantity Decreased Successfully!</h5>
	<%
	}
	%>
	<%
	if ("removed".equals(msg)) {
	%>
	<h5 style="color:green;">Product Successfully Removed!</h5>
	<%
	}
	%>
	
	<section class="container-fluid">
		<div class="row">
			<aside class="col-lg-9">
				<div class="card">
					<div class="table-responsive">
						<table class="table table-borderless table-shopping-cart">
							<thead class="text-muted">
								<tr class="small text-uppercase">
									<th scope="col">Product</th>
									<th scope="col" style="padding-left: 0px;">Category</th>
									<th scope="col" width="100">Quantity</th>
									<th scope="col" width="140">Price</th>									
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
												<img src="images/<%=rs1.getString(6) %>" class="img-sm"> <!-- image -->
											</div>
											<figcaption class="info"><!-- product name -->
												<a href="#" class="title text-dark" data-abc="true"><%=rs1.getString(2)%></a>
											</figcaption>
										</figure>
									</td>							<!-- category -->
									<td class="text-center-left" style="padding-left: 0px;"><%=rs1.getString(3)%></td>
									<td><a href="incDecQuantity?id=<%=rs1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%= rs1.getString(8) %> <a	href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
									<td><i class="fa fa-inr"></i><%=rs1.getString(4)%></td>
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
				<!-- <div class="card mb-3">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label>Have coupon?</label>
								<div class="input-group">
									<input type="text" class="form-control coupon" name=""
										placeholder="Coupon code"> <span
										class="input-group-append">
										<button class="btn btn-primary btn-apply coupon">Apply</button>
									</span>
								</div>
							</div>
						</form>
					</div>
				</div> -->
				<div class="card">
					<div class="card-body">
						<dl class="dlist-align">						
							<dt>Total price:</dt>
							<dd class="text-right ml-3">69.97</dd>
						</dl>
						<dl class="dlist-align">
							<dt>Discount:</dt>
							<dd class="text-right text-danger ml-3">- 0.0</dd>
						</dl>
						<dl class="dlist-align">
							<dt>Total:</dt>
							<dd class="text-right text-dark b ml-3">
								<strong>59.97</strong>
							</dd>
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


