<%-- 
    Document   : editNews
    Created on : Sep 23, 2015, 3:15:25 PM
    Author     : Yogi
--%>
<%@page import="Stores.LoggedIn"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
    <div id="services" class="pad-section">
        <div class="container" style="border-bottom: 1px solid#888; padding: 15px;">
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            
            NewsModel nm = (NewsModel) request.getAttribute("NewsStory");
            int newsID = nm.getNewsId();
            String newsTitle = nm.getNewsTitle();
            String newsBody = nm.getNewsBody();
            
            if (lg != null && lg.isLoggedIn()) {
                if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
        %>
        <title>Edit news story #<%=newsID%></title>
        <script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
        <div class="row">
            <div class="col-md-12">
                <h2>Edit news story</h2>
                <form role="form" method="POST" action=<%="" + newsID%>>
                    <textarea name="title" class="form-control" rows="2" required autofocus><%=newsTitle%></textarea>
                    <br>
                    <textarea name="body" class="form-control" required><%=newsBody%></textarea>
                    <script>
                        CKEDITOR.replace('body');
                    </script>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Edit</button>
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