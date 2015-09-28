/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Stores;

/**
 *
 * @author Paris
 */
import Models.EventsCommentModel;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Properties;


public class EventsCommentsFetch {
    
    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            try {
                //Properties prop = new Properties();
                //InputStream inputStream = EventsCommentsFetch.class.getClassLoader().getResourceAsStream("/db.properties");
                //prop.load(inputStream);
                String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
                String user = "root";
                String password = "teameight";
                Class.forName(driver);
                connection = DriverManager.getConnection(url, user, password);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return connection;
        }

    }
    
    public static ArrayList<EventsCommentModel> getAllEventsComments(int urlEventID) {
     connection = EventsCommentsFetch.getConnection();
        ArrayList<EventsCommentModel> commentList = new ArrayList<EventsCommentModel>();
        try {
            Statement statement = connection.createStatement();
            //ResultSet rs = statement.executeQuery("select * from ActivityComments");
            CallableStatement cs = connection.prepareCall("{call events_comments(?)}");   //(?,?)}"
            cs.setInt(1,urlEventID);
            ResultSet rs = cs.executeQuery();
        
            while(rs.next()) { 
             EventsCommentModel eventComments=new EventsCommentModel();
                eventComments.setEventsCommentID(rs.getInt("commentID"));
                eventComments.setEventsID(rs.getInt("eventID"));
                eventComments.setAuthor(rs.getString("Author"));
                eventComments.setBody(rs.getString("Body"));
                eventComments.setDatePosted(rs.getTimestamp("DatePosted"));
             
             commentList.add(eventComments);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return commentList;
    }
}
