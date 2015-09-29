<%-- 
    Document   : index
    Created on : 27-Sep-2015, 18:11:02
    Author     : danielmackay
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="Stores.*"%>
<%@page import="Models.NewsCommentModel"%>
<%@page import="Models.EventsCommentModel" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Models.NewsModel"%>
<%@page import="Models.EventsModel"%>

<jsp:include page="header.jsp"></jsp:include>

<%
    java.util.LinkedList<NewsModel> nm = (java.util.LinkedList<NewsModel>) request.getAttribute("HomeNews");
    java.util.LinkedList<EventsModel> em = (java.util.LinkedList<EventsModel>) request.getAttribute("HomeEvents");
     LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
     UserStore profile = null;
            if (lg != null && lg.isLoggedIn()) {
             profile = (UserStore) request.getAttribute("UserProfile");
             String username = profile.getUsername();
            String firstName = profile.getFirstname();
            String lastName = profile.getLastname();
            String matric = profile.getMatriculationNo();
            String email = profile.getEmail();
            String phoneNo = profile.getPhoneNo();
            char gender = profile.getGender();
            String country = profile.getCountry();
            String inst = profile.getInstitution();
            String subInst = profile.getSubInstitution();
            String degree = profile.getDegree();
            Timestamp dob = profile.getDob();
            String yos = profile.getYos();
            int status = profile.getUserStatus();
            String anon = profile.getAnonymous();
            
            int onlineTheory = profile.getOnlineTheory();
            int action = profile.getAction();
            int project = profile.getProject();
            int challenge = profile.getChallenge();
            int total = profile.getTotal();
            
            float silverMedalPoints = 70;
            float goldMedalPoints = silverMedalPoints * 2f;
            
            float[] points = {onlineTheory, action, project, challenge};
            java.util.Arrays.sort(points);

            int highestPercent = Math.round((points[3] / goldMedalPoints) * 100);
            int nextHighestPercent = Math.round((points[2] / goldMedalPoints) * 100);
            
            int onlinePercent = Math.round((onlineTheory / silverMedalPoints) * 100);
            int actionPercent = Math.round((action / silverMedalPoints) * 100);
            int projectPercent = Math.round((project / silverMedalPoints) * 100);
            int challengePercent = Math.round((challenge / silverMedalPoints) * 100);
            
%>
<!-- /first section -->

<div id="profile" class="pad-section">
    <div class="container">
        <div id="node-51">
       <h2>Progress to Gold Medal (2 Silver Medals)</h2>
        <div class="progress">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=highestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=highestPercent%>%; min-width: 2em">
              <%=highestPercent%>%
            </div>
            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<%=nextHighestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=nextHighestPercent%>%; min-width: 2em">
              <%=nextHighestPercent%>%
            </div>
        </div>
            <h2>Progress to Silver Medal (70 pts)</h2>
        <h3>Online Theory - <%=onlineTheory%> pts</h3>
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="<%=onlineTheory%>" aria-valuemin="0" aria-valuemax="<%=silverMedalPoints%>" style="width:<%=onlinePercent%>%; min-width: 2em">
              <%=onlinePercent%>%
            </div>
        </div>

        <h3>Action - <%=action%> pts</h3>
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="<%=action%>" aria-valuemin="0" aria-valuemax="<%=silverMedalPoints%>" style="width:<%=actionPercent%>%; min-width: 2em">
              <%=actionPercent%>%
            </div>
        </div>

        <h3>Project - <%=project%> pts</h3>
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="<%=project%>" aria-valuemin="0" aria-valuemax="<%=silverMedalPoints%>" style="width:<%=projectPercent%>%; min-width: 2em">
              <%=projectPercent%>%
            </div>
        </div>

        <h3>Challenge - <%=challenge%> pts</h3>
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="<%=challenge%>" aria-valuemin="0" aria-valuemax="<%=silverMedalPoints%>" style="width:<%=challengePercent%>%; min-width: 2em">
              <%=challengePercent%>%
            </div>
        </div>

        <h2>Total: <%=total%> pts</h2>
        </div>
    </div>
</div>
<%}%>

<%//if (lg != null && lg.isLoggedIn()) {} else {%>
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
<%//}%>
<!-- second section - About -->
<div id="about" class="pad-section">
    <div class="container">
        <h2 id="newsFeed">News Feed</h2>
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
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><%=nm.get(1).getNewsTitle()%></a>
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
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><%=nm.get(2).getNewsTitle()%></a>
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
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour"><%=nm.get(3).getNewsTitle()%></a>
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
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive"><%=nm.get(4).getNewsTitle()%></a>
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

<div id="information" class="pad-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Calendar of Events</h2>
                    </div>
                    <img src="images/CalanderImage.PNG" class="img-rounded" alt="Cinque Terre" width="auto" height="auto">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Event Feed</h2>
                    </div>
                    <div class="panel-body lead">
                        <!--<h2 id="eventFeed">Event Feed</h2>-->
                        <div class="panel-group" id="accordionE" role="tablist" aria-multiselectable="true">
                            <div id="divOneE" class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOneE">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordionE" href="#collapseOneE" aria-expanded="false" aria-controls="collapseOneE"><%=em.get(0).getEventTitle()%></a>
                                    </h4>
                                </div>
                                <div id="collapseOneE" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOneE">
                                    <p>Trainer: <%=em.get(0).getEventTrainer()%></p>    
                                    <div class="panel-body">
                                        <%=nm.get(0).getNewsBody()%>
                                    </div>

                                </div>
                            </div>
                            <div id="divTwoE" class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwoE">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordionE" href="#collapseTwoE" aria-expanded="false" aria-controls="collapseTwoE"><%=em.get(1).getEventTitle()%></a>
                                    </h4>
                                </div>
                                <div id="collapseTwoE" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwoE">
                                    <p>Trainer: <%=em.get(1).getEventTrainer()%></p>    
                                    <div class="panel-body">
                                        <%=em.get(1).getEventBody()%>
                                    </div>
                                </div>
                            </div>
                            <div id="divThreeE" class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThreeE">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordionE" href="#collapseThreeE" aria-expanded="false" aria-controls="collapseThreeE"><%=em.get(2).getEventTitle()%></a>
                                    </h4>
                                </div>
                                <div id="collapseThreeE" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreeE">
                                    <p>Trainer: <%=em.get(2).getEventTrainer()%></p>    
                                    <div class="panel-body">
                                        <%=em.get(2).getEventBody()%>
                                    </div>
                                </div>
                            </div>
                            <div id="divFourE" class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFourE">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordionE" href="#collapseFourE" aria-expanded="false" aria-controls="collapseFourE"><%=em.get(3).getEventTitle()%></a>
                                    </h4>
                                </div>
                                <div id="collapseFourE" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFourE">
                                    <p>Trainer: <%=em.get(3).getEventTrainer()%></p>    
                                    <div class="panel-body">
                                        <%=em.get(3).getEventBody()%>
                                    </div>
                                </div>
                            </div>
                            <div id="divFiveE" class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFiveE">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordionE" href="#collapseFiveE" aria-expanded="false" aria-controls="collapseFiveE"><%=em.get(4).getEventTitle()%></a>
                                    </h4>
                                </div>
                                <div id="collapseFiveE" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFiveE">
                                    <p>Trainer: <%=em.get(4).getEventTrainer()%></p>    
                                    <div class="panel-body">
                                        <%=em.get(4).getEventBody()%>
                                    </div>
                                </div>
                            </div>                  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /fourth section -->
<!-- attach JavaScripts -->
<jsp:include page="footer.jsp"></jsp:include>