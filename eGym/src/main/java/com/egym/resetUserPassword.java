/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Lib.AeSimpleSHA256;
import Lib.ResetPasswordEmail;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
 * @author Tom
 */
@WebServlet(name = "resetUserPassword", urlPatterns = {"/resetUserPassword"})
public class resetUserPassword extends HttpServlet {
    
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
            throws ServletException, IOException, UnsupportedEncodingException {
        // generate UUID
        // hash(username, UUID, timeRequested)
        // check if user has a record in reset table
            // if so, update their record with new hash and timeRequested
            // if not, insert
        
        String username = request.getParameter("getPasswordUsername");
        
        String token = java.util.UUID.randomUUID().toString();
        Timestamp timeRequested = new Timestamp(new java.util.Date().getTime());
        String hash = null;
        try {
            hash = AeSimpleSHA256.SHA256(username + token + timeRequested);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(resetUserPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = this.con.prepareCall("{call get_password_reset_record(?)}");
            cs.setString(1, username);
            ResultSet rs = cs.executeQuery();
            CallableStatement cs2;
            if (rs.next()){ // the user has previously reset their password
                cs2 = this.con.prepareCall("{call update_password_reset_record(?,?,?)}");
            } else { // the user has not previously reset their password
                cs2 = this.con.prepareCall("{call create_password_reset_record(?,?,?)}");
            }
            cs2.setString(1, username);
            cs2.setString(2, hash);
            cs2.setTimestamp(3, timeRequested);
            cs2.executeQuery();
            CallableStatement cs3;
            cs3 = this.con.prepareCall("{call get_user_details(?)}");
            cs3.setString(1, username);
            ResultSet rs2 = cs3.executeQuery();
            String Email = "";
            while(rs2.next())
            {
                Email = rs2.getString("Email");
            }
            cs.close();
            cs2.close();
            cs3.close();
            con.close();
            
            final String emailAddressTo = Email;
            final String emailSubject = "Password Reset with The Enterprise Gym";
            String url = "http:/localhost:8080/eGym/ResetPassword/" + username + "/" + username + token + timeRequested;
            final String emailMessage = "<p>A request for a new password was logged at " + timeRequested + "</p>" + "<p>Please go to the following link within an hour to create a new password." + "</p>" + "Link: <a href=\"" + url + "\">  " + url + "</a>";
            ResetPasswordEmail.SendEmail(emailAddressTo, emailSubject, emailMessage);
            
            RequestDispatcher rd = request.getRequestDispatcher("/homePage");
            rd.forward(request,response);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
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