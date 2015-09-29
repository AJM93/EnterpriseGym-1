<%-- 
    Document   : profile
    Created on : 24-Sep-2015, 13:30:50
    Author     : Tom
--%>
<%@page import="Stores.LoggedIn"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Stores.UserStore"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
    <link href="css/style.css" rel="stylesheet" />
    <div class="container">
    <%
        UserStore profile = (UserStore) request.getAttribute("Profile");
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

        if (profile != null) { // user exists
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
    
        <h1><%=firstName%> <%=lastName%></h1>
        <h4><%=username%></h4>
        <% if (gender == 'M') {
            %>Male<%
        } else if (gender == 'F') {
                %>Female
        <% } %>

        <h3><%=inst%></h3>
        <h4><%=subInst%></h4>

        <%
            if (lg != null && lg.getUsername().equals(username)) {
        %>

        <br>

        <h2>Progress to Gold Medal (2 Silver Medals)</h2>
        <div class="progress">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=highestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=highestPercent%>%; min-width: 2em">
              <%=highestPercent%>%
            </div>
            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<%=nextHighestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=nextHighestPercent%>%; min-width: 2em">
              <%=nextHighestPercent%>%
            </div>
        </div>

        <br>

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

        <form class="form-inline" role="form" method="POST" action="/eGym/userAnonymous">
            <div class="form-group" style="border-top: 1px solid#888; padding: 15px;">
            <%
                if(anon.equals("Y")){
                    %><label><input type="checkbox" name="anonymous" checked> Show points in leaderboard?</label><%
                } else {
                    %><label><input type="checkbox" name="anonymous"> Show points in leaderboard?</label><%
                }
            %>
                <input type="text" name="username" value="<%=username%>" hidden>
                <button type="submit" class="btn btn-default">Update</button>
                <span class="help-block">Choose if your name will be shown on the points leaderboard</span>
            </div>
        </form>
    <% } %>
<%
    } else {
%>
    <h1>User does not exist!</h1>
<%
    }
%>
    </div>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
