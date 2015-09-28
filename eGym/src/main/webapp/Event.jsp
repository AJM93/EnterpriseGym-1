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
<script type="text/javascript" >
    $(function() {
    $(".comment_button").click(function() {

    var boxval = $("#commentBox").val();
    var dataString = 'commentBox='+ boxval;

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
    url: "Event.jsp",
    data: dataString,
    cache: false,
    success: function(html){
    $("ol#update").prepend(html);
    $("ol#update li:first").slideDown("slow");
    document.getElementById('commentBox').value='';
    document.getElementById('commentBox').focus();
    $("#flash").hide();
    }
    });
    } return false;
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
        %>
                <form action="EventSignUp" method="POST"><button type="submit" name="UsernameSignUp" value=<%=username%>>Sign Up</button></form>
                <table width='700px' border='1px'>
                    <tr>
                        <th>Author</th>
                        <th>Body</th>
                        <th>Date Posted</th>
                    </tr>
                <%
                    LinkedList<EventsCommentModel> eventComments = (LinkedList<EventsCommentModel>) request.getAttribute("EventsCommentList");
                    Iterator<EventsCommentModel> iterator = eventComments.iterator();

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

                <form method="POST" action="EventItem">
                    <br>
                    <textarea rows="4" cols="50" name="commentBox" id="commentBox" maxlength="145" >
                    </textarea><br />
                    <input type="submit" value="Submit Comment" name="submit" class="comment_button"/>
                </form>
                <div id="flash"></div>
                <ol id="update" class="timeline"></ol>
        <%
            }
                    
        %>
    </body>
</html>
