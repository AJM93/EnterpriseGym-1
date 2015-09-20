<%-- 
    Document   : userLogged
    Created on : 20-Sep-2015, 15:47:25
    Author     : Tom
--%>

<%@page import="Stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in successful</title>
    </head>
    <body>
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null && lg.isLoggedIn()) {
        %>
        <h2>Welcome, <%=lg.getUsername()%>!</h2>
        <h2><a href="/eGym/logout">Click here</a> to sign out</h2>
        <%
            } else {
        %>
        <h2><a href="<%=response.encodeURL("login.jsp")%>">Click here</a> to sign in</h2>
        <%
            }
        %>
    </body>
</html>
