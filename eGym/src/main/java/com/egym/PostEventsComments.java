/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import java.io.IOException;
import java.net.URLDecoder;
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
@WebServlet(name = "PostEventComment", urlPatterns = {"/PostEventComment"})
public class PostEventsComments extends HttpServlet{
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";
    
    
    private static java.sql.Timestamp getCurrentTimeStamp() {

	java.util.Date today = new java.util.Date();
	return new java.sql.Timestamp(today.getTime());

}
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
            String commentBox = request.getParameter("commentBox");
            String userName = request.getParameter("userName");
            int eventID = Integer.parseInt(request.getParameter("eventID"));
            try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            
            CallableStatement cs = this.con.prepareCall("{call add_activity_comment(?,?,?,?)}");
            cs.setInt(1, eventID);
            cs.setString(2, userName);
            cs.setString(3, commentBox);
            cs.setTimestamp(4, getCurrentTimeStamp());
            cs.executeQuery();
            cs.close();
            
             con.close();
             
            RequestDispatcher rd = request.getRequestDispatcher(URLDecoder.decode(request.getRequestURI(), "UTF-8"));
            rd.forward(request,response);
         } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
             Logger.getLogger(EventItem.class.getName()).log(Level.SEVERE, null, ex);
         }
           
    }
}
