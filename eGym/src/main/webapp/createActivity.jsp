<%-- 
    Document   : createActivity
    Created on : 23-Sep-2015, 13:28:35
    Author     : Tom
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Stores.BasicUser"%>
<%@page import="Stores.ActivityType"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create activity</title>
    </head>
    <body>
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null && lg.isLoggedIn()) {
        %>
        
        <form role="form" method="POST" action="createActivity">
            <h2>Create an activity</h2>
            <label for="title">Title</label>
            <input type="text" name="title" placeholder="Title" required autofocus>
            <label for="points">Points</label>
            <input type="number" name="points" required>
            
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
            
            <label for="Body">Body</label>
            <textarea name="body" placeholder="Enter content here" required autofocus></textarea>
            <br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>
        </form>
        <%
            } else {
        %>
            <h2>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h2>
        <%
            }
        %>
    </body>
</html>
