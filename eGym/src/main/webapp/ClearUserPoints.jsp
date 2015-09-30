<%-- 
    Document   : ClearUserPoints
    Created on : 30-Sep-2015, 11:57:01
    Author     : Dreads
--%>

<%@page import="Stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
   
    <div id="services" class="pad-section">
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
            if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
    %>
        
    <div class="container">    
        <h1>Delete Points and Quiz Attempts</h1>
    
        <p>You are about to delete all the allocated points and quiz attempts!</p>
    
        <p>This change can not be reverted once it has been done!</p>
    
        <p>Click on Confirm if you wish to reset all points and quiz attempts.</p>
    
        <form action="DeleteAllPoints" method="POST"><button type="submit" class="btn btn-default" name="confirmResetPointsAndQuiz">Confirm</button></form>
    
    </div>
    <%
    } else {
    %>                
    <h1>You are not authorised to view this page. Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a> as an administrator.</h1>
    <%
        }
    } else {
    %>
    <h1>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h1>
    <%
        }
    %>
</div>    
<jsp:include page="footer.jsp"></jsp:include>
