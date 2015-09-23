<%-- 
    Document   : editNews
    Created on : Sep 23, 2015, 3:15:25 PM
    Author     : Yogi
--%>
<%@page import="java.sql.Timestamp"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import="java.util.LinkedList"%>
 <%@page import="java.util.Iterator"%>
 <%@page import="Models.NewsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
        
        <%
                        NewsModel nm = (NewsModel) request.getAttribute("NewsStory");
                       
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <textarea name="title" required autofocus><%=nm.getNewsTitle()%></textarea>
        <textarea name="body" required autofocus><%=nm.getNewsBody()%></textarea>
        <script>
            CKEDITOR.replace( 'body' );
        </script>
    </body>
</html>
