<%-- 
    Document   : login
    Created on : 20-Sep-2015, 14:30:53
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>

    <div class="container"> 
        
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="ForgotPassword.jsp">Forgot password?</a></div>
                    </div>     
        <form class="form-signin" role="form" method="POST" action="login">
            <h2 class="form-signin-heading"></h2>
            <label for="username" class="sr-only">Username</label>
            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="username" required autofocus>                                        
                                    </div>
            <label for="password" class="sr-only">Password</label>
            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password" required>
                                    </div>
           <div style="margin-top:10px" class="form-group">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
           </div>
            
             <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="/eGym/register" >
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>  
            
        </form>
            </div>
        </div>
    </div>
    </br>
<jsp:include page="footer.jsp"></jsp:include>
