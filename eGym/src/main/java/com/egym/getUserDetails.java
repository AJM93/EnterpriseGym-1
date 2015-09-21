/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Models.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Dreads
 */
@WebServlet(name = "getUserDetails", urlPatterns = {"/getUserDetails"})
public class getUserDetails extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("getUsername");
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call get_user_details(?)}"); 
            cs.setString(1, username);
            ResultSet rs = cs.executeQuery(); 
            UserModel usermodel = null;
            while (rs.next()) 
            {
                String Username = rs.getString("Username");
                String Firstname = rs.getString("Firstname");
                String Lastname = rs.getString("Lastname");
                String MatriculationNo = rs.getString("MatriculationNumber");
                String Email = rs.getString("Email");
                String PhoneNo = rs.getString("PhoneNumber");
                String genderS = rs.getString("Gender");
                char Gender = genderS.charAt(0);
                String Country = rs.getString("Country");
                String Institution = rs.getString("Institution");
                String SubInstitution = rs.getString("Sub_Institution");
                String Degree = rs.getString("Degree");
                Timestamp dob = rs.getTimestamp("DOB");
                String yos = rs.getString("YearOfStudy");
                int UserStatus = rs.getInt("UserStatus_idUserStatus");
                usermodel = new UserModel(Username, Firstname, Lastname, MatriculationNo, Email, PhoneNo, Gender, Country, Institution, SubInstitution, Degree, dob, yos, UserStatus);
            }
            request.setAttribute("UserModel", usermodel);
            cs.close();
            con.close();
            RequestDispatcher rd = request.getRequestDispatcher("editUser.jsp");
            rd.forward(request,response);
            
        } catch (SQLException ex) {
            Logger.getLogger(editUserDetails.class.getName()).log(Level.SEVERE, null, ex);
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
            throws ServletException, IOException {
        processRequest(request, response);
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
