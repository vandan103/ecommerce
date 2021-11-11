<%@page import="project.ConnectionProvider,project.ProductProvider, java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
<%   String imgFileName=(String)request.getAttribute("img"); %>
</style>
</head>
<body>
       <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
	<div style="color: white; text-align: center; font-size: 30px;">
		All Products  <i class='fab fa-elementor'></i>
	</div>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Product Successfully Updated!</h3>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Some thing went wrong! Try again!</h3>
	<%
	}
	%>
	<%
	if ("removed".equals(msg)) {
	%>
	<h3 class="alert">Product Removed Successfully!</h3>
	<%
	}
	%>

	<table>
		<thead>
			<tr>
				<th scope="col">Image</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-inr"></i> Price</th>
				<th>Status</th>
				<th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
                <th scope="col">Delete <i class='fas fa-trash-alt'></i></th>
				
			</tr>
		</thead>
		<tbody>
			<%
			try {
				ResultSet rs = ProductProvider.getProductsAdmin();
				while (rs.next()) {
			%>
			<tr>
			    <td><img src="../images/<%= rs.getString(6) %>" width="100" height="100" ></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
				<td><a href="../deleteProduct?id=<%=rs.getString(1)%>">Delete <i class='fas fa-trash-alt'></i></a></td>
				
			</tr>
			<%
			}
			} catch (Exception e) {
			out.println(e);
			}
			%>

		</tbody>
	</table>
	<br>
	<br>
	<br>

</body>
</html>