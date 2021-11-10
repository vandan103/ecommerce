<%@page import="project.CategoryProvider"%>
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

</style>
</head>
<body>
       <a href="addNewCategory.jsp">Add New Category <i class='fas fa-plus-square'></i></a>
	<div style="color: white; text-align: center; font-size: 30px;">
		All Category  <i class='fab fa-elementor'></i>
	</div>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Category Successfully Updated!</h3>
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
	<h3 class="alert">Category Removed Successfully!</h3>
	<%
	}
	%>

	<table>
		<thead>
			<tr>
			
				<th scope="col">Category</th>
			
				<th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
                <th scope="col">Delete <i class='fas fa-trash-alt'></i></th>
				
			</tr>
		</thead>
		<tbody>
			<%
			try {
				ResultSet rs = CategoryProvider.getCategory();
				while (rs.next()) {
			%>
			<tr>
			    
				
				<td><%=rs.getString(2)%></td>
				<td><a href="editCategory.jsp?id=<%=rs.getString(1)%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
				<td><a href="../deleteCategory?id=<%=rs.getString(1)%>">Delete <i class='fas fa-trash-alt'></i></a></td>
				
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