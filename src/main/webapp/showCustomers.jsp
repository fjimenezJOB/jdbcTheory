<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.dbconection.MongoConnection"%>
<%@ page import="com.mongodb.client.MongoCollection"%>
<%@ page import="com.mongodb.client.MongoCursor"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import="com.mongodb.MongoClientSettings"%>
<%@ page import="com.mongodb.client.FindIterable"%>
<%@ page import="org.bson.Document" %>
<html>
<body>

<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>"> Show Guests </a>
<a href="<%= response.encodeURL(request.getContextPath() + "/showProducts.jsp") %>">Show Products</a>
<a href="<%= response.encodeURL(request.getContextPath() + "/index.jsp") %>"> Insert Guests </a>

<table border=1>
<tr>
<td>id</td>
<td>Username</td>
<td>Name</td>
<td>Address</td>
<td>Birthdate</td>
<td>Email</td>
<td>Active</td>

</tr>
<% 
    MongoCursor<Document> cursor;
    try {
        MongoDatabase db = MongoConnection.getConnection();
        MongoCollection<Document> collection = db.getCollection("customers");
        cursor = collection.find().iterator();
        StringBuilder stringBuild = new StringBuilder();
        stringBuild.append("");
        while (cursor.hasNext()){
            Document doc = cursor.next();
            stringBuild.append("<tr><td>" + doc.getObjectId("_id") + "</td>");
            stringBuild.append("<td>" + doc.getString("username") + "</td>");
            stringBuild.append("<td>" + doc.getString("name") + "</td>");
            stringBuild.append("<td>" + doc.getString("address") + "</td>");
            stringBuild.append("<td>" + doc.getDate("birthdate") + "</td>");
            stringBuild.append("<td>" + doc.getBoolean("active") + "</td>");
            stringBuild.append("<td>" + doc.getString("email") + "</td></tr>");
        }
        out.write(stringBuild.toString());
    }catch (Exception e){ e.printStackTrace();}
%>
</body>
</html>