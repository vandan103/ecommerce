<%@page import="project.ConnectionProvider,project.ProductProvider, java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Product</title>
<style>
.back {
	color: white;
	margin-left: 2.5%
}
</style>
</head>
<body>
	<h2>
		<a class="back" href="allProductEditProduct.jsp"><i
			class='fas fa-arrow-circle-left'> Back</i></a>
	</h2>
	<%
	String id = request.getParameter("id");

	try {
		ResultSet rs = ProductProvider.getProduct(id);

		while (rs.next()) {
	%>

	<form action="../editProduct" method="post" enctype="multipart/form-data">

		<input type="hidden" name="id" value="<%out.print(id);%>">
		<div class="left-div">
			<h3>Enter Name</h3>
			<input class="input-style" type="text" name="name"
				value="<%=rs.getString(2)%>" required="required">

			<hr>
		</div>

		<div class="right-div">
			<h3>Enter Category</h3>
			<input class="input-style" type="text" name="category"
				value="<%=rs.getString(3)%>" required="required">
        Select Image : <input type="file" name="image"> 
			<hr>
		</div>

		<div class="left-div">
			<h3>Enter Price</h3>
			<input class="input-style" type="number" name="price"
				value="<%=rs.getString(4)%>" required="required">

			<hr>
		</div>

		<div class="right-div">
			<h3>Active</h3>
			<select class="input-style" name="active" required="required">
				<option value="yes">Yes</option>
				<option value="no">No</option>

			</select>
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