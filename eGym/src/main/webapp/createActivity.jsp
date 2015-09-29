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
<jsp:include page="header.jsp"></jsp:include>
<script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null && lg.isLoggedIn()) {
                if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
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
            <script>
            CKEDITOR.replace( 'body' );
             </script>
            <br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>
        </form>
        <%
                } else {
        %>
                    <h2>You are not authorised to view this page. Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a> as an administrator.</h2>
        <%
                }
            } else {
        %>
                <h2>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h2>
        <%
            }
        %>
<jsp:include page="footer.jsp"></jsp:include>
