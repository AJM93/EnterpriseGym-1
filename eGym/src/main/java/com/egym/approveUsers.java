/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Models.NewsModel;
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
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Dreads
 */
@WebServlet(name = "approveUsers", urlPatterns = {"/approveUsers"})
public class approveUsers extends HttpServlet 
{
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
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call unapproved_users}"); 
            ResultSet rs = cs.executeQuery();
            
            LinkedList<UserModel> userList = new LinkedList<UserModel>();
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
                UserModel usermodel = new UserModel(Username, Firstname, Lastname, MatriculationNo, Email, PhoneNo, Gender, Country, Institution, SubInstitution, Degree, dob, yos, UserStatus);
                userList.add(usermodel);
            }
            request.setAttribute("UserList", userList);
            cs.close();
            con.close();
            RequestDispatcher rd = request.getRequestDispatcher("approveUser.jsp");
            rd.forward(request,response);
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(approveUsers.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(approveUsers.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (InstantiationException ex) 
        {
            Logger.getLogger(approveUsers.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (IllegalAccessException ex) 
        {
            Logger.getLogger(approveUsers.class.getName()).log(Level.SEVERE, null, ex);
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
