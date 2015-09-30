<%-- 
    Document   : quickRegistration
    Created on : 30-Sep-2015, 10:00:10
    Author     : Dreads
--%>

<%@page import="Stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>

    <div id="services" class="pad-section">
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
            if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
    %>
    <div class="container">    
        <h1>Register</h1>

        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
            <div class="bs-example">
                <form method="POST"  action="QuickRegisterUser">
                    <div class="form-group">
                        <label for="inputUsername">Username</label>
                        <input type="text" class="form-control" id="inputUsername" name="username" required placeholder="Enter Username">
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">Email</label>
                        <input type="email" class="form-control" id="inputEmail" name="email" required placeholder="Email">
                    </div>
                    <button type="submit" value="Register" class="btn btn-default">Register</button>
                </form>
            </div>
        </div>
    </div>
    <%
    } else {
    %>                
    <h1>You are not authorised to view this page. Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a> as an administrator.</h1>
    <%
        }
    } else {
    %>
    <h1>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h1>
    <%
        }
    %>
</div>
<jsp:include page="footer.jsp"></jsp:include>