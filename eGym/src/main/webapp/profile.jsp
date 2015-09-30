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
            String dob = new java.text.SimpleDateFormat("dd MMM yyyy").format(profile.getDob());
            String yos = profile.getYos();
            String status = profile.getStatus();
            String showPoints = profile.getShowPoints();
            
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
            
            if (lg != null) {
                if (lg.getUsername().equals(username)) {
                    // logged in and viewing own profile
        %>
        <div class="container" style="border-bottom: 1px solid#888; padding: 15px;">
            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><%=firstName%> <%=lastName%></h1>
                            <h4>(<%=username%>)</h4>
                            <h3><%=email%></h3>

                            <% if (gender == 'M') {
                                %><h5>Male</h5><%
                            } else if (gender == 'F') {
                                %><h5>Female</h5><%
                            } %>

                            <h3><%=country%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-6">
                            <h3><%=inst%></h3>
                            <h4><%=subInst%></h4>
                            <h3><%=status%></h3>
                            <h4><%=degree%></h4>
                            <h3>Year of Study: <%=yos%></h3>
                        </div>
                        <div class="col-md-6">
                            <h3>Matric No: <%=matric%></h3>
                            <h3>Phone No: <%=phoneNo%></h3>
                            <h3>DoB: <%=dob%></h3>
                             <form action="/eGym/getUserDetails" method="POST">
                                    <button type="submit" class="btn btn-default" name="getUsername" value=<%=username%>>Edit User</button>
                                    </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Progress to Gold Medal (2 Silver Medals)</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="progress">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=highestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=highestPercent%>%; min-width: 2em">
                          <%=highestPercent%>%
                        </div>
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<%=nextHighestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=nextHighestPercent%>%; min-width: 2em">
                          <%=nextHighestPercent%>%
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <h2>Progress to Silver Medal (70 pts)</h2>
                </div>
            </div>
                
            <div class="row">
                <div class="col-md-6">
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
                </div>
                        
                <div class="col-md-6">
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
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <h2>Total: <%=total%> pts</h2>

                    <form class="form-inline" role="form" method="POST" action="/eGym/userAnonymous">
                        <div class="form-group" style="border-top: 1px solid#888; padding: 15px;">
                        <%
                            if(showPoints.equals("Y")){
                                %><label><input type="checkbox" name="anonymous" checked> Show points in leaderboard?</label><%
                            } else {
                                %><label><input type="checkbox" name="anonymous"> Show points on the leaderboard?</label><%
                            }
                        %>
                            <input type="text" name="username" value="<%=username%>" hidden>
                            <button type="submit" class="btn btn-default">Update</button>
                        </div>
                            
                        <div class="alert alert-info" style="padding: 15px;">
                            Tick to show your name on the <a href="/eGym/overallLeaderboard">points leaderboard</a>
                        </div>
                            
                    </form>
                            
                </div>
            </div>
        </div>
            <% } else {
                    // logged in but not viewing own profile
            %>
                <div class="container" style="border-bottom: 1px solid#888; padding: 15px;">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1><%=firstName%> <%=lastName%></h1>
                                    <h4>(<%=username%>)</h4>
                                    <% if (lg.getRole() == 3 || lg.getRole() == 4) {
                                        %><h4><a href="mailto:<%=email%>"><%=email%></a></h4><%
                                    }%>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3><%=inst%></h3>
                                    <h4><%=subInst%></h4>
                                </div>
                                <div class="col-md-6">
                                    <h3><%=status%></h3>
                                    <h4><%=degree%></h4>
                                    <h3>Year of Study: <%=yos%></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <%
            if (showPoints.equals("Y")) { %>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Progress to Gold Medal (2 Silver Medals)</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=highestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=highestPercent%>%; min-width: 2em">
                                  <%=highestPercent%>%
                                </div>
                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<%=nextHighestPercent%>" aria-valuemin="0" aria-valuemax="<%=goldMedalPoints%>" style="width:<%=nextHighestPercent%>%; min-width: 2em">
                                  <%=nextHighestPercent%>%
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <h2>Progress to Silver Medal (70 pts)</h2>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
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
                        </div>

                        <div class="col-md-6">
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
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <h2>Total: <%=total%> pts</h2>
                        </div>
                    </div>
                </div>
            <%    }
        }
    } else {
        // not logged in
    %>
        <div class="container" style="border-bottom: 1px solid#888; padding: 15px;">
            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><%=firstName%> <%=lastName%></h1>
                            <h4>(<%=username%>)</h4>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-6">
                            <h3><%=inst%></h3>
                            <h4><%=subInst%></h4>
                        </div>
                        <div class="col-md-6">
                            <h3><%=status%></h3>
                            <h4><%=degree%></h4>
                            <h3>Year of Study: <%=yos%></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%
    }
%>
    
<%
    } else {
    %>
        <div class="container"><h1>User does not exist!</h1></div>
<%
    }
%>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
