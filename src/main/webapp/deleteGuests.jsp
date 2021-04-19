<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<%@ page import= "org.dbconection.Conexion" %>
<html>
<body>
<% 
    try {
        String id = request.getParameter("id");
        Connection conn = DriverManager.getConnection();
        Statement st = conn.createStatement();
        out.write("DELETE FROM myguests WHERE id="+id);
        st.executeUpdate("DELETE FROM myguests WHERE id="+id);
        response.sendRedirect(request.getContextPath() + "/showGuests.jsp");
    }catch(SQLException e){
        e.printStackTrace();
    }
%>
</body>
</html>