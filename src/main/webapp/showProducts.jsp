<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<%@ page import= "org.dbconection.Conexion" %>
<html>
<body>

<table border=1>
<tr>
<td>id</td>
<td>Nombre</td>
<td>Estado</td>
<td>Precio</td>
</tr>
<% 
    try{
        Connection conn = Conexion.getConnection();
        String consulta = "SELECT * FROM productos;";
        Statement st = conn.createStatement();
        ResultSet resultSet = st.executeQuery(consulta);
        while(resultSet.next()){
%>
	        <tr>
    	        <td><%=resultSet.getInt("id") %></td>
    	        <td><%=resultSet.getString("nombre") %></td>
    	        <td><%=resultSet.getString("estado") %></td>
    	        <td><%=resultSet.getInt("precio") %></td>
            </tr>
<% 
        }
    }catch(SQLException e){
          out.println("SQLException caught: " + e.getMessage());
    }
%>
<br>
<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>"> Show Guests </a>
<a href="<%= response.encodeURL(request.getContextPath() + "/index.jsp") %>"> Go to insert Guests </a>
</body>
</html>