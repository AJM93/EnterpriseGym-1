/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Lib.AeSimpleSHA256;
import Stores.LoggedIn;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
    
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
        response.sendRedirect("login.jsp");
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
        try {
            String username = request.getParameter("username");
            String passwordAttempt = request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            
            CallableStatement cs = this.con.prepareCall("{call login_users(?)}");
            cs.setString(1, username);
            ResultSet rs = cs.executeQuery();
            rs.next();
            
            String storedPassword = rs.getString("password");
            String hexSalt = rs.getString("salt");
            byte[] salt = AeSimpleSHA256.fromHex(hexSalt);
            
            cs.close();
            con.close();
            
            String encodedPasswordAttempt = null;
            try
            {
                encodedPasswordAttempt = AeSimpleSHA256.getHash(passwordAttempt, salt);
            }
            catch (UnsupportedEncodingException | NoSuchAlgorithmException et)
            {
                System.out.println("Can't check the password");
                response.sendRedirect("loginFailed.jsp");
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if (encodedPasswordAttempt != null && encodedPasswordAttempt.equals(storedPassword)) {
                // login success
                LoggedIn lg = new LoggedIn(true, username);

                HttpSession session = request.getSession();
                session.setAttribute("LoggedIn", lg);

                // redirect                
                response.sendRedirect("userLogged.jsp");
            } else {
                // unsuccessful login
                response.sendRedirect("loginFailed.jsp");
            }
            
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
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
