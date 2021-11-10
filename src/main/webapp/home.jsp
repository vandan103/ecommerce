<%@page import="project.ConnectionProvider, java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
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
	<div style="color: white; text-align: center; font-size: 30px;">
		Home <i class="fa fa-institution"></i>
	</div>
	<%   String imgFileName=(String)request.getAttribute("img"); %>
	
	<%
	String msg = request.getParameter("msg");
	if ("added".equals(msg)) {
	%>
	<h3 class="alert">Product added successfully!</h3>
	<%
	}
	%>
	<%
	if ("exist".equals(msg)) {
	%>
	<h3 class="alert">Product already exist in you cart! Quantity
		increased!</h3>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">something went wrong!! please try again!!</h3>
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
				<th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
			</tr>
		</thead>
		<tbody>
			<%
			
			try{
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from product where active='yes'");
			while(rs.next()){
			%>
			<tr>
			    <td><img src="images/<%= rs.getString(6) %>" width="100" height="100" ></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				
				<td><i class="fa fa-inr"></i><%= rs.getString(4) %> </td>
				<td><a href="AddToCart?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
			</tr>
<%}}catch(Exception e){
	System.out.print(e);
} %>
		</tbody>
	</table>
	<br>
	<br>
	<br>

</body>
</html>