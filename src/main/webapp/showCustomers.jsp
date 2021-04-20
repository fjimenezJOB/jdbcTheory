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

<% 
    MongoCursor cursor;
    try {
        MongoDatabase db = MongoConnection.getConnection();
        MongoCollection<Document> collection = db.getCollection("customers");
        cursor = collection.find().iterator();
        while (cursor.hasNext()){
            out.write(cursor.next().toString());
            System.out.println(cursor.next());
        }

    }catch (Exception e){ e.printStackTrace();}
%>
</body>
</html>