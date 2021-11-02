<%@page import="project.ConnectionProvider, java.sql.*"%>
<% String email=session.getAttribute("email").toString(); 
String oldpwd=request.getParameter("oldpwd");
String newpwd=request.getParameter("newpwd");
String cnfpwd=request.getParameter("cnfpwd");
out.println(oldpwd);
out.println(newpwd);
out.println(cnfpwd);


if(!cnfpwd.equals(newpwd)){
	response.sendRedirect("changePassword.jsp?msg=notmatch");
}else{
	int chk=0;
	try{
		Connection con = ConnectionProvider.getcon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+oldpwd+"' ");
		while(rs.next()){
			chk=1;
			st.executeUpdate("update users set password='"+newpwd+"' where email='"+email+"' ");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(chk==0){
			response.sendRedirect("changePassword.jsp?msg=wrong");

		}
	}catch(Exception e){
		out.print(e);
		//response.sendRedirect("changePassword.jsp?msg=invalid");

	}
	
	
}

 %>