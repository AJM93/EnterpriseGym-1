<%-- 
    Document   : resetPassword
    Created on : 21-Sep-2015, 16:37:38
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
<%
    String Username = (String) request.getAttribute("PasswordUsername");
%>
<div id="services" class="pad-section">
    <div class="container">    
        <h1>Reset Password</h1>

        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
            <div class="bs-example">        
                <form class="form-signin" role="form" method="POST" action="ResetPassword">
                    <h2 class="form-signin-heading">Please enter new password</h2>
                    <label for="username" class="sr-only">Username</label>
                    <input type="text" name="username" class="form-control" placeholder="Username" readonly value="<%=Username%>">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Reset password</button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
