/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Models.NewsCommentModel;
import Models.NewsModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tom
 */
@WebServlet(name = "newsComments", urlPatterns = {"/newsComments/*"})
public class newsComments extends HttpServlet {

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
    
    public java.util.LinkedList<NewsCommentModel> GetComments(int id){
        LinkedList<NewsCommentModel> newsCommentList = new LinkedList<>();
        try 
        {
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = this.con.prepareCall("{call news_comments(?)}");   //(?,?)}"
            cs.setInt(1,id);
            ResultSet rs = cs.executeQuery();
            
            while (rs.next())
            {                
                int commentID = rs.getInt("commentID");
                int newsID = rs.getInt("newsID");
                String author = rs.getString("author");
                String body = rs.getString("body");
                Timestamp datePosted = rs.getTimestamp("datePosted");
                
                NewsCommentModel newsComment = new NewsCommentModel(commentID, newsID, author, body, datePosted);
                newsCommentList.add(newsComment);
            }
            cs.close();
            con.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(newsComments.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newsCommentList;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // get the news ID from the URL that triggered the servlet
        String path = request.getPathInfo();
        int urlNewsID = Integer.parseInt(path.substring(1));
        
        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = this.con.prepareCall("{call news_comments(?)}");   //(?,?)}"
            cs.setInt(1,urlNewsID);
            ResultSet rs = cs.executeQuery();
            
            LinkedList<NewsCommentModel> newsCommentList = new LinkedList<>();
            while (rs.next()) 
            {                
                int commentID = rs.getInt("commentID");
                int newsID = rs.getInt("newsID");
                String author = rs.getString("author");
                String body = rs.getString("body");
                Timestamp datePosted = rs.getTimestamp("datePosted");
                
                NewsCommentModel newsComment = new NewsCommentModel(commentID, newsID, author, body, datePosted);
                newsCommentList.add(newsComment);
            }
            
            request.setAttribute("NewsCommentList", newsCommentList);
            cs.close();
            con.close();
            RequestDispatcher rd = request.getRequestDispatcher("/newsComments.jsp");
            rd.forward(request,response);
            
        } catch (SQLException ex) {
            Logger.getLogger(news.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(news.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(news.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(news.class.getName()).log(Level.SEVERE, null, ex);
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
