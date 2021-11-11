<%@page import="project.ConnectionProvider,project.CartProvider,project.UserProvider, java.sql.*"%>
<%@include file="footer.jsp"%>
<%@page errorPage="error.jsp" %>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total = 0;
int sno = 0;
try {
	ResultSet rs = CartProvider.getCartTotal(email);
	while (rs.next()) {
		total = rs.getInt(1);
		System.out.print(total);
	}
%>

          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <% out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
			ResultSet rs1 = CartProvider.getCartProduct(email);
			while (rs1.next()) {	
			%>
        
          <tr>
          <%sno = sno + 1;%>
           <td><%
					out.println(sno);
					%></td>
            <td><%=
					rs1.getString(2)
					%></td>
            <td><%=
					rs1.getString(3)
					%></td>
            <td><i class="fa fa-inr"></i><%= rs1.getString(4) %> </td>
            <td> <%= rs1.getString(9) %></td>
            <td><i class="fa fa-inr"></i>  <%= rs1.getString(11) %></td>
            </tr>
         <%}
			ResultSet rs2 = UserProvider.getUser(email);
 			while(rs2.next()){
				
			
			
			%>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrder" method="post">
 <div class="left-div">
 
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<% if(rs2.getString(8)=="null")rs2.getString(8);%>" placeholder="enter address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%if(rs2.getString(9)=="null") rs2.getString(9); %>" placeholder="enter city" required>


</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<% if(rs2.getString(10)=="null")rs2.getString(10); %>" placeholder="enter state" required>


</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<% if(rs2.getString(11)=="null")rs2.getString(11); %>" placeholder="enter country" required>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentmethod">
 <option value="cod"> Cash On Delivery(COD)</option>
  <option value="online">Online Payment</option>
 
 </select>
</div>

<div class="right-div">
<h3>Pay online on this einfochips@pay.com</h3>
<input class="input-style" type="text" name="transacionId"  " placeholder="enter transacion Id" >

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="number" value="<%= rs2.getString(6) %>" placeholder="enter mobile number" required>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>


<button class="button" type="submit">Proceed to order bill and Save <i class='far fa-arrow-alt-circle-right'></i>  	</button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
 <%}}catch(Exception e){ System.out.print(e); } %>

      <br>
      <br>
      <br>

</body>
</html>