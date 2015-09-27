<%-- 
    Document   : NewsStory
    Created on : Sep 18, 2015, 11:50:34 AM
    Author     : Yogi
--%>

<%@page import="Stores.LoggedIn"%>
<%@page import="Models.NewsCommentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%
                        NewsModel nm = (NewsModel) request.getAttribute("NewsStory");
                        LinkedList<NewsCommentModel> newsCommentList = (LinkedList<NewsCommentModel>) request.getAttribute("NewsComments");
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title><%=nm.getNewsTitle()%></title>
    </head>
    <body>
 
        
        
        <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><%=nm.getNewsTitle()%></h3>
  </div>
  <div class="panel-body">
    <%=nm.getNewsBody()%>
  </div>
</div>
        
        
        <div></div>
        <% 
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null && lg.isLoggedIn()) {
            if (lg.getRole() == 2 || lg.getRole() == 3) { %>
        <a href="/eGym/EditNews/<%=nm.getNewsId()%>">Edit this</a>
        <%}}%>
      
        
    </body>
</html>
