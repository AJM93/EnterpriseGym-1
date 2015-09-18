<%-- 
    Document   : eventsComments
    Created on : Sep 18, 2015, 4:34:22 PM
    Author     : Paris
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.EventsCommentModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Events comments</title>
    </head>
    <body>
        <table width='700px' border='1px'>
            <tr>
                <th>Author</th>
                <th>Body</th>
                <th>Date Posted</th>
            </tr>
        <%
            LinkedList<EventsCommentModel> newsComments = (LinkedList<EventsCommentModel>) request.getAttribute("EventsCommentList");
            Iterator<EventsCommentModel> iterator = newsComments.iterator();
            
            while (iterator.hasNext()) 
            {
                EventsCommentModel comment = (EventsCommentModel) iterator.next();
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
