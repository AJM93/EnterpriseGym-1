<%-- 
    Document   : createNews
    Created on : 23-Sep-2015, 10:51:53
    Author     : Tom
--%>

<%@page import="Stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<script src="//cdn.ckeditor.com/4.5.3/full-all/ckeditor.js"></script>
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null && lg.isLoggedIn()) {
                if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
        %>
        
        <form role="form" method="POST" action="createNews">
            <h2>Create a news item</h2>
            <label for="title">Title</label>
            <input type="text" name="title" placeholder="Title" required autofocus>
            <label for="Body">Body</label>
            <textarea name="body" placeholder="Enter content here" required autofocus></textarea>
            <script>
            CKEDITOR.replace( 'body' );
             </script>
            <br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>
        </form>
        <%
                } else {
        %>
                    <h2>You are not authorised to view this page. Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a> as an administrator.</h2>
        <%
                }
            } else {
        %>
                <h2>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h2>
        <%
            }
        %>
 <jsp:include page="footer.jsp"></jsp:include>