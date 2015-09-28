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

<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<style type="text/css">
table, td, th
{
border:1px solid green;
font-family: 'Oxygen', sans-serif;
}
th
{
background-color:green;
color:white;
}
body
{
 text-align: center;
}
.container
{
 margin-left: auto;
 margin-right: auto;
 width: 40em;
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
 <script type="text/javascript">
$(function() {

$(".comment_button").click(function() {


   
    var boxval = $("#commentBox").val();
	
    //var commentBox = 'commentBox='+ boxval;
    
    var usernameval = $("#userNameBox").val();
    
    //var userName = 'userName='+ usernameval;
	
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
data: {commentBox: boxval, userName: usernameval},
cache: false,
success: function(html){
}
});
            
            
            
/*jQuery.post( "/eGym/PostEventComment",
{
data: dataString,
usernameDate: userName,
}
cache: false,
success: function(html){
}
});*/

//alert(commentBox);
//alert(userName);

alert("Comment Posted");
$("ol#update li:first").slideDown("slow");
document.getElementById('commentBox').value='';
document.getElementById('commentBox').focus();
$("#flash").hide();
 $.get('PopulateEventsComments',function(responseJson) {
            if(responseJson!==null){
                $("#commentsTable").find("tr:gt(0)").remove();
                var table1 = $("#commentsTable");
                $.each(responseJson, function(key,value) { 
                     var rowNew = $("<tr><td></td><td></td><td></td></tr>");
                        rowNew.children().eq(0).text(value['author']); 
                        rowNew.children().eq(1).text(value['body']); 
                        rowNew.children().eq(2).text(value['datePosted']); 
                        rowNew.appendTo(table1);
                });
            }
        });
} return false;
});
});
   </script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
 $("#tablediv").hide();
           $.get('PopulateEventsComments',function(responseJson) {
            if(responseJson!==null){
                $("#commentsTable").find("tr:gt(0)").remove();
                var table1 = $("#commentsTable");
                $.each(responseJson, function(key,value) { 
                     var rowNew = $("<tr><td></td><td></td><td></td></tr>");
                        rowNew.children().eq(0).text(value['author']); 
                        rowNew.children().eq(1).text(value['body']); 
                        rowNew.children().eq(2).text(value['datePosted']); 
                        rowNew.appendTo(table1);
                });
                }
            });
            $("#tablediv").show();      
});
</script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#showTable2").click(function(event){
        $("#tablediv").hide();        
  });      
});
</script>
<html>
    <head>
        
        <%
            EventStore es = (EventStore) request.getAttribute("Event");
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<!-- Bootstrap Form Helpers -->
		<link href="http://bootstrapformhelpers.com/assets/css/bootstrap-formhelpers.min.css" rel="stylesheet" media="screen">
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="assets/js/jquery.validate.js"></script> 
                <!-- jQuery -->
		<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<!-- Bootstrap -->
		<script src="http://bootstrapformhelpers.com/assets/js/bootstrap.min.js"></script>
		<!-- Bootstrap Form Helpers -->
		<script src="http://bootstrapformhelpers.com/assets/js/bootstrap-formhelpers.min.js"></script>
    </head>
    <body>
        <h1>Event <%=es.getId()%> : <%=es.getTitle()%></h1>
        <p><%=es.getBody()%></p>
        <p>Total Points: <%=es.getPoints()%> </p>
        <p>Type of Event: <%=es.getType()%> </p>
        <p>Event Trainer: <%=es.getTrainer()%></p>
        <p>Start time: <%=es.getStart()%> </p>
        <p>End time: <%=es.getStop()%> </p>
        
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
                <%
            if (lg != null && lg.isLoggedIn()) {
        %>
        <input type="hidden" name="userNameBox" id="userNameBox" value="<%=lg.getUsername()%>">
        <% } %>
<div id="tablediv">
<table cellspacing="0" id="commentsTable"> 
    <tr> 
        <th scope="col">Author</th> 
        <th scope="col">Body</th> 
        <th scope="col">Date</th>       
    </tr> 
</table>
    </div>

<textarea rows="4" cols="50" name="commentBox" id="commentBox" maxlength="145" ></textarea><br />
<input type="button" value="Submit Comment" name="submit" class="comment_button"/>
    <div id="flash"></div>
<ol id="update" class="timeline">
</ol>
        <%
            }
                    
        %>
    </body>
</html>
