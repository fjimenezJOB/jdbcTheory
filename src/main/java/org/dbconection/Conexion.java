package org.dbconection;
import java.sql.*;
import org.apache.log4j.Logger;

public class Conexion {
    private static Connection con=null;
    static Logger logger = Logger.getLogger(Conexion.class);

    public static Connection getConnection(){

      try{
            if( con == null ){
               String driver="com.mysql.jdbc.Driver";
               Class.forName(driver);
               String url="jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_db61042a47c7780";
               String usr="bc924cab8573aa";
               String pwd="347839121a85fa3";
               con = DriverManager.getConnection(url,usr,pwd);
               System.out.println("Conection Succesfull");
            }
        }catch(ClassNotFoundException | SQLException ex){
        logger.error(ex.getMessage());
     }
     return con;
   }
}