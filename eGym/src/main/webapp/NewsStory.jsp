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
 
    
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/
libs/jquery/1.3.0/jquery.min.js">
</script>
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

alert("Comment Posted");
$('#commentTable').load(document.URL +  ' #commentTable');
$("ol#update li:first").slideDown("slow");
document.getElementById('commentBox').value='';
document.getElementById('commentBox').focus();
$("#flash").hide();
} return false;
});
});
   </script>
    
    
<%
    NewsModel nm = (NewsModel) request.getAttribute("NewsStory");
%>
<title><%=nm.getNewsTitle()%></title>
<input type="hidden" name="newsIDBox" id="newsIDBox" value="<%=nm.getNewsId()%>">


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
    </div>
</div>

            
        <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
        if (lg.getRole() == 2 || lg.getRole() == 3) {%>
    <a href="/eGym/EditNews/<%=nm.getNewsId()%>">Edit this</a><%}%>
    <input type="hidden" name="userNameBox" id="userNameBox" value="<%=lg.getUsername()%>">
    
    
    
                <table width='700px' border='1px' name="commentTable" id="commentTable">
                    <tr>
                        <th>Author</th>
                        <th>Body</th>
                        <th>Date Posted</th>
                    </tr>
                <%
                    LinkedList<NewsCommentModel> newsComments = (LinkedList<NewsCommentModel>) request.getAttribute("NewsCommentList");
                    Iterator<NewsCommentModel> iterator = newsComments.iterator();

                    while (iterator.hasNext()) 
                    {
                        NewsCommentModel comment = (NewsCommentModel) iterator.next();
                %>
                        <tr>
                            <td><%=comment.getAuthor()%></td>
                            <td><%=comment.getBody()%></td>
                            <td><%=comment.getDatePosted()%></td>
                        </tr>
                <%
                    }
                %>

                </table>
                
                <textarea rows="4" cols="50" name="commentBox" id="commentBox" maxlength="145" ></textarea><br />
<input type="button" value="Submit Comment" name="submit" class="comment_button"/>
    <div id="flash"></div>
<ol id="update" class="timeline">
</ol>
    
    <%}%>
    <jsp:include page="footer.jsp"></jsp:include>
