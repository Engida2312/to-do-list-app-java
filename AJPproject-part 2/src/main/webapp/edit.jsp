<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style1.css">
</head>
<body class="todo-body update-body">
	<%
	try{
		
		String url = "jdbc:mysql://localhost:3306/engida";
		String uname = "root";
		String pass = "";
		
		Connection con = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Class.forName("com.mysql.jdbc.Driver");
	    con = DriverManager.getConnection(url,uname,pass);
	%>
		<form action="" method="POST">
			<% 
			    String item = request.getParameter("u");
			    
			    String query = "SELECT * FROM `items` WHERE Item='"+ item +"'";
			    st = con.createStatement();
			    
			    rs = st.executeQuery(query);
				while(rs.next()){
					%>
					<h3>Update Item</h3>
					<div class="update-form">
					
						<div>
							<input name="item" type="text" value="<%= rs.getString("item") %>">
						</div>
					<%
				}
					    %>
					    <button class="btn update" type="submit">Update</button>
					    <a class="btn back" href="allList.jsp">Back</a>
				    </div>
		</form>

</body>
</html>

<%
				String a = request.getParameter("item");
				if(a != null){
					String que = "update items set item=? where item='"+ item +"'";
				    ps = con.prepareStatement(que);
					ps.setString(1, a);
					ps.executeUpdate();
					response.sendRedirect("allList.jsp");
				}
				
				st.close();
				con.close();
				
				}catch(Exception e){
					out.println("error  : "+ e);
				}
%>