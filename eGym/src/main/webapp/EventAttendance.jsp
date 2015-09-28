<%-- 
    Document   : EventAttendance
    Created on : Sep 21, 2015, 10:33:27 AM
    Author     : Yogi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Stores.BasicUser"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        LinkedList<BasicUser> attendees = (LinkedList<BasicUser>) request.getAttribute("Users");
        Integer activityid = (Integer) request.getAttribute("ActivityID");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <script>
      function myFunction(x) {
   $.get(x, function(data, status){
        alert("Data: " + data + "\nStatus: " + status);
    });
}      
        </script>
        
        <h1></h1>
        <%
        for (BasicUser t : attendees){
        %>
        <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><%=t.getUsername()%></h3>
  </div>
  <div class="panel-body">
    <%=t.getFirstName()+" "+t.getLastName()+" : "+t.getEmail()%><br>
    <button onclick="myFunction('<%="/eGym/RegisterAttendee/"+t.getUsername()+"/"+activityid%>')">Register Attendee</button>
  </div>
</div>
        <%}%>
    </body>
</html>
