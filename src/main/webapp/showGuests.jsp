<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import= "java.sql.*" %>
<%@ page import= "org.dbconection.Conexion" %>
<html>
<body>
<h1>Table of Guests</h1>

<table border=1>
<tr>
<td>id</td>
<td>Name</td>
<td>Surname</td>
<td>Email</td>
<td>Update</td>
<td>Delete</td>
</tr>
<%
    try{
        Connection conn = Conexion.getConnection();
        String query = "SELECT id, firstname, lastname, email FROM MyGuests;";
        Statement st = conn.createStatement();
        ResultSet resultSet = st.executeQuery(query);
        while(resultSet.next()){
%>
	<tr>
    	<td><%=resultSet.getInt("id") %></td>
    	<td><%=resultSet.getString("firstname") %></td>
    	<td><%=resultSet.getString("lastname") %></td>
    	<td><%=resultSet.getString("email") %></td>
    	<td><a href="<%= response.encodeURL(request.getContextPath() + "/updateGuest.jsp?id="+ resultSet.getInt("id")+"&firstname="+ 
        resultSet.getString("firstname")+"&lastname="+ resultSet.getString("lastname")+"&email="+ resultSet.getString("email")) %>">Update</a></td>
    	<td><a href="<%= response.encodeURL(request.getContextPath() + "/deleteGuests.jsp?id="+ resultSet.getInt("id"))%>">Delete</a></td>
    </tr>
<%
        }

        st.close();
    }catch(SQLException e){
        out.println("SQLException caught: " + e.getMessage());
    }
%>
<br>
<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>"> Show Guests </a>
<a href="<%= response.encodeURL(request.getContextPath() + "/index.jsp") %>"> Insert Guests </a>
</body>
</html>