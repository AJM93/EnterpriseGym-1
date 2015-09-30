/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Lib.AeSimpleSHA256;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Dreads
 */
@WebServlet(name = "RegisterNewUser", urlPatterns = {"/RegisterNewUser"})
public class RegisterNewUser extends HttpServlet {

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
        response.sendRedirect("register.jsp");
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
            
            String userpassword = request.getParameter("password");
            
            //*************************************************************
            
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[32];
            random.nextBytes(salt);
            
            String encodedPassword = null;            
            String hexSalt = null;
            try {
                encodedPassword = AeSimpleSHA256.getHash(userpassword, salt);
                hexSalt = AeSimpleSHA256.toHex(salt);
            }
            catch (NoSuchAlgorithmException et) {
                System.out.println("Can't hash the password");
                response.sendRedirect("index.html");
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(RegisterNewUser.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //*************************************************************
            
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String matriculation = request.getParameter("matricNO");
            String email = request.getParameter("email");
            String phoneNo = request.getParameter("phoneNO");
            String Gender = request.getParameter("gender");
            String country = request.getParameter("country2");
            String institution = request.getParameter("institution");
            String subInstitution = request.getParameter("subInstitution");
            String degree = request.getParameter("degree");
           
            String startDate = request.getParameter("DOBdate");
            String startString = startDate + " 12:00:00";
            Timestamp datePosted = Timestamp.valueOf(startString);
            
            String YoS = request.getParameter("yos");
            String userStatus = request.getParameter("inputAccountType");
            int UserStat = Integer.parseInt(userStatus);
            char gender = Gender.charAt(0);
            int yos = Integer.parseInt(YoS);
            
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            
            CallableStatement cs = this.con.prepareCall("{call register_user(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, username);
            cs.setString(2, encodedPassword);
            cs.setString(3, hexSalt);
            cs.setString(4, firstname);
            cs.setString(5, lastname);
            cs.setString(6, matriculation);
            cs.setString(7, email);
            cs.setString(8, phoneNo);
            cs.setString(9, String.valueOf(gender));
            cs.setString(10, country);
            cs.setString(11, institution);
            cs.setString(12, subInstitution);
            cs.setString(13, degree);
            cs.setTimestamp(14, datePosted);
            cs.setInt(15, yos);
            cs.setInt(16,UserStat);
            cs.executeQuery();
            cs.close();
            
            CallableStatement cs2 = this.con.prepareCall("{call create_user_points(?)}");
            cs2.setString(1, username);
            cs2.executeQuery();
            cs2.close();
            
            con.close();
            
            RequestDispatcher rd = request.getRequestDispatcher("/homePage");
            rd.forward(request,response);
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(RegisterNewUser.class.getName()).log(Level.SEVERE, null, ex);
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
