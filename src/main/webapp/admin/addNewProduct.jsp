
<%@page import="project.ConnectionProvider, project.CategoryProvider,java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>


<% String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>


<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>

<form action="../addNewProduct" method="post">

<div class="left-div">

 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder=" enter name "
					required="required">
 
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <select class="input-style" name="category" required>
 <option value="">Select Category</option>
  <% ResultSet rs= CategoryProvider.getCategory(); 
    while(rs.next()){
  %>
   <option value= " <%= rs.getString(2) %>" > <%= rs.getString(2) %></option><%} %>
     
   
   </select>
 
 
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder=" enter Price "
					required="required">
 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select class="input-style" name="active">
   <option value="yes">Yes</option>
      <option value="no">No</option>
   
   </select>
<hr>
</div>
 <button class="button" >save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>