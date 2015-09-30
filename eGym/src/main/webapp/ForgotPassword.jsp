<%-- 
    Document   : ForgotPassword
    Created on : Sep 27, 2015, 6:48:09 PM
    Author     : Yogi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>


    <div class="container"> 
         <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    logo-eg.png
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Reset Password</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#"></a></div>
                    </div>     
        <form class="form-signin" role="form" method="POST" action="resetUserPassword">
            <h2 class="form-signin-heading"></h2>
            <label for="username" class="sr-only">Username</label>
            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="getPasswordUsername" value="" placeholder="username">                                        
                                    </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Reset Password</button>
        </form>
            </div>
         </div>
    </div>
 <jsp:include page="footer.jsp"></jsp:include>

<