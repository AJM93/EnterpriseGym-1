<%-- 
    Document   : Event
    Created on : Sep 18, 2015, 4:29:03 PM
    Author     : Yogi
--%>
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
            EventStore es = (EventStore) request.getAttribute("Event");
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
        
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><%=es.getId()%> : <%=es.getTitle()%></h3>
            </div>
            <div class="panel-body" style="color: black;">
                <%=es.getBody()%>
            </div>
        </div>
    

        
        <p>Total Points: <%=es.getPoints()%> </p>
        <p>Type of Event: <%=es.getType()%> </p>
        <p>Event Trainer: <%=es.getTrainer()%></p>
        <p>Start time: <%=es.getStart()%> </p>
        <p>End time: <%=es.getStop()%> </p>
        <input type="hidden" name="eventIDBox" id="eventIDBox" value="<%=es.getId()%>">
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null && lg.isLoggedIn()) 
            {
                String username = lg.getUsername();
                if (lg.getRole() == 2 || lg.getRole() == 3) { %>
                
        %>
        <a href="/eGym/GetAttendees/<%=es.getId()%>">Register Event Attendance</a>
        <%}%>
                <form action="/eGym/EventSignUp/<%=es.getId()%>" method="POST"><button type="submit" name="UsernameSignUp" value=<%=username%>>Sign Up</button></form>
                <input type="hidden" name="userNameBox" id="userNameBox" value="<%=lg.getUsername()%>">
               
                <%
                    LinkedList<EventsCommentModel> eventComments = (LinkedList<EventsCommentModel>) request.getAttribute("EventsCommentList");
                    Iterator<EventsCommentModel> iterator = eventComments.iterator();

                    while (iterator.hasNext()) 
                    {
                        EventsCommentModel comment = (EventsCommentModel) iterator.next();
                %>
                      
                        <div id="Comments">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading" >
                        <h3 class="panel-title"><a href="/eGym/profile/<%=comment.getAuthor()%>"><%=comment.getAuthor()%></a></h3>
                    </div>
                    <div class="panel-body" style="color: black;">
                        <%=comment.getBody()%>
                    </div>
                </div>
            </div>
        </div>
                <%
                    }
                %>

                

           
<textarea rows="4" cols="50" name="commentBox" id="commentBox" maxlength="145" ></textarea><br />
<input type="button" value="Submit Comment" name="submit" class="comment_button"/>
    <div id="flash"></div>
<ol id="update" class="timeline">
</ol>
    
      </div>
        </div>
        
    
    <%
            }
                    
        %>
        
        <jsp:include page="footer.jsp"></jsp:include>
