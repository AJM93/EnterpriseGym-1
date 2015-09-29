/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Stores.ActivityType;
import Stores.BasicUser;
import Stores.LoggedIn;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
@WebServlet(name = "createActivity", urlPatterns = {"/createActivity"})
public class createActivity extends HttpServlet {
    
    Connection con = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection(url, user, password);
            
            // get the list of activity types
            CallableStatement cs = this.con.prepareCall("{call get_activity_types}");
            ResultSet rs = cs.executeQuery();
            
            LinkedList<ActivityType> activityTypes = new LinkedList<>();
            
            while (rs.next()){
                int id = rs.getInt("idActivityTypes");
                String type = rs.getString("Type");
                
                ActivityType at = new ActivityType(id, type);
                activityTypes.add(at);
            }
            
            request.setAttribute("ActivityTypes", activityTypes);
            cs.close();
            
            // get the list of trainers
            CallableStatement cs2 = this.con.prepareCall("{call get_users_of_type(?)}");
            cs2.setInt(1, 4);
            ResultSet rs2 = cs2.executeQuery();
            
            LinkedList<BasicUser> trainers = new LinkedList<>();
            
            while (rs2.next()){
                BasicUser bu = new BasicUser();
                bu.setUsername(rs2.getString("username"));
                bu.setFirstName(rs2.getString("FirstName"));
                bu.setLastName(rs2.getString("LastName"));
                trainers.add(bu);
            }
            
            request.setAttribute("Trainers", trainers);
            cs2.close();
            
            con.close();
            
            RequestDispatcher rd = request.getRequestDispatcher("createActivity.jsp");
            rd.forward(request,response);
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(createNews.class.getName()).log(Level.SEVERE, null, ex);
        }
        //response.sendRedirect("createActivity.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        int points = Integer.parseInt(request.getParameter("points"));
        
        String startDate = request.getParameter("startDate");
        String startTime = request.getParameter("startTime");
        String startString = startDate + " " + startTime + ":00";
        Timestamp startDateTime = Timestamp.valueOf(startString);
        
        String endDate = request.getParameter("endDate");
        String endTime = request.getParameter("endTime");
        String endString = endDate + " " + endTime + ":00";
        Timestamp endDateTime = Timestamp.valueOf(endString);
        
        String trainer = request.getParameter("trainer");
        String body = request.getParameter("body");
        int type = Integer.parseInt(request.getParameter("type"));
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            
            CallableStatement cs = this.con.prepareCall("{call new_activity(?,?,?,?,?,?,?)}");
            // `new_activity`(pTitle varchar(100), pPoints int(11), pStartTime datetime, pEndTime datetime, pUsers_Username varchar(30), pBody text, pActivityTypes_idActivityTypes int(11)
            cs.setString(1, title);
            cs.setInt(2, points);
            cs.setTimestamp(3, startDateTime);
            cs.setTimestamp(4, endDateTime);
            cs.setString(5, trainer);
            cs.setString(6, body);
            cs.setInt(7, type);
            
            cs.executeQuery();
            
            cs.close();
            con.close();
            
            response.sendRedirect("/eGym/events");
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(createNews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
