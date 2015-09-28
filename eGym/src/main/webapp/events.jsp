<%-- 
    Document   : events
    Created on : Sep 18, 2015, 1:56:54 PM
    Author     : Paris
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.EventsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
        <table width='700px' border='1px'>
            <tr>
                <th>Title</th>
                <th>Body</th>
                <th>Trainer</th>
                <th>Points</th>
            </tr>
        <%
            ArrayList events_titles = new ArrayList();
            ArrayList events_body = new ArrayList();
            ArrayList events_trainer = new ArrayList();
            LinkedList<EventsModel> llsr = (LinkedList<EventsModel>) request.getAttribute("EventsList");
            Iterator<EventsModel> iterator;
            iterator = llsr.iterator();
            while (iterator.hasNext()) 
            {
                EventsModel nm = (EventsModel) iterator.next();
                int id = nm.getEventID();
                String Title = nm.getEventTitle();
                String Body = nm.getEventBody();
                String Trainer = nm.getEventTrainer();
                int Points = nm.getEventPoints();
                //events_titles.add(Title + ": " + Date);
                events_body.add(Body);
                events_trainer.add(Trainer);
        %>
            <tr>
                <td><a href="/eGym/EventItem/<%=id%>"><%=Title%></a> </td>
                <td><%=Body%></td>
                <td><%=Trainer%></td>
                <td><%=Points%></td>
            </tr>
            <%
            }
        %>
        </table>
        
       
        
    </body>
</html>