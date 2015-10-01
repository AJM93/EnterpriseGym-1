/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paris
 */
@WebServlet(name = "PostRegisterEventsUsers", urlPatterns = {"/PostRegisterEventsUsers"})
public class PostMultipleUsers extends HttpServlet 
{
    Connection con = null;
    Statement st = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        int urlActivityID = Integer.parseInt(request.getParameter("eventID"));
        String usernameBox = request.getParameter("registerUsersBox");
        String[] usernameSplit = usernameBox.split(";");
        String username;
        try 
        {
            boolean signUpUser = true;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            for (int i = 0; i < usernameSplit.length+1; i++)
            {
                username=null;
                username=usernameSplit[i];
                CallableStatement cs = null;
                cs = this.con.prepareCall("call get_user_event_signups(?)");
                cs.setString(1, username);
                ResultSet rs = cs.executeQuery();
                while(rs.next())
                {
                    int completedEventId = rs.getInt("Activities_idActivities");
                    if(urlActivityID == completedEventId)
                    {
                        signUpUser = false;
                    }
                }
                cs.close();
                if(signUpUser == true)
                {
                    CallableStatement cs2 = null;
                    cs2 = this.con.prepareCall("{call event_sign_up(?,?)}");
                    cs2.setString(1, username);
                    cs2.setInt(2, urlActivityID);
                    cs2.executeQuery();
                    cs2.close();
                }
            }
            con.close();
            String Eventid = String.valueOf(urlActivityID); 
            RequestDispatcher rd = request.getRequestDispatcher("/homePage");
            rd.forward(request,response);
        } 
        catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(EventSignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }  
}
