/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Lib.AeSimpleSHA256;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
 * @author Tom
 */
@WebServlet(name = "ResetPassword", urlPatterns = {"/ResetPassword/*"})
public class ResetPassword extends HttpServlet {
    
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
        String path = request.getPathInfo();
        String[] pathParts = path.split("/");
        String inputUsername = pathParts[1];
        String urlToken = pathParts[2];
        
         try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String encodedToken = AeSimpleSHA256.SHA256(urlToken);
            //String encodedToken = urlToken;
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call get_password_reset_record(?)}"); 
            cs.setString(1, inputUsername);
            ResultSet rs = cs.executeQuery();
            String token = "";
            Timestamp tdRequest = null;
            String Username = "";
            while(rs.next())
            {
                token = rs.getString("Token");
                tdRequest = rs.getTimestamp("DateTimeRequested");
                Username = rs.getString("Users_Username");
            }
            cs.close();
            con.close();
            if(token.equals(encodedToken))
            {
                Timestamp timeOut = tdRequest;
                long getTime = tdRequest.getTime();
                getTime = getTime + (60 * 60 * 1000);
                timeOut.setTime(getTime);
                java.util.Date date = new java.util.Date();
                Timestamp now = new Timestamp(date.getTime());
                if(timeOut.after(now))
                {
                    // if request is before timeout
                    // Send Username and redirect to the reset password form.
                    request.setAttribute("PasswordUsername", Username);
                    RequestDispatcher rd = request.getRequestDispatcher("/resetPassword.jsp");
                    rd.forward(request,response);

                }else
                {
                    // if request is after timeout
                    RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                    rd.forward(request,response);
                }
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                rd.forward(request,response);
            }
            
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedEncodingException | NoSuchAlgorithmException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
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
            throws ServletException, IOException, UnsupportedEncodingException {
        String username = request.getParameter("username");
        String newPassword = request.getParameter("password");
        
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[32];
        random.nextBytes(salt);

        String encodedPassword = null;            
        String hexSalt = null;
        try {
            encodedPassword = AeSimpleSHA256.getHash(newPassword, salt);
            hexSalt = AeSimpleSHA256.toHex(salt);
        }
        catch (NoSuchAlgorithmException et) {
            System.out.println("Can't hash the password");
            response.sendRedirect("index.html");
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            CallableStatement cs2 = null;
            cs = this.con.prepareCall("{call update_user_password(?, ?, ?)}"); 
            cs2 = this.con.prepareCall("{call delete_password_reset_record(?)}");
            cs.setString(1, username);
            cs.setString(2, encodedPassword);
            cs.setString(3, hexSalt);
            cs2.setString(1, username);
            cs.executeQuery();
            cs2.executeQuery();
            cs.close();
            cs2.close();
            con.close();
            
            RequestDispatcher rd = request.getRequestDispatcher("/index.html");
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
