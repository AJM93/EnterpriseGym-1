/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egym;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "CreateQuizQuestions", urlPatterns = {"/CreateQuizQuestions"})
public class CreateQuizQuestions extends HttpServlet {
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateQuizQuestions</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateQuizQuestions at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
            throws ServletException, IOException 
    {
        try
        {
            String quizName = request.getParameter("QuizName");
            String learningMaterials = request.getParameter("LearningMaterials");
            
            String qBody1 = request.getParameter("QuestionBody1");
            String q1A1 = request.getParameter("Q1A1");
            String q1A2 = request.getParameter("Q1A2");
            String q1A3 = request.getParameter("Q1A3");
            String q1A4 = request.getParameter("Q1A4");
            String cAnswerString = request.getParameter("Correct1");
            int cAnswer = Integer.parseInt(cAnswerString);
            
            String qBody2 = request.getParameter("QuestionBody2");
            String q2A1 = request.getParameter("Q2A1");
            String q2A2 = request.getParameter("Q2A2");
            String q2A3 = request.getParameter("Q2A3");
            String q2A4 = request.getParameter("Q2A4");
            String cAnswer2String = request.getParameter("Correct2");
            int cAnswer2 = Integer.parseInt(cAnswer2String);
            
            String qBody3 = request.getParameter("QuestionBody3");
            String q3A1 = request.getParameter("Q3A1");
            String q3A2 = request.getParameter("Q3A2");
            String q3A3 = request.getParameter("Q3A3");
            String q3A4 = request.getParameter("Q3A4");
            String cAnswer3String = request.getParameter("Correct3");
            int cAnswer3 = Integer.parseInt(cAnswer3String);
            
            String qBody4 = request.getParameter("QuestionBody4");
            String q4A1 = request.getParameter("Q4A1");
            String q4A2 = request.getParameter("Q4A2");
            String q4A3 = request.getParameter("Q4A3");
            String q4A4 = request.getParameter("Q4A4");
            String cAnswer4String = request.getParameter("Correct4");
            int cAnswer4 = Integer.parseInt(cAnswer4String);
            
            String qBody5 = request.getParameter("QuestionBody5");
            String q5A1 = request.getParameter("Q5A1");
            String q5A2 = request.getParameter("Q5A2");
            String q5A3 = request.getParameter("Q5A3");
            String q5A4 = request.getParameter("Q5A4");
            String cAnswer5String = request.getParameter("Correct5");
            int cAnswer5 = Integer.parseInt(cAnswer5String);
            
            String qBody6 = request.getParameter("QuestionBody6");
            String q6A1 = request.getParameter("Q6A1");
            String q6A2 = request.getParameter("Q6A2");
            String q6A3 = request.getParameter("Q6A3");
            String q6A4 = request.getParameter("Q6A4");
            String cAnswer6String = request.getParameter("Correct6");
            int cAnswer6 = Integer.parseInt(cAnswer6String);
            
            String qBody7 = request.getParameter("QuestionBody7");
            String q7A1 = request.getParameter("Q7A1");
            String q7A2 = request.getParameter("Q7A2");
            String q7A3 = request.getParameter("Q7A3");
            String q7A4 = request.getParameter("Q7A4");
            String cAnswer7String = request.getParameter("Correct7");
            int cAnswer7 = Integer.parseInt(cAnswer7String);
            
            String qBody8 = request.getParameter("QuestionBody8");
            String q8A1 = request.getParameter("Q8A1");
            String q8A2 = request.getParameter("Q8A2");
            String q8A3 = request.getParameter("Q8A3");
            String q8A4 = request.getParameter("Q8A4");
            String cAnswer8String = request.getParameter("Correct8");
            int cAnswer8 = Integer.parseInt(cAnswer8String);
            
            String qBody9 = request.getParameter("QuestionBody9");
            String q9A1 = request.getParameter("Q9A1");
            String q9A2 = request.getParameter("Q9A2");
            String q9A3 = request.getParameter("Q9A3");
            String q9A4 = request.getParameter("Q9A4");
            String cAnswer9String = request.getParameter("Correct9");
            int cAnswer9 = Integer.parseInt(cAnswer9String);
            
            String qBody10 = request.getParameter("QuestionBody10");
            String q10A1 = request.getParameter("Q10A1");
            String q10A2 = request.getParameter("Q10A2");
            String q10A3 = request.getParameter("Q10A3");
            String q10A4 = request.getParameter("Q10A4");
            String cAnswer10String = request.getParameter("Correct10");
            int cAnswer10 = Integer.parseInt(cAnswer10String);
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = this.con.prepareCall("{call create_new_quiz(?,?)}");
            cs.setString(1, quizName);
            cs.setString(2, learningMaterials);
            cs.executeQuery();
            cs.close();

            
            
            
            int quizId = 0;
            CallableStatement csQuizId = this.con.prepareCall("{call get_quiz_id(?)}");
            csQuizId.setString(1, quizName);
            rs = csQuizId.executeQuery();
            if(rs.next())
            {
                quizId = rs.getInt("idQuiz");
                csQuizId.close();
                
                CallableStatement cs2 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs2.setInt(1, quizId);
                cs2.setString(2, qBody1);
                cs2.setString(3, q1A1);
                cs2.setString(4, q1A2);
                cs2.setString(5, q1A3);
                cs2.setString(6, q1A4);
                cs2.setInt(7, cAnswer);
                cs2.executeQuery();
                cs2.close();
                
                CallableStatement cs3 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs3.setInt(1, quizId);
                cs3.setString(2, qBody2);
                cs3.setString(3, q2A1);
                cs3.setString(4, q2A2);
                cs3.setString(5, q2A3);
                cs3.setString(6, q2A4);
                cs3.setInt(7, cAnswer2);
                cs3.executeQuery();
                cs3.close();
                
                CallableStatement cs4 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs4.setInt(1, quizId);
                cs4.setString(2, qBody3);
                cs4.setString(3, q3A1);
                cs4.setString(4, q3A2);
                cs4.setString(5, q3A3);
                cs4.setString(6, q3A4);
                cs4.setInt(7, cAnswer3);
                cs4.executeQuery();
                cs4.close();
                
                CallableStatement cs5 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs5.setInt(1, quizId);
                cs5.setString(2, qBody4);
                cs5.setString(3, q4A1);
                cs5.setString(4, q4A2);
                cs5.setString(5, q4A3);
                cs5.setString(6, q4A4);
                cs5.setInt(7, cAnswer4);
                cs5.executeQuery();
                cs5.close();
                
                CallableStatement cs6 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs6.setInt(1, quizId);
                cs6.setString(2, qBody5);
                cs6.setString(3, q5A1);
                cs6.setString(4, q5A2);
                cs6.setString(5, q5A3);
                cs6.setString(6, q5A4);
                cs6.setInt(7, cAnswer5);
                cs6.executeQuery();
                cs6.close();
                
                CallableStatement cs7 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs7.setInt(1, quizId);
                cs7.setString(2, qBody6);
                cs7.setString(3, q6A1);
                cs7.setString(4, q6A2);
                cs7.setString(5, q6A3);
                cs7.setString(6, q6A4);
                cs7.setInt(7, cAnswer6);
                cs7.executeQuery();
                cs7.close();
                
                
                CallableStatement cs8 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs8.setInt(1, quizId);
                cs8.setString(2, qBody7);
                cs8.setString(3, q7A1);
                cs8.setString(4, q7A2);
                cs8.setString(5, q7A3);
                cs8.setString(6, q7A4);
                cs8.setInt(7, cAnswer7);
                cs8.executeQuery();
                cs8.close();
                
                CallableStatement cs9 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs9.setInt(1, quizId);
                cs9.setString(2, qBody8);
                cs9.setString(3, q8A1);
                cs9.setString(4, q8A2);
                cs9.setString(5, q8A3);
                cs9.setString(6, q8A4);
                cs9.setInt(7, cAnswer8);
                cs9.executeQuery();
                cs9.close();
                
                CallableStatement cs10 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs10.setInt(1, quizId);
                cs10.setString(2, qBody9);
                cs10.setString(3, q9A1);
                cs10.setString(4, q9A2);
                cs10.setString(5, q9A3);
                cs10.setString(6, q9A4);
                cs10.setInt(7, cAnswer9);
                cs10.executeQuery();
                cs10.close();
                
                CallableStatement cs11 = this.con.prepareCall("{call create_quiz_questions(?,?,?,?,?,?,?)}");
                cs11.setInt(1, quizId);
                cs11.setString(2, qBody10);
                cs11.setString(3, q10A1);
                cs11.setString(4, q10A2);
                cs11.setString(5, q10A3);
                cs11.setString(6, q10A4);
                cs11.setInt(7, cAnswer10);
                cs11.executeQuery();
                cs11.close();
                
                con.close();
                RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                rd.forward(request,response);
            }
            else
            {
                cs.close();
                con.close();
                RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                rd.forward(request,response);
            }
            
        } 
        catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(CreateQuizQuestions.class.getName()).log(Level.SEVERE, null, ex);
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
