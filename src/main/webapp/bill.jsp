<%@page import="project.ConnectionProvider,project.CartProvider, java.sql.*"%>
<%@include file="footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
	<% String email = session.getAttribute("email").toString();
try{
    int total = 0;
	int sno = 0;
ResultSet rs = CartProvider.getCartBill(email);
while (rs.next()) {
	total = rs.getInt(1);
}
ResultSet rs2 = CartProvider.getBillUserInfo(email);
while (rs2.next()) {
%>

	<h3>Online shopping Bill</h3>
	<hr>
	<div class="left-div">
		<h3>Name: <%=rs2.getString(2) %></h3>
	</div>
	<div class="right-div-right">
		<h3>Email:<%out.print(email); %></h3>
	</div>
	<div class="right-div">
		<h3>Mobile Number:<%=rs2.getString(6) %></h3>
	</div>

	<div class="left-div">
		<h3>Order Date:<%=rs2.getString(22) %></h3>
	</div>
	<div class="right-div-right">
		<h3>Payment Method:<%=rs2.getString(24) %></h3>
	</div>
	<div class="right-div">
		<h3>Expected Delivery:<%=rs2.getString(23) %></h3>
	</div>

	<div class="left-div">
		<h3>Transaction Id:<%=rs2.getString(25) %></h3>
	</div>
	<div class="right-div-right">
		<h3>City:<%=rs2.getString(9) %></h3>
	</div>
	<div class="right-div">
		<h3>Address:<%=rs2.getString(8) %></h3>
	</div>

	<div class="left-div">
		<h3>State:<%=rs2.getString(10) %></h3>
	</div>
	<div class="right-div-right">
		<h3>Country:<%=rs2.getString(11) %></h3>
	</div>

	<hr>
<% break; }%>

	<br>

	<table id="customers">
		<h3>Product Details</h3>
		<tr>
			<th>S.No</th>
			<th>Product Name</th>
			<th>category</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>
		</tr>
<%
  ResultSet rs1 = CartProvider.getBillProductInfo(email);
  while (rs1.next()) 
  {
	  sno = sno + 1;
  %>
		<tr>
			<td><%out.println(sno); %></td>
		    <td><%=rs1.getString(17) %></td>
		    <td><%=rs1.getString(18) %></td>
		    <td><%=rs1.getString(19) %></td>
		    <td><%=rs1.getString(3) %></td>
		    <td><%=rs1.getString(5) %></td>
		</tr>
		<tr>
		<%} %>
	</table>
	<h3>Total:<%  out.println(total); %></h3>
	<a href="continueShopping"><button class="button left-button">Continue
			Shopping</button></a>
	<a onclick="window.print();"><button class="button right-button">Print</button></a>
	<br>
	<br>
	<br>
	<br>
<%
}  catch (Exception e) {
	System.out.println(e);
}
%>
</body>
</html>