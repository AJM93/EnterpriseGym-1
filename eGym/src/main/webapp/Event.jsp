<%-- 
    Document   : Event
    Created on : Sep 18, 2015, 4:29:03 PM
    Author     : Yogi
--%>
<%@page import="Stores.UserStore"%>
<%@page import="Stores.LoggedIn"%>
<%@page import="Stores.EventStore"%>
<%@page import="Models.EventsCommentModel"%>
<%@page import="Models.NewsCommentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.EventsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/
libs/jquery/1.3.0/jquery.min.js">
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
 <script type="text/javascript">
$(function() {

$(".comment_button").click(function() {


   
    var boxval = $("#commentBox").val();
	
    //var commentBox = 'commentBox='+ boxval;
    
    var usernameval = $("#userNameBox").val();
    
    //var userName = 'userName='+ usernameval;
    
    var eventidval = $("#eventIDBox").val();
	
	if(boxval=='')
	{
	alert("Please Enter Some Text");
	
	}
        else
{
$("#flash").show();
$("#flash").fadeIn(400).html('<img src="ajax-loader.gif" align="absmiddle"> <span class="loading">Loading Comment...</span>');

$.ajax({
type: "POST",
url: "/eGym/PostEventComment",
data: {commentBox: boxval, userName: usernameval, eventID: eventidval},
cache: false,
success: function(html){
}
});
            
location.reload();
//$('#Comments').load(document.URL +  ' #commentTable');
//$("ol#update li:first").slideDown("slow");
document.getElementById('commentBox').value='';
document.getElementById('commentBox').focus();
$("#flash").hide();
} return false;
});
});
   </script>
<jsp:include page="header.jsp"></jsp:include>
        
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        
        EventStore es = (EventStore) request.getAttribute("Event");
        String title = es.getTitle();
        String body = es.getBody();
        int points = es.getPoints();
        String type = es.getType();
        String trainer = es.getTrainer();
        String date = new java.text.SimpleDateFormat("E dd MMM yyyy").format(es.getStart());
        String startTime = new java.text.SimpleDateFormat("HH:mm").format(es.getStart());
        String endTime = new java.text.SimpleDateFormat("HH:mm").format(es.getStop());
        
        UserStore us = (UserStore) request.getAttribute("Trainer");
        String trainerEmail = us.getEmail();
    %>

    <script src="assets/js/jquery.validate.js"></script> 
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <!-- Bootstrap -->
    <script src="http://bootstrapformhelpers.com/assets/js/bootstrap.min.js"></script>
    <!-- Bootstrap Form Helpers -->
    <script src="http://bootstrapformhelpers.com/assets/js/bootstrap-formhelpers.min.js"></script>

    <div id="services" class="pad-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong><%=title%></strong></h3>
                        </div>
                        <div class="panel-body" style="color: black;">
                            <%=body%>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Info</strong></h3>
                        </div>
                        <div class="panel-body" style="color: black;">
                            <div class="row">
                                <div class="col-md-12">
                                    <p><strong>Total Points:</strong> <%=points%> </p>
                                    <p><strong>Type of Event:</strong> <%=type%> </p>
                                    <p><strong>Event Trainer:</strong> <a href="/eGym/profile/<%=trainer%>"><%=trainer%></a> <a href="mailto:<%=trainerEmail%>">(email)</a></p>
                                    <p><strong>Date:</strong> <%=date%></p>
                                    <p><strong>Time:</strong> <%=startTime%> - <%=endTime%></p>
                                </div>
                            </div>
                            
                        <%
                            if (lg != null && lg.isLoggedIn()) {
                                String username = lg.getUsername();
                        %>
                                <div class="row">
                                    <div class="col-md-12" style="border-top: 1px solid#888; padding: 10px;">
                                        <input type="hidden" name="eventIDBox" id="eventIDBox" value="<%=es.getId()%>">
                        <%
                                if (lg.getRole() == 3 || lg.getRole() == 4) { %>
                                    <a href="/eGym/GetAttendees/<%=es.getId()%>">Register Event Attendance</a>
                        <%      } else {
                        %>
                                    <form action="/eGym/EventSignUp/<%=es.getId()%>" method="POST"><button type="submit" name="UsernameSignUp" value=<%=username%>>Sign Up</button></form>
                                    <input type="hidden" name="userNameBox" id="userNameBox" value="<%=lg.getUsername()%>">
                        <%
                                }
                        %>
                                    </div>
                                </div>
                        <%
                            }
                        %>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                <%
                    LinkedList<EventsCommentModel> eventComments = (LinkedList<EventsCommentModel>) request.getAttribute("EventsCommentList");
                    
                    if (eventComments.isEmpty()) {
                        // no comments on the activity
                %>
                        <div id="Comments">
                            <div class="panel panel-default">
                                <div class="panel-body" style="color: black;">
                                    Be the first to comment on this activity!
                                </div>
                            </div>
                        </div>
                
                <%
                    } else {
                        // show comments on the activity
                    
                        Iterator<EventsCommentModel> iterator = eventComments.iterator();

                        while (iterator.hasNext()) 
                        {
                            EventsCommentModel comment = (EventsCommentModel) iterator.next();
                            String commentAuthor = comment.getAuthor();
                            String commentBody = comment.getBody();
                            String commentPosted = new java.text.SimpleDateFormat("E dd MMM yyyy - HH:mm:ss").format(comment.getDatePosted());
                %>
                        <div id="Comments">
                            <div class="panel panel-default">
                                <div class="panel-heading" >
                                    <a href="/eGym/profile/<%=commentAuthor%>"><%=commentAuthor%></a> (<%=commentPosted%>)
                                </div>
                                <div class="panel-body" style="color: black;">
                                    <%=commentBody%>
                                </div>
                            </div>
                        </div>
                <%
                        }
                    }
                %>
                </div>
            </div>
            <% if (lg != null && lg.isLoggedIn()) { %>
                <form role="form">
                    <input type="hidden" name="userNameBox" id="userNameBox" value="<%=lg.getUsername()%>">
                    <div class="form-group">
                        <label for="commentBox">Comment:</label>
                        <textarea class="form-control" rows="5" name="commentBox" id="commentBox"></textarea>
                        <br />
                        <input type="button" value="Submit" name="submit" class="btn btn-default comment_button"/>
                    </div>
                </form>
            <% } %>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>