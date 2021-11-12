<%@page errorPage="error.jsp" %>

<%@page import="project.ConnectionProvider,project.ProductProvider, java.sql.*"%>
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
						name="search" aria-label="Search">
					<button class="btn0" type="submit"><i class="fa fa-search"></i></button>

				<%-- <a href="#"><h5 style="margin-right: 3px;margin-left: 2px;color:black;"><% out.println(name); %> <i class='glyphicon glyphicon-search'></i></h5></a> --%>
				</form>
			</div>
		</div>
	</nav>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
</body>
</html>