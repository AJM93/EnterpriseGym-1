<%-- 
    Document   : index
    Created on : 27-Sep-2015, 18:11:02
    Author     : danielmackay
--%>

 %@page import="Stores.LoggedIn"%>
<%@page import="Models.NewsCommentModel"%>
<%@page import="Models.EventsCommentModel" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<%@page import="Models.EventsModel"%>

<jsp:include page="header.jsp"></jsp:include>
      <link href="css/style.css" rel="stylesheet" />
<%
    java.util.LinkedList<NewsModel> nm = (java.util.LinkedList<NewsModel>) request.getAttribute("HomeNews");
    java.util.LinkedList<EventsModel> em = (java.util.LinkedList<EventsModel>) request.getAttribute("HomeEvents");
%>
<!-- /first section -->
  <div id="services" class="pad-section">
    <div class="container">
      <h1>
        About the Enterprise Gym
      </h1>
      <div id="node-51">
        <div>
          <p>
            <strong>What is The Enterprise Gym all about</strong>
            ? Some key words and sentences for you to set the scene:
          </p>
          <p>
            Enterprise &amp; Entrepreneurship isn't all about business.
          </p>
          <p>
            Enterprise = the application of creative ideas and innovations to practical situations.
          </p>
          <p>
            Enterprise combines creativity, ideas development and problem solving with expression, communication and practical action.
          </p>
          <p>
            An enterprising individual has a positive, flexible and adaptive disposition to change, seeing it as normal and as an opportunity rather than a
            problem.
          </p>
          <p>
            An enterprising individual has the capacity to initiate creative ideas and develop them into action in a determined manner.
          </p>
          <p>
            An enterprising individual is an effective communicator, negotiator, influencer, planner and organiser.
          </p>
          <p>
            An enterprising individual is active, confident and purposeful ? not uncertain and dependent
          </p>
          <p>
            The above is what we strive to help you achieve and become at The Enterprise Gym.
            <br/>
          </p>
          <p>
          </div>
        </div>
      </div>
    </div>
<!-- second section - About -->
    <div id="about" class="pad-section">
      <div class="container">
       <h2 id="newsFeed">News Feed</h2><span></span><h3 href="Blah...blah/allnews.jsp">All News</h3>
       <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
         <div id="divOne"class="panel panel-default">
           <div class="panel-heading" role="tab" id="headingOne">
             <h4 class="panel-title">
               <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><%=nm.get(0).getNewsTitle()%></a>
             </h4>
           </div>
           <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
             <p>User: <%=nm.get(0).getNewsUser()%></p>    
             <div class="panel-body">
               <%=nm.get(0).getNewsBody()%>
             </div>
             
           </div>
         </div>
         <div id="divTwo" class="panel panel-default">
           <div class="panel-heading" role="tab" id="headingTwo">
             <h4 class="panel-title">
               <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseOne"><%=nm.get(1).getNewsTitle()%></a>
             </h4>
           </div>
           <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
             <p>User: <%=nm.get(1).getNewsUser()%></p>    
             <div class="panel-body">
               <%=nm.get(1).getNewsBody()%>
             </div>
           </div>
         </div>
         <div id="divThree" class="panel panel-default">
           <div class="panel-heading" role="tab" id="headingThree">
             <h4 class="panel-title">
               <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseOne"><%=nm.get(2).getNewsTitle()%></a>
             </h4>
           </div>
           <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
             <p>User: <%=nm.get(2).getNewsUser()%></p>    
             <div class="panel-body">
               <%=nm.get(2).getNewsBody()%>
             </div>
           </div>
         </div>
         <div id="divFour" class="panel panel-default">
           <div class="panel-heading" role="tab" id="headingFour">
             <h4 class="panel-title">
               <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseOne"><%=nm.get(3).getNewsTitle()%></a>
             </h4>
           </div>
           <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
             <p>User: <%=nm.get(3).getNewsUser()%></p>    
             <div class="panel-body">
               <%=nm.get(3).getNewsBody()%>
             </div>
           </div>
         </div>
         <div id="divFive" class="panel panel-default">
           <div class="panel-heading" role="tab" id="headingFive">
             <h4 class="panel-title">
               <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseOne"><%=nm.get(4).getNewsTitle()%></a>
             </h4>
           </div>
           <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
             <p>User: <%=nm.get(4).getNewsUser()%></p>    
             <div class="panel-body">
               <%=nm.get(4).getNewsBody()%>
             </div>
           </div>
         </div>                  
       </div>
     </div>
   </div>
             <!-- attach JavaScripts -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp"></jsp:include>