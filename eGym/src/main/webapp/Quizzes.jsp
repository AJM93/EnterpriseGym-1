<%-- 
    Document   : Quizzes
    Created on : 23-Sep-2015, 14:29:55
    Author     : Dreads
--%>
<%@page import="Stores.LoggedIn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.QuizStore"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
    <link href="css/style.css" rel="stylesheet" />  
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <div id="services" class="pad-section">
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
            String username = lg.getUsername();
    %>
            <h1>Quizzes</h1>
            <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Quiz Id</th>
                        <th>Quiz Name</th>
                        <th>Total Points</th>
                        <th>Learning Materials</th>
                        <th>Start Quiz</th>
                    </tr>
                </thead>
                <tbody>
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
                    <td><form action="getQuizQuestions/<%=username%>" method="GET"><button type="submit" class="btn btn-default" name="QuizName" value=<%=idQuiz%>>Start</button></form></td>
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
                 </tbody>  
            </table>
            </div>
    <%
        }else{
    %>    
            <h1>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h1>
    <%
        } 
    %>            
</div>
<jsp:include page="footer.jsp"></jsp:include>
