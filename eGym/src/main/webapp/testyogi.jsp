<%-- 
    Document   : testyogi
    Created on : Sep 22, 2015, 3:10:45 PM
    Author     : Yogi
--%>

<%@page import="java.sql.Timestamp"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import="java.util.LinkedList"%>
 <%@page import="java.util.Iterator"%>
 <%@page import="Models.*"%>
 <%@page import="Stores.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
        <title>
            
        </title>
    </head>
    <%
    NewsModel nm = new NewsModel();
    LinkedList<NewsModel> n = nm.getHomeNews();
    
    EventsModel em = new EventsModel();
    LinkedList<EventsModel> m = em.getHomeEvents();
    
    LinkedList<EventsModel> o = em.getUserEvents("Tom");
    
    UserModel um = new UserModel();
    UserStore us = um.getUserDetails("Tom");
    
    %>
    
    <body>
        <h1><%=n.get(1).getNewsTitle()%></h1>
        <h1><%=m.get(0).getEventTitle()%></h1>
        <h1><%=o.get(0).getEventTitle()%></h1>
        <h1><%=us.getFirstname()%></h1>
                                
        <textarea name="body" required autofocus><%=n.get(1).getNewsBody()%></textarea>
        <script>
            CKEDITOR.replace( 'body' );
        </script>
    </body>
</html>
