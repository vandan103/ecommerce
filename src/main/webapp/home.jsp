<%@page import="project.ConnectionProvider,project.ProductProvider, java.sql.*"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<%@page errorPage="error.jsp" %>
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
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<title>Home</title>
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
	
	<section class="main" id="Harsh">
		<div class="container py-5">
			<div class="row py-5">
				<div class="col-lg-7 pt-5 text-center">
					<h1 class="pt-5">Welcome to Ecommerce Website</h1>
					<a href="#down"><button class="btn btn-primary btn-lg size">Our Products</button></a>
				</div>
			</div>
		</div>
	</section>
	
	<!-------------- Displaying products ------------>
	
	<%-- <%
	String msg = request.getParameter("msg");
	if ("added".equals(msg)) {
	%>
	<h3 class="alert">Product added successfully!</h3>
	<%
	}
	%>
	<%
	if ("exist".equals(msg)) {
	%>
	<h3 class="alert">Product already exist in you cart! Quantity
		increased!</h3>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">something went wrong!! please try again!!</h3>
	<%
	}
	%> --%>
	
	<section class="product" id="down">
		<div class="container py-5">	
			<div class="row py-5">
				<div class="col-lg-5 m-auto text-center">
					<h1>Available Products</h1>
					<h6 style="color: red;">Shop here!</h6>
				</div>
			</div>
		<div class="row">
			<%
			try{
				
				ResultSet rs = ProductProvider.getProducts();
				while(rs.next()){
				%>
			
				<div class="col-3 text-center">
					<div class="card border-0 bg-light mb-2">
						<div class="card-body">
							<img src="images/<%= rs.getString(6) %>" class="img-fluid">
						</div>
					</div>
					<h6><%=rs.getString(2) %></h6>
					<p><%=rs.getString(3) %></p>
					<p><%=rs.getString(4) %></p>
					<p><a href="AddToCart?id=<%=rs.getString(1) %>"><button class="btn btn-primary btn-md">Add to cart <i class='fas fa-cart-plus'></i></button></a></p>					
				</div>
				
			<% }}
				catch (Exception e) {
					System.out.println(e);
				}
				%>
			</div>
				<%
						String msg = request.getParameter("msg");
						if ("added".equals(msg)) {
						%>
						<h6 style="color:red;">Product added successfully!</h6>
						<%
						}
						%>
						<%
						if ("exist".equals(msg)) {
						%>
						<h6 style="color:red;">Product already exist in you cart! Quantity
							increased!</h6>
						<%
						}
						%>
						<%
						if ("invalid".equals(msg)) {
						%>
						<h6 style="color:red;">something went wrong!! please try again!!</h6>
						<%
						}
					%>
				
		</div>
	</section>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
</body>
</html>