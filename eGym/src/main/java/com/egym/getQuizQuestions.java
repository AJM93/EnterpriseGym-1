/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import Models.UserModel;
import Stores.LoggedIn;
import Stores.QuestionStore;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Dreads
 */
@WebServlet(name = "getQuizQuestions", urlPatterns = {"/getQuizQuestions/*"})
public class getQuizQuestions extends HttpServlet {
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
            throws ServletException, IOException 
    {
        try
        {
            
            String path = request.getPathInfo();
            String username = path.substring(1);
            boolean runTest = true;
            String QuizNameString = request.getParameter("QuizName");
            int QuizName = Integer.parseInt(QuizNameString);
            //Get the logged in users username
            //String username = "test1";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            //check if user has done the test
            cs = this.con.prepareCall("{call get_user_quiz_attempts(?)}");
            cs.setString(1, username);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                int completedQuizId = rs.getInt("Quiz_idQuiz");
                if(QuizName == completedQuizId)
                {
                    runTest = false;
                }
            }
            cs.close();
            if(runTest == true)
            {
                CallableStatement cs2 = null;
                cs2 = this.con.prepareCall("{call get_quiz_information(?)}"); 
                cs2.setInt(1, QuizName);
                ResultSet rs2 = cs2.executeQuery();
                LinkedList<QuestionStore> questionList = new LinkedList<QuestionStore>();
                while(rs2.next())
                {
                    int QuestionId = rs2.getInt("idQuestion");
                    String QuestionBody = rs2.getString("QuestionBody");
                    String Answer1 = rs2.getString("Answer1");
                    String Answer2 = rs2.getString("Answer2");
                    String Answer3 = rs2.getString("Answer3");
                    String Answer4 = rs2.getString("Answer4");
                    int CorrectAnswer = rs2.getInt("CorrectAnswer");
                    QuestionStore qStore = new QuestionStore(QuestionId, QuizName, QuestionBody, Answer1, Answer2, Answer3, Answer4, CorrectAnswer);
                    questionList.add(qStore);
                }
                cs2.close();
                con.close();

                request.setAttribute("QuestionList", questionList);
                request.setAttribute("quizId", QuizNameString);
                // Adds Username for testing.
                request.setAttribute("userName", username);
                RequestDispatcher rd = request.getRequestDispatcher("/Quiz.jsp");
                rd.forward(request,response);
            }else{
                con.close();
                request.setAttribute("TestCompleted", QuizName);
                RequestDispatcher rd = request.getRequestDispatcher("/GetQuizzes");
                rd.forward(request,response);
            }
        }catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException ex) {
            Logger.getLogger(getQuizQuestions.class.getName()).log(Level.SEVERE, null, ex);
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
