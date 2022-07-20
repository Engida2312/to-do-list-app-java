<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
<%
	try{
		
		String item = request.getParameter("d");
		
		String url = "jdbc:mysql://localhost:3306/engida";
		String uname = "root";
		String pass = "";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,uname,pass);
	    String query = "DELETE FROM `items` WHERE Item='"+ item +"'"; 
		Statement st = con.createStatement();
		
	    st.executeUpdate(query);
	   response.sendRedirect("allList.jsp");
				
	  
		
		}catch(Exception e){
			out.println("error  : "+ e);
		}
	%>
</body>
</html>