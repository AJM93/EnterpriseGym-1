<%-- 
    Document   : Quizzes
    Created on : 23-Sep-2015, 14:29:55
    Author     : Dreads
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.QuizStore"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select a Quiz</title>
    </head>
    <body>
        <h1>Quizzes</h1>
        <table width='700px' border='1px'>
            <tr>
                <th>Quiz Id</th>
                <th>Quiz Name</th>
                <th>Total Points</th>
                <th>Learning Materials</th>
                <th>Start Quiz</th>
            </tr>
            <%
                int listCounter = 0;
                int iterCounter = 0;
                boolean tc = false;
                LinkedList<QuizStore> quizList = (LinkedList<QuizStore>) request.getAttribute("QuizList");
                Object testComplete = request.getAttribute("TestCompleted");
                if(testComplete != null)
                {
                    tc = true;
                }
                Iterator<QuizStore> iterator;
                iterator = quizList.iterator();
                while(iterator.hasNext())
                {
                    iterCounter++;
                    QuizStore ql = (QuizStore) iterator.next();    
                    int idQuiz = ql.getQuizId();
                    String Name = ql.getName();
                    int Points = ql.getPoints();
                    String LearningMaterials = ql.getLearningMaterials();  
            %>
            <tr>
                <td><%=idQuiz%></td>
                <td><%=Name%></td>
                <td><%=Points%></td>
                <td><%=LearningMaterials%></td>
                <td><form action="getQuizQuestions" method="GET"><button type="submit" name="QuizName" value=<%=idQuiz%>>Start</button></form></td>
            </tr>
            <%
                }
                if(tc == true)
                {%>
                    <script type="text/javascript">
                        alert('Sorry, you have already completed that test!');
                    </script>
              <%}
            %>
        </table>
    </body>
</html>
