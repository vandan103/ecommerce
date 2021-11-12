<%@page import="project.ConnectionProvider,project.CartProvider, project.UserProvider, java.sql.*"%>
<%@include file="header1.jsp"%>
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
		
		<!-- myCart scripts -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
		<!--myCart scripts  -->
		
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<title>Address Payment For Orders</title>
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
									<th scope="col">Product Name</th>
									<th scope="col" style="padding-left: 0px;">Category</th>
									<th scope="col" width="100">Quantity</th>
									<th scope="col" width="140">Price</th>	
						          <th scope="col" width="140">Sub Total</th>									
																	
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
									<td><a href="incDecQuantity?id=<%=rs1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%= rs1.getString(9) %> <a	href="incDecQuantity?id=<%=rs1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
									<td><i class="fa fa-inr"></i><%=rs1.getString(4)%></td>		<!-- price -->
								<td><i class="fa fa-inr"></i><%=rs1.getString(11)%></td>		<!-- sub total -->
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
							<a href="home.jsp" class="btn btn-out btn-success btn-square btn-main mt-2"
							data-abc="true">Continue Shopping</a>
					</div>
				</div>
			</aside>
		</div>
	</section>
	
	<br>
	<aside class="col-lg-30">
	<div style="padding-left: 23.5%" class="container bootstrap snippets bootdey ">
		<div class="panel-body inf-content" style="max-width: 60%;">
		    <div class="row"  >
		        <div class="col-md-3">
		        </div>
		        <div class="col-md-8">
		            <br>
		            <div class="table-responsive">
		            <table class="table table-user-information">		                
		                <tbody>		
		                 <% try{
							ResultSet rs2 = UserProvider.getUser(email);
				 			while(rs2.next()){
						%>
		                    <form action="addressPaymentForOrder" method="post">             
		                        	<div class="form-group">
										<label for="inputAddress">Address</label>
										<input type="text" name="address" class="form-control" id="inputAddress" value="<%if(rs2.getString(8)=="null")rs2.getString(8);%>"placeholder="House No" required>
									</div>
									<!-- <br> -->
									<div class="form-group">
										<label for="inputCity">City</label>
										<input type="text" name="city" class="form-control" id="inputCity" value="<%if(rs2.getString(9)=="null") rs2.getString(9); %>" placeholder="Vadodara" required>
									</div>
									
									<div class="form-group">
										<label for="inputState">State</label>
										<input type="text" name="state" class="form-control" id="inputState" value="<% if(rs2.getString(10)=="null")rs2.getString(10); %>" placeholder="Gujarat" required>
									</div>
									
									<div class="form-group">
										<label for="inputCountry">Country</label>
										<input type="text" name="country" class="form-control" id="inputCountry" value="<%if(rs2.getString(11)=="null")rs2.getString(11); %>" placeholder="India" required>
									</div>
									
									<h6>Payment Option</h6>
		                        	<select name="paymentmethod" class="form-select" aria-label="Default select example">								
										  <option value="online" selected>Online Payment</option>
										  <option value="cod">Cash On Delivery</option>										  
									</select>
									<br>
									<div class="form-group">
										<label for="inputPay">Pay Online on this einfochips@pay.com</label>
										<input type="text" name="transacionId" class="form-control" id="inputPay" placeholder="Eg: T1234" required>
									</div>
									
									<div class="form-group">
										<label for="inputNumber">Mobile Number</label>
										<input type="text" name="number" class="form-control" id="inputNumber" value="<%=rs2.getString(6) %>" placeholder="Eg: 9672345678" required>
									</div>
		                        	<button type="submit" class="btn btn-primary">Proceed to Order Bill & Save</button>
									<% } } catch(Exception e){ System.out.print(e); } %> 
								<br>
						
		                </form>  		                                       
		                </tbody>
		            </table>
		            </div>
		        </div>
		    </div>
		</div>
	</div>   
	</aside>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
</body>
</html>


