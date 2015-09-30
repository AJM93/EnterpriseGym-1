/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

/**
 *
 * @author Dreads
 */
public class NewsModel 
{
    private int id;
    private String Title;
    private String Body;
    private String User;
    private Timestamp Date;
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";
    
    public NewsModel(){}
    
   
    
    public NewsModel(final int id, final String Title, final String Body, final String User, final Timestamp Date)
    {
        this.id = id;
        this.Title = Title;
        this.Body = Body;
        this.User = User;
        this.Date = Date;
    }
    
     public java.util.LinkedList<NewsModel> getHomeNews() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
       java.util.LinkedList<NewsModel> tr = new java.util.LinkedList<>();
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
             
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call latest_news()}");   //(?,?)}"
            //cs.setString(1, "Tom");
            //cs.setInt(1,urlNewsID);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) 
            {
                int id = rs.getInt("idNews");
                String Title = rs.getString("Title");
                String Body = rs.getString("Body");
                String User = rs.getString("Users_Username");
                Timestamp Date = rs.getTimestamp("DatePublished");
                NewsModel news_model = new NewsModel(id, Title, Body, User, Date);
                tr.add(news_model);
            }
            cs.close();
            con.close();
       
       return tr;
    }
     
     public NewsModel getOneNewsStory (int id) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
         NewsModel rt = null;
         Class.forName("com.mysql.jdbc.Driver").newInstance();
             
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call get_news_story(?)}");   //(?,?)}"
            //cs.setString(1, "Tom");
            cs.setInt(1,id);
            ResultSet rs = cs.executeQuery();
            NewsModel Story = null;
           rs.next();
                int idd = rs.getInt("idNews");
                String Title = rs.getString("Title");
                String Body = rs.getString("Body");
                String User = rs.getString("Users_Username");
                Timestamp Date = rs.getTimestamp("DatePublished");
                rt = new NewsModel(idd, Title, Body, User, Date);
            cs.close();
            con.close();
         return rt;
     }
     
     public void editNews(int id, String Title, String Body, String Author)throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
         Class.forName("com.mysql.jdbc.Driver").newInstance();
             
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call edit_news(?,?,?,?)}");
            cs.setInt(1, id);
            cs.setString(2, Title);
            cs.setString(3, Body);
            cs.setString(4, Author);
            ResultSet rs = cs.executeQuery();
            cs.close();
            con.close();
     }
    
     
    public int getNewsId()
    {
        return this.id;
    }
    public void setNewsId(final int id)
    {
        this.id = id;
    }
    public String getNewsTitle()
    {
        return this.Title;
    }
    public void setNewsTitle(final String Title)
    {
        this.Title = Title;
    }
    public String getNewsBody()
    {
        return this.Body;
    }
    public void setNewsBody(final String Body)
    {
        this.Body = Body;
    }
    public String getNewsUser()
    {
        return this.User;
    }
    public void setNewsUser(final String User)
    {
        this.User = User;
    }
    public Timestamp getNewsDate()
    {
        return this.Date;
    }
    public void setNewsDate(final Timestamp Date)
    {
        this.Date = Date;
    }
}
