<%@page import="project.ConnectionProvider, java.sql.*"%>
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
		<link rel="stylesheet" href="css/home1.css">
		<title>Home</title>
	</head>
<body>
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
					<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">My Cart</a></li>
					<li class="nav-item"><a class="nav-link" href="#">My Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Change Details</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Message Us</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
				</ul>
				<form class="d-flex">
					<input class="px-2 search" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn0" type="submit">Search</button>
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
	
	<%
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
	%>
	
	
	<%-- <%
	try {
		Connection con = ConnectionProvider.getcon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from product where active='yes'");
	 /* catch (Exception e) {
		System.out.println(e);
	} */
	while (rs.next()) {
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
				try {
					Connection con = ConnectionProvider.getcon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from product where active='yes'");
					while (rs.next()) {
			%>
			
			
			<!-- 1st Product -->
				<div class="col-3 text-center">
					<div class="card border-0 bg-light mb-2">
						<div class="card-body">
							<img src="images/bg_1.jpg" class="img-fluid">
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
			<!-- 2st Product -->
				<%-- <div class="col-lg-3 text-center">
					<div class="card border-0 bg-light mb-2">
						<div class="card-body">
							<img src="images/bg_1.jpg" class="img-fluid">
						</div>
					</div>
					<h6><%=rs.getString(2) %></h6>
					<p><%=rs.getString(3) %></p>
					<p><%=rs.getString(4) %></p>
					<p><a href="AddToCart?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></p>
				</div>
				
			<!-- 3st Product -->
				<div class="col-lg-3 text-center">
					<div class="card border-0 bg-light mb-2">
						<div class="card-body">
							<img src="images/bg_1.jpg" class="img-fluid">
						</div>
					</div>
					<h6><%=rs.getString(2) %></h6>
					<p><%=rs.getString(3) %></p>
					<p><%=rs.getString(4) %></p>
					<p><a href="AddToCart?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></p>
				</div>
				
			<!-- 1st Product -->
				<div class="col-lg-3 text-center">
					<div class="card border-0 bg-light mb-2">
						<div class="card-body">
							<img src="images/bg_1.jpg" class="img-fluid">
						</div>
					</div>
					<h6><%=rs.getString(2) %></h6>
					<p><%=rs.getString(3) %></p>
					<p><%=rs.getString(4) %></p>
					<p><a href="AddToCart?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></p>
				</div> --%>
			
			</div>
				
		</div>
	</section>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
</body>
</html>