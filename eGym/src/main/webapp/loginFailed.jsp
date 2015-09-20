<%-- 
    Document   : loginFailed
    Created on : 20-Sep-2015, 15:50:30
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in failed</title>
    </head>
    <body>
        <h1>Log in failed</h1>
        <h3>The username and password you entered are not valid. <a href="<%=response.encodeURL("login.jsp")%>">Click here</a> to try again.</h3>
    </body>
</html>
