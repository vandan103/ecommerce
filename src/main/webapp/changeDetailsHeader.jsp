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
	<% String email=session.getAttribute("email").toString(); %>
    <%String name=session.getAttribute("name").toString(); %>
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="home.jsp" style="padding-left: 2px;">Ecommerce</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav m-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link" href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></li>
					<li class="nav-item"><a class="nav-link" href="changeDetails.jsp">Your Profile(<%out.print(name); %>) <i class='fas fa-user-alt'></i></a></li>
					<li class="nav-item"><a class="nav-link" href="changePassword.jsp">Change Password</a></li>
					<li class="nav-item"><a class="nav-link" href="addChangeAddress.jsp">Change Address</a></li>
					<li class="nav-item"><a class="nav-link" href="changeSecurityQuestion.jsp">Change Security Question</a></li>
					<li class="nav-item"><a class="nav-link" href="changeMobileNumber.jsp">Change Mobile Number</a></li>
				</ul>
				
			</div>
		</div>
	</nav>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
</body>
</html>