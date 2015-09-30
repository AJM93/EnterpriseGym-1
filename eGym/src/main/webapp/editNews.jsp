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
        <div class="container">
            <h1>Edit News Story</h1>
        <%
            NewsModel nm = (NewsModel) request.getAttribute("NewsStory");
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null && lg.isLoggedIn()) {
                if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
        %>
        <script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
        <form role="form" method="POST" action=<%="" + nm.getNewsId()%>>
            <textarea name="title" required autofocus><%=nm.getNewsTitle()%></textarea>
            <textarea name="body" required autofocus><%=nm.getNewsBody()%></textarea>
            <script>
                CKEDITOR.replace('body');
            </script>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Edit</button>
        </form>
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