/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Stores.UserStore;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
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
@WebServlet(name = "overallLeaderboard", urlPatterns = {"/overallLeaderboard"})
public class overallLeaderboard extends HttpServlet {
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
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
            CallableStatement cs = this.con.prepareCall("{call points_leaderboard}");
            ResultSet rs = cs.executeQuery();
            
            LinkedList<UserStore> leaderboard = new LinkedList<>();
            while (rs.next()) {
                String username, firstName, lastName;
                
                if (rs.getString("IncludeInLeaderboard").equals("N")){
                    username = "Anonymous";
                    firstName = "Anonymous";
                    lastName = "";
                } else {
                    username = rs.getString("Users_Username");
                    firstName = rs.getString("FirstName");
                    lastName = rs.getString("LastName");
                }
                
                int onlineTheory = rs.getInt("Online_Theory");
                int challenge = rs.getInt("Challenge");
                int action = rs.getInt("Action");
                int project = rs.getInt("Project");
                int total = rs.getInt("Total");
                String institution = rs.getString("Institution");
                String subInstitution = rs.getString("Sub_Institution");
                UserStore lbUser = new UserStore(username, firstName, lastName, onlineTheory, challenge, action, project, total, institution, subInstitution);
                leaderboard.add(lbUser);
            }
            
            request.setAttribute("leaderboard", leaderboard);
            cs.close();
            con.close();
            
            RequestDispatcher rd = request.getRequestDispatcher("/overallLeaderboard.jsp");
            rd.forward(request,response);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(overallLeaderboard.class.getName()).log(Level.SEVERE, null, ex);
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
