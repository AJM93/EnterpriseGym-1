<%-- 
    Document   : NewsStory
    Created on : Sep 18, 2015, 11:50:34 AM
    Author     : Yogi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
                        NewsModel nm = (NewsModel) request.getAttribute("NewsStory");

        %>
        
        <h2> <%=nm.getNewsTitle()%> </h2>
    </body>
</html>
