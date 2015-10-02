<%-- 
    Document   : editEvent
    Created on : Sep 24, 2015, 1:47:50 PM
    Author     : Yogi
--%>
<%@page import="Stores.EventStore"%>
<%@page import="Models.EventsModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="Stores.BasicUser"%>
<%@page import="Stores.ActivityType"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.LoggedIn"%>

<jsp:include page="header.jsp"></jsp:include>
<link href="css/style.css" rel="stylesheet" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>

<%
    EventStore em = (EventStore) request.getAttribute("Event");
    int eventID = em.getId();
    String eventTitle = em.getTitle();
    String eventBody = em.getBody();
    int eventPoints = em.getPoints();
%>
<title>Edit event #<%=eventID%></title>

<div class="container" style="border-bottom: 1px solid#888; padding: 15px;">
    <div class="row">
        <div class="col-md-12">
            <h2>Edit event</h2>
            <form role="form" method="POST" action=<%=""+eventID%>>
                <textarea name="title" class="form-control" rows="2" required autofocus><%=eventTitle%></textarea>
                <br>
                <textarea name="body" required><%=eventBody%></textarea>
                <br>
                <div class="row">
                    <div class="col-md-4">
                        <label for="points">Points</label>
                        <input type="number" class="form-control" required name="points" value="<%=eventPoints%>">
                    </div>
                    <div class="col-md-4">
                        <label for="type">Type</label>
                        <select name="type" class="form-control" required>
                        <%
                            LinkedList<ActivityType> activityTypes = (LinkedList<ActivityType>) request.getAttribute("ActivityTypes");
                            Iterator<ActivityType> activityTypeIterator = activityTypes.iterator();

                            while (activityTypeIterator.hasNext()){
                                ActivityType at = activityTypeIterator.next();%>
                                <option value="<%=at.getID()%>" <%if(at.getType().equals(em.getType())){%>selected="selected"<%}%>><%=at.getType()%></option>
                        <%
                            }
                        %>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="trainer">Trainer</label>
                        <select class="form-control" name="trainer" required>
                        <%
                            LinkedList<BasicUser> trainers = (LinkedList<BasicUser>) request.getAttribute("Trainers");
                            Iterator<BasicUser> trainersIterator = trainers.iterator();

                            while (trainersIterator.hasNext()){
                                BasicUser trainer = trainersIterator.next();%>
                                <option value="<%=trainer.getUsername()%>" <% if(trainer.getUsername().equals(em.getTrainer())){ %> selected="selected" <%}%>><%=trainer.getFirstName()%> <%=trainer.getLastName()%></option>
                        <%
                            }
                        %>
                        </select>
                    </div>
                </div>
                
                <script>
                    CKEDITOR.replace( 'body' );
                </script>
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <fieldset>
                            <legend>Starts</legend>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="date" class="form-control" name="startDate" value = "<%=em.getStart().toString().substring(0,10)%>">
                                </div>
                                <div class="col-md-6">
                                    <input type="time" class="form-control" name="startTime" value = "<%=em.getStart().toString().substring(11,16)%>">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                        
                    <div class="col-md-6">
                        <fieldset>
                            <legend>Ends</legend>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="date" class="form-control" name="endDate" value = "<%=em.getStop().toString().substring(0,10)%>">
                                </div>
                                <div class="col-md-6">
                                    <input type="time" class="form-control" name="endTime" value = "<%=em.getStop().toString().substring(11,16)%>">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Edit</button>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>