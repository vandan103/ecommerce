<%@page import="project.ConnectionProvider,project.UserProvider, java.sql.*"%>
<%@include file="header1.jsp"%>

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
	<section class="container-fluid">
	    <div class="row">
	        <aside class="col-lg-9">
	            <div class="card" style="width: 83rem;">    
	                <div class="table-responsive">
	                    <table class="table table-borderless table-shopping-cart">
	                        <thead class="text-muted">
	                            <tr class="small text-uppercase">
	                                 
	  	                                <th scope="col" style="padding-left: 140px;">Product Name</th>
	                                <th scope="col" style="padding-left: 0px;">Category</th>
	                                <th scope="col" width="120">Quantity</th>
	                                <th scope="col" width="120">Price</th>
	                                <th scope="col" width="120">Sub Total</th>
	                                <th scope="col" width="120">Order Date</th>
	                                <th scope="col" width="120">Expected Delivery Date</th>
	                                <th scope="col" width="120">Payment Method</th>
	                                <th scope="col" width="120">status</th>
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
	                                        <div class="aside"><img src="images/<%=rs.getString(21) %>" class="img-sm"></div>
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
