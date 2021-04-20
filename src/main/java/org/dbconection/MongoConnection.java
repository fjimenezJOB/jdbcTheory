package org.dbconection;
import com.mongodb.ConnectionString;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.MongoClientSettings;

public class MongoConnection {

    MongoClient client = null;

    public static MongoDatabase getConnection(){

        MongoDatabase database = null;

        try {
            ConnectionString connString = new ConnectionString("mongodb+srv://fjimenezjob:Francisco1231998@netmind-cluster.hj2xk.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
                  MongoClientSettings settings = MongoClientSettings.builder()
                      .applyConnectionString(connString)
                      .retryWrites(true)
                      .build();
                  MongoClient mongoClient = MongoClients.create(settings);
                  database = mongoClient.getDatabase("sample_analytics");
                  return database;

        }catch(Exception e) {
          System.out.println("SQLException caught: " +e.getMessage());
          return database;
        }
    }
}
