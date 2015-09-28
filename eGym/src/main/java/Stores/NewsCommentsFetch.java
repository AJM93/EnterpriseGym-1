/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Stores;

import Models.NewsCommentModel;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Paris
 */
public class NewsCommentsFetch {
    
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
    
    public static ArrayList<NewsCommentModel> getAllNewsComments(int urlNewsID) {
     connection = NewsCommentsFetch.getConnection();
        ArrayList<NewsCommentModel> commentList = new ArrayList<NewsCommentModel>();
        try {
            Statement statement = connection.createStatement();
            CallableStatement cs = connection.prepareCall("{call news_comments(?)}");   //(?,?)}"
            cs.setInt(1,urlNewsID);
            ResultSet rs = cs.executeQuery();
        
            while(rs.next()) { 
             NewsCommentModel newsComments=new NewsCommentModel();
                newsComments.setNewsCommentID(rs.getInt("commentID"));
                newsComments.setNewsID(rs.getInt("newsID"));
                newsComments.setAuthor(rs.getString("author"));
                newsComments.setBody(rs.getString("Body"));
                newsComments.setDatePosted(rs.getTimestamp("DatePosted"));
             
             commentList.add(newsComments);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return commentList;
    }
}
