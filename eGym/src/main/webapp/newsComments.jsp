<%-- 
    Document   : newsComments
    Created on : 18-Sep-2015, 11:30:22
    Author     : Tom
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.NewsCommentModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News comments</title>
    </head>
    <body>
        <table width='700px' border='1px'>
            <tr>
                <th>Author</th>
                <th>Body</th>
                <th>Date Posted</th>
            </tr>
        <%
            LinkedList<NewsCommentModel> newsComments = (LinkedList<NewsCommentModel>) request.getAttribute("NewsCommentList");
            Iterator<NewsCommentModel> iterator = newsComments.iterator();
            
            while (iterator.hasNext()) 
            {
                NewsCommentModel comment = (NewsCommentModel) iterator.next();
        %>
        <tr>
            <td><%=comment.getAuthor()%></td>
            <td><%=comment.getBody()%></td>
            <td><%=comment.getDatePosted()%></td>
        </tr>
        <%
            }
        %>
        
        </table>
    </body>
</html>
