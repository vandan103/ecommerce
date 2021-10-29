<%@page import="project.ConnectionProvider, java.sql.*"%>
<% 
String category=request.getParameter("category");


try{
Connection con = ConnectionProvider.getcon();
PreparedStatement ps = con.prepareStatement("insert into category (cname) values(?)");
ps.setString(1, category);
ps.executeUpdate();

response.sendRedirect("addNewCategory.jsp?msg=done");

}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addNewCategory.jsp?msg=invalid");

	
}

%>