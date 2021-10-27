
<%@page import="project.ConnectionProvider, java.sql.*"%>
<%
Connection con = ConnectionProvider.getcon();
Statement st = con.createStatement();
String q1 = "create table abc (name varchar(200))";
st.execute(q1);
System.out.println("table created");

con.close();
%>