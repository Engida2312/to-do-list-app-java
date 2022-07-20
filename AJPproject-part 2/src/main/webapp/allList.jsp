<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All List Of Items</title>

</head>
<body>
<%
	HttpSession session2 = request.getSession();
	String sessionData = (String)session2.getAttribute("name");
	
	if(session2 != null){ %>
		<%@ include file="header.jsp" %>
		<%@ include file="todo.html" %>  
	<%
	try{

		String url = "jdbc:mysql://localhost:3306/engida";
		String uname = "root";
		String pass = "";
		String query = "SELECT * FROM items";
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection(url,uname,pass);
	    Statement st = con.createStatement();

	    ResultSet rs = st.executeQuery(query);
	    while(rs.next()){
	 %>
		    <div class="items"> 
		    	<div class="item-list"><%= rs.getString("item") %> </div>
		    	<a class="btn edit" href="edit.jsp?u=<%= rs.getString("item")%>">Edit</a>
		    	<a class="btn delete" href='delete.jsp?d=<%= rs.getString("item")%>'>Delete</a>
		    </div>
	 <%
	    }
		
		st.close();
		con.close();
		
	   }catch(Exception e){
		 out.println("error  : "+ e);
	   }
	%>
</body>
</html>
	<% }else{
		response.sendRedirect("register.jsp");
	}
    %>
