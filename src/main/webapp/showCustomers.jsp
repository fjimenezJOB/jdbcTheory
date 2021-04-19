<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mongodb.Mongo" %>
<%@ page import= "org.apache.log4j.Logger" %>
<html>
<body>

<% 
    try {
        MongoClient client = new MongoClient(ServerAddress("mongodb+srv://franjimenez:Francisco1231998@develop.0hasi.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
        
    }catch(Exception e){
        e.printStackTrace();
    }

%>

<% MongoClient mongoClient = null;

DB db = mongoClient.getDB("testdoc");
DBCollection coll;
coll = db.getCollection("testdoc");
BasicDBObject doc = new BasicDBObject("Number1", 1).
        append("Number2", 2).append("Number3", 3);

//System.out.println("Data Display");
coll.insert(doc);
DBCursor cursor = coll.find();
try {
   while(cursor.hasNext()) {
       System.out.println(cursor.next());
   }
} finally {
   //mongoClient.dropDatabase("test");
   cursor.close();

}
    %>
</body>
</html>