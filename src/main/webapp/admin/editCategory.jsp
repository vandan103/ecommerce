<%@page import="project.ConnectionProvider,project.CategoryProvider, java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Category</title>
<style>
.back {
	color: white;
	margin-left: 2.5%
}
</style>
</head>
<body>
	<h2>
		<a class="back" href="allCategoryEditCategory.jsp"><i
			class='fas fa-arrow-circle-left'> Back</i></a>
	</h2>
	<%
	String id = request.getParameter("id");

	try {
		ResultSet rs = CategoryProvider.getCategory(id);

		while (rs.next()) {
	%>

	<form action="../editCategory" method="post">

		<input type="hidden" name="id" value="<%out.print(id);%>">
		<div class="left-div">
			<h3>Edit Category Name</h3>
			<input class="input-style" type="text" name="name"
				value="<%=rs.getString(2)%>" required="required">

			<hr>
		</div>
		<button class="button">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>

</body>
<br>
<br>
<br>
</body>
</html>