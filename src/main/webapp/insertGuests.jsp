<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "org.dbconection.Conexion" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "org.apache.log4j.Logger" %>
<html>
<body>
<h1>JDBC Connection example</h1>

<%
    final Logger logger = Logger.getLogger(this.getClass());

    try{
    	String firstname= request.getParameter("firstname");
    	String surname = request.getParameter("surname");
    	String email= request.getParameter("email");
        Connection conn = Conexion.getConnection();
        String consulta = "INSERT INTO MyGuests (firstname, lastname, email) VALUES (?, ?, ?)";
        
        PreparedStatement st = conn.prepareStatement(consulta);
        st.setString(1, firstname);
        st.setString(2, surname); 
        st.setString(3, email); 
        Integer rs = st.executeUpdate();
        
    }catch(SQLException e){
        out.println("SQLException caught: " + e.getMessage());
    }
%>
<br>
<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>"> Show Guests </a>
<a href="<%= response.encodeURL(request.getContextPath() + "/index.jsp") %>"> Go to insert Guests </a>

</body>
</html>