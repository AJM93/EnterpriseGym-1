<%-- 
    Document   : NewsStory
    Created on : Sep 18, 2015, 11:50:34 AM
    Author     : Yogi
--%>

<%@page import="Stores.LoggedIn"%>
<%@page import="Models.NewsCommentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<jsp:include page="header.jsp"></jsp:include>
     
<%
    NewsModel nm = (NewsModel) request.getAttribute("NewsStory");
    LinkedList<NewsCommentModel> newsCommentList = (LinkedList<NewsCommentModel>) request.getAttribute("NewsComments");
%>
<title><%=nm.getNewsTitle()%></title>



<div id="services" class="pad-section">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><%=nm.getNewsTitle()%></h3>
            </div>
            <div class="panel-body">
                <%=nm.getNewsBody()%>
            </div>
        </div>

    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
        if (lg.getRole() == 2 || lg.getRole() == 3) {%>
    <a href="/eGym/EditNews/<%=nm.getNewsId()%>">Edit this</a>
    <%}
    }%>
    </div>
</div>
    <jsp:include page="footer.jsp"></jsp:include>

   