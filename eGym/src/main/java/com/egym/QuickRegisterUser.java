/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Lib.AeSimpleSHA256;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
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
 * @author Dreads
 */
@WebServlet(name = "QuickRegisterUser", urlPatterns = {"/QuickRegisterUser"})
public class QuickRegisterUser extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
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
        try
        {
            String username = request.getParameter("username");
            String email = request.getParameter("email");

            String userpassword = "password123";
            java.util.Date date= new java.util.Date();
            Timestamp dob = new Timestamp(date.getTime());
            //*************************************************************

            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[32];
            random.nextBytes(salt);

            String encodedPassword = null;            
            String hexSalt = null;
            try 
            {
                encodedPassword = AeSimpleSHA256.getHash(userpassword, salt);
                hexSalt = AeSimpleSHA256.toHex(salt);
            }
            catch (NoSuchAlgorithmException et) 
            {
                System.out.println("Can't hash the password");
                response.sendRedirect("/homePage");
            } 
            catch (InvalidKeySpecException ex) 
            {
                Logger.getLogger(RegisterNewUser.class.getName()).log(Level.SEVERE, null, ex);
            }

            //*************************************************************
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);   
            CallableStatement cs = this.con.prepareCall("{call quick_register_user(?, ?, ?, ?, ?)}");
            cs.setString(1, username);
            cs.setString(2, encodedPassword);
            cs.setString(3, hexSalt);
            cs.setString(4, email);
            cs.setTimestamp(5, dob);
            cs.executeQuery();
            cs.close();
            CallableStatement cs2 = this.con.prepareCall("{call create_user_points(?)}");
            cs2.setString(1, username);
            cs2.executeQuery();
            cs2.close();
            con.close();
            RequestDispatcher rd = request.getRequestDispatcher("/homePage");
            rd.forward(request,response);
        } 
        catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) 
        {
            Logger.getLogger(QuickRegisterUser.class.getName()).log(Level.SEVERE, null, ex);
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
