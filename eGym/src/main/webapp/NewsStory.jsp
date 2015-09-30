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
 
    
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
 <script type="text/javascript">
$(function() {

$(".comment_button").click(function() {


   
    var boxval = $("#commentBox").val();
	
    //var commentBox = 'commentBox='+ boxval;
    
    var usernameval = $("#userNameBox").val();
    
    //var userName = 'userName='+ usernameval;
    
    var newsidval = $("#newsIDBox").val();
	
	if(boxval=='')
	{
	alert("Please Enter Some Text");
	
	}
        else
{
$("#flash").show();
$("#flash").fadeIn(400).html('<img src="ajax-loader.gif" align="absmiddle"> <span class="loading">Loading Comment...</span>');

$.ajax({
type: "POST",
url: "/eGym/PostNewsComment",
data: {commentBox: boxval, userName: usernameval, newsID: newsidval},
cache: false,
success: function(html){
}
});

location.reload();
//$('#commentTable').load(document.URL +  ' #commentTable');
//$("ol#update li:first").slideDown("slow");
document.getElementById('commentBox').value='';
document.getElementById('commentBox').focus();
$("#flash").hide();
} return false;
});
});
   </script>
    
    
<%
    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
    
    NewsModel nm = (NewsModel) request.getAttribute("NewsStory");
    int newsID = nm.getNewsId();
    String newsTitle = nm.getNewsTitle();
    String newsBody = nm.getNewsBody();
    String newsAuthor = nm.getNewsUser();
    String newsDatePosted = new java.text.SimpleDateFormat("E dd MMM yyyy HH:mm:ss").format(nm.getNewsDate());
%>
<title><%=newsTitle%></title>
<input type="hidden" name="newsIDBox" id="newsIDBox" value="<%=newsID%>">


<div id="services" class="pad-section">
    <div class="container">
        
        <ol class="breadcrumb">
            <li><a href="/eGym/homePage">Home</a></li>
            <li><a href="/eGym/news">News</a></li>
            <li class="active"><a href="/eGym/news/<%=newsID%>"><%=newsTitle%></a></li>
        </ol>
        
        <div class="row">
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong><%=newsTitle%></strong></h3>
                    </div>
                    <div class="panel-body" style="color: black;">
                        <%=newsBody%>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Info</strong></h3>
                    </div>
                    <div class="panel-body" style="color: black;">
                        <p><strong>Author:</strong> <a href="/eGym/profile/<%=newsAuthor%>"><%=newsAuthor%></a></p>
                        <p><strong>Published:</strong> <%=newsDatePosted%></p>
            <%
                            if (lg != null && lg.isLoggedIn()) {
                                if (lg.getRole() == 2 || lg.getRole() == 3) {
            %>
                                    <a href="/eGym/EditNews/<%=nm.getNewsId()%>">Edit this news story</a>
            <%
                                }
                            }
            %>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-12">
                <h3>Comments</h3>
    <%
                LinkedList<NewsCommentModel> newsComments = (LinkedList<NewsCommentModel>) request.getAttribute("NewsCommentList");
                
                if (newsComments.isEmpty()) { // no comments on the news story
    %>
                    <div id="Comments">
                        <div class="panel panel-default">
                            <div class="panel-body" style="color: black;">
                                Be the first to comment on this news story!
                            </div>
                        </div>
                    </div>
    <%
                } else { // show comments on the news story
                    Iterator<NewsCommentModel> iterator = newsComments.iterator();
                    
                    while (iterator.hasNext()) {
                        NewsCommentModel comment = (NewsCommentModel) iterator.next();
                        String commentAuthor = comment.getAuthor();
                        String commentBody = comment.getBody();
                        String commentPosted = new java.text.SimpleDateFormat("E dd MMM yyyy - HH:mm:ss").format(comment.getDatePosted());
    %>
                        <div id="Comments">
                            <div class="panel panel-default">
                                <div class="panel-heading" >
                                    <a href="/eGym/profile/<%=commentAuthor%>"><%=commentAuthor%></a> (<%=commentPosted%>)
                                </div>
                                <div class="panel-body" style="color: black;">
                                    <%=commentBody%>
                                </div>
                            </div>
                        </div>
    <%
                    }
                }
    %>
            </div>
        </div>
    <%
        if (lg != null && lg.isLoggedIn()) {
    %>
            <form role="form">
                <input type="hidden" name="userNameBox" id="userNameBox" value="<%=lg.getUsername()%>">
                <div class="form-group">
                    <label for="commentBox">Comment:</label>
                    <textarea class="form-control" rows="5" name="commentBox" id="commentBox"></textarea>
                    <br />
                    <input type="button" value="Submit" name="submit" class="btn btn-default comment_button"/>
                </div>
            </form>
    <%  } else {
    %>
    <a href="/eGym/login">Sign in</a> to post a comment
    <%
        }
    %>
    </div>
</div>
    <jsp:include page="footer.jsp"></jsp:include>

   
