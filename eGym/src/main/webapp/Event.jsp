<%-- 
    Document   : Event
    Created on : Sep 18, 2015, 4:29:03 PM
    Author     : Yogi
--%>
<%@page import="Models.NewsCommentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.EventsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%
                        EventsModel em = (EventsModel) request.getAttribute("Event");
                      //  LinkedList<NewsCommentModel> newsCommentList = (LinkedList<NewsCommentModel>) request.getAttribute("NewsComments");
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=em.getEventTitle()%></h1>
    </body>
</html>
