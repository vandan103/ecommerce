<%@page import="project.ConnectionProvider, java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Category</title>
</head>
<body>


<% String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Category Added Successfully!</h3>
<%} %>


<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>

<form action="addNewCategoryAction.jsp" method="post">
<%-- <h3 style="color: yellow;">Product ID:  <% out.println(id); %> </h3> --%>
<%-- <input type="hidden" name="id" value="<% out.println(id); %>"> --%>


<div class="left-div">

 <h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder=" enter Category "
					required="required">
 
<hr>
</div>


 <button class="button" >Add<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>