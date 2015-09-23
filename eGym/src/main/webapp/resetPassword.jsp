<%-- 
    Document   : resetPassword
    Created on : 21-Sep-2015, 16:37:38
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset password</title>
    </head>
    <body>
         <%
            String Username = (String)request.getAttribute("PasswordUsername");
            %>
        <form class="form-signin" role="form" method="POST" action="ResetPassword">
            <h2 class="form-signin-heading">Please enter new password</h2>
            <label for="username" class="sr-only">Username</label>
            <input type="text" name="username" class="form-control" placeholder="Username" readonly value="<%=Username%>">
            <label for="password" class="sr-only">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Reset password</button>
        </form>
    </body>
</html>
