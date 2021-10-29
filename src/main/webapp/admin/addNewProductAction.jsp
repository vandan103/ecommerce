<%@page import="project.ConnectionProvider, java.sql.*"%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<% 

String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
InputStream inputStream=null;
Part image
= request.getPart("photo");
System.out.println(image);
if (image != null) {
	  
    // Prints out some information
    // for debugging
    System.out.println(
        image.getName());
    System.out.println(
        image.getSize());
    System.out.println(
        image.getContentType());

    // Obtains input stream of the upload file
        inputStream= image.getInputStream();
}
try{

Connection con = ConnectionProvider.getcon();
PreparedStatement ps = con.prepareStatement("insert into product (name,category,price,active,image) values(?,?,?,?,?)");
ps.setString(1, name);
ps.setString(2, category);
ps.setString(3, price);
ps.setString(4, active);
ps.setBlob(5, inputStream);
ps.executeUpdate();
response.sendRedirect("addNewProduct.jsp?msg=done");

}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=invalid");

	
}

%>