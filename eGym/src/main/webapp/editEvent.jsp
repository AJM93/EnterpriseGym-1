<%-- 
    Document   : editEvent
    Created on : Sep 24, 2015, 1:47:50 PM
    Author     : Yogi
--%>
<%@page import="Models.EventsModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="Stores.BasicUser"%>
<%@page import="Stores.ActivityType"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.LoggedIn"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
        
        <%
                        EventsModel em = (EventsModel) request.getAttribute("Event");
                       
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form role="form" method="POST" action=<%=""+em.getEventID()%>>
            <textarea name="title" required autofocus><%=em.getEventTitle()%></textarea>
            <textarea name="body" required autofocus><%=em.getEventBody()%></textarea>
            <textarea name="points" required autofocus><%=em.getEventPoints()%></textarea>
            <label for="type">Type</label>
            <select name="type" required>
            <%
                LinkedList<ActivityType> activityTypes = (LinkedList<ActivityType>) request.getAttribute("ActivityTypes");
                Iterator<ActivityType> activityTypeIterator = activityTypes.iterator();

                while (activityTypeIterator.hasNext()){
                    ActivityType at = activityTypeIterator.next();%>
                    <option value="<%=at.getID()%>"><%=at.getType()%></option>
            <%
                }
            %>
            </select>
            <label for="trainer">Trainer</label>
            <select name="trainer" required>
            <%
                LinkedList<BasicUser> trainers = (LinkedList<BasicUser>) request.getAttribute("Trainers");
                Iterator<BasicUser> trainersIterator = trainers.iterator();

                while (trainersIterator.hasNext()){
                    BasicUser trainer = trainersIterator.next();%>
                    <option value="<%=trainer.getUsername()%>"><%=trainer.getFirstName()%> <%=trainer.getLastName()%></option>
            <%
                }
            %>
            </select>
            <script>
                CKEDITOR.replace( 'body' );
            </script>
            <fieldset>
                <legend>Starts</legend>
                <input type="date" name="startDate">
                <input type="time" name="startTime">
            </fieldset>
            
            <fieldset>
                <legend>Ends</legend>
                <input type="date" name="endDate">
                <input type="time" name="endTime">
            </fieldset>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Edit</button>
        </form>
    </body>
</html>
