/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Stores.EventStore;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

/**
 *
 * @author Paris
 */
public class EventsModel {
    
    private int id;
    private String title;
    private int points;
    private String body;
    private String trainer;
    
     Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";
    
    public EventsModel(final int id, final String title, final String body, final String trainer, final int points)
    {
    this.id=id;
    this.title=title;
    this.points=points;
    this.body=body;
    this.trainer=trainer;
    }
    
    public EventsModel(){} // empty constructer added for ease - yogi
    
     public java.util.LinkedList<EventsModel> getHomeEvents() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
       java.util.LinkedList<EventsModel> tr = new java.util.LinkedList<>();
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
             
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call upcoming_events()}");   //(?,?)}"
            //cs.setString(1, "Tom");
            //cs.setInt(1,urlNewsID);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) 
            {
               int id = rs.getInt("idActivities");
                String Title = rs.getString("Title");
                String Body = rs.getString("Body");
                String Trainer = rs.getString("Users_Username");
                //java.util.Date dt = rs.getDate("DatePublished");
                //String Date = dt.toString();
                int Points = rs.getInt("Points");
                EventsModel events_model = new EventsModel(id, Title, Body, Trainer, Points);
                tr.add(events_model);
            }
            cs.close();
            con.close();
       return tr;
    }
    
  public java.util.LinkedList<EventsModel> getUserEvents(String username) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
       java.util.LinkedList<EventsModel> tr = new java.util.LinkedList<>();
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
             
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call upcoming_events_for_user(?)}");   //(?,?)}"
            cs.setString(1, username);
            //cs.setInt(1,urlNewsID);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) 
            {
               int id = rs.getInt("idActivities");
                String Title = rs.getString("Title");
                String Body = rs.getString("Body");
                String Trainer = rs.getString("Users_Username");
                //java.util.Date dt = rs.getDate("DatePublished");
                //String Date = dt.toString();
                int Points = rs.getInt("Points");
                EventsModel events_model = new EventsModel(id, Title, Body, Trainer, Points);
                tr.add(events_model);
            }
            cs.close();
            con.close();
       return tr;
    }  
  
  public EventStore getSingleEvent (int id)  throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
      EventStore rt = null;
      Class.forName("com.mysql.jdbc.Driver").newInstance();
             
        con = DriverManager.getConnection(url, user, password);
        CallableStatement cs = null;
        cs = this.con.prepareCall("{call get_single_activity(?)}");   //(?,?)}"
        cs.setInt(1, id);
        ResultSet rs = cs.executeQuery();
        rs.next();
        int idd = rs.getInt("idActivities");
        String Title = rs.getString("Title");
        String Body = rs.getString("Body");
        String Trainer = rs.getString("Users_Username");
        String Type = rs.getString("Type");
        Timestamp start = rs.getTimestamp("StartTime");
        Timestamp end = rs.getTimestamp("EndTime");
        //java.util.Date dt = rs.getDate("DatePublished");
        //String Date = dt.toString();
        int Points = rs.getInt("Points");
        rt = new EventStore(idd, Title, Points, Body, Trainer, Type, start, end); 
        cs.close();
        con.close();
      return rt;
  }
     
     
    public int getEventID()
    {
        return this.id;
    }
    
    public void setEventID(final int id)
    {
        this.id=id;
    }
    
    public String getEventTitle()
    {
        return this.title;
    }
    
    public void setEventTitle(final String title)
    {
        this.title=title;
    }
    
    public String getEventBody()
    {
        return this.body;
    }
    
    public void setEventBody(final String body)
    {
        this.body=body;
    }
    
    public int getEventPoints()
    {
        return this.points;
    }
    
    public void setEventPoints(final int points)
    {
        this.points=points;
    }
    
    public String getEventTrainer()
    {
        return this.trainer;
    }
    
    public void setEventTrainer(final String trainer)
    {
        this.trainer=trainer;
    }
}
