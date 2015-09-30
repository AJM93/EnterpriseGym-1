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
 * @author Dreads
 */
@WebServlet(name = "EventSignUp", urlPatterns = {"/EventSignUp/*"})
public class EventSignUp extends HttpServlet 
{
    Connection con = null;
    Statement st = null;
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
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
        processRequest(request, response);
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
            throws ServletException, IOException 
    {
        String path = request.getPathInfo();
        int urlActivityID = Integer.parseInt(path.substring(1));
        String username = request.getParameter("UsernameSignUp");
        try 
        {
            boolean signUpUser = true;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
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
            con.close();
            String Eventid = String.valueOf(urlActivityID); 
            RequestDispatcher rd = request.getRequestDispatcher("/homePage");
            rd.forward(request,response);
        } 
        catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(EventSignUp.class.getName()).log(Level.SEVERE, null, ex);
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
