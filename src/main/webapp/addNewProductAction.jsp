<%@page import="project.ConnectionProvider, java.sql.*"%>
<% 
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");

try{
Connection con = ConnectionProvider.getcon();
PreparedStatement ps = con.prepareStatement("insert into product (name,category,price,active) values(?,?,?,?)");
ps.setString(1, name);
ps.setString(2, category);
ps.setString(3, price);
ps.setString(4, active);
ps.executeUpdate();
response.sendRedirect("addNewProduct.jsp?msg=done");

}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");

	
}

%>