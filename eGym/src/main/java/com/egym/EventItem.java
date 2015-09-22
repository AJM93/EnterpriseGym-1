/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Models.EventsCommentModel;
import Models.EventsModel;
import Models.NewsModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.CallableStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Yogi
 */
@WebServlet(name = "EventItem", urlPatterns = {"/EventItem/*"})
public class EventItem extends HttpServlet {

    
     Connection con = null;
    Statement st = null;
    ResultSet rs = null;
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
            throws ServletException, IOException, SQLException, ClassNotFoundException, InstantiationException {
        String path = request.getPathInfo();
        int urlActivityID = Integer.parseInt(path.substring(1));
        response.setContentType("text/html;charset=UTF-8");
        int urlEventsCommentsID = Integer.parseInt(path.substring(1));
        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call get_single_activity(?)}");   //(?,?)}"
            //cs.setString(1, "Tom");
            cs.setInt(1,urlActivityID);
            ResultSet rs = cs.executeQuery();
            
            EventsModel Event = null;
            rs.next();
            int id = rs.getInt("idActivities");
                String Title = rs.getString("Title");
                String Body = rs.getString("Body");
                String Trainer = rs.getString("Users_Username");
                //java.util.Date dt = rs.getDate("DatePublished");
                //String Date = dt.toString();
                int Points = rs.getInt("Points");
                Event = new EventsModel(id, Title, Body, Trainer, Points);
                request.setAttribute("Event", Event);
                
                
                
                CallableStatement eComments = this.con.prepareCall("{call events_comments(?)}");   //(?,?)}"
                eComments.setInt(1,urlEventsCommentsID);
                ResultSet rs2 = eComments.executeQuery();
            
            LinkedList<EventsCommentModel> eventsCommentList = new LinkedList<>();
            while (rs2.next()) 
            {                
                int commentID = rs2.getInt("commentID");
                int eventID = rs2.getInt("eventID");
                String author = rs2.getString("Author");
                String body = rs2.getString("Body");
                Timestamp datePosted = rs2.getTimestamp("DatePosted");
                
                EventsCommentModel eventsComment = new EventsCommentModel(commentID, eventID, author, body, datePosted);
                eventsCommentList.add(eventsComment);
            }
            
            request.setAttribute("EventsCommentList", eventsCommentList);
                
                cs.close();
                con.close();
                RequestDispatcher rd = request.getRequestDispatcher("/Event.jsp");
                rd.forward(request,response);
            /* TODO output your page here. You may use following sample code. */
           
        } catch (IllegalAccessException ex) {
             Logger.getLogger(EventItem.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    
    private static java.sql.Timestamp getCurrentTimeStamp() {

	java.util.Date today = new java.util.Date();
	return new java.sql.Timestamp(today.getTime());

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
             processRequest(request, response);
         } catch (SQLException ex) {
             Logger.getLogger(EventItem.class.getName()).log(Level.SEVERE, null, ex);
         } catch (ClassNotFoundException ex) {
             Logger.getLogger(EventItem.class.getName()).log(Level.SEVERE, null, ex);
         } catch (InstantiationException ex) {
             Logger.getLogger(EventItem.class.getName()).log(Level.SEVERE, null, ex);
         }
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
         
            String commentBox = request.getParameter("commentBox");
            try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            
            CallableStatement cs = this.con.prepareCall("{call add_activity_comment(?,?,?,?)}");
            cs.setInt(1, 3);
            cs.setString(2, "Paris");
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
