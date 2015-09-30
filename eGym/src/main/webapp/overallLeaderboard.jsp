<%-- 
    Document   : overallLeaderboard
    Created on : 24-Sep-2015, 11:36:12
    Author     : Tom
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Stores.UserStore"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link href="css/style.css" rel="stylesheet" />  
    <div class="pad-section">
        <div class="container">
            <h1 style="text-align: center;">Points leaderboard</h1>
        <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th style="text-align: center;">Rank</th>
                    <th>Name</th>
                    <th style="text-align: center;">Total</th>
                    <th style="text-align: center;">Online Theory</th>
                    <th style="text-align: center;">Challenge</th>
                    <th style="text-align: center;">Action</th>
                    <th style="text-align: center;">Project</th>
                    <th>Institution</th>
                    <th>Department</th>
                </tr>
            </thead>
            <tbody>
        <%
            LinkedList<UserStore> leaderboard = (LinkedList<UserStore>) request.getAttribute("leaderboard");
            Iterator<UserStore> iterator = leaderboard.iterator();
            int rankCounter = 1;
            int lastRank = 1;
            int lastPoints = 0;

            while (iterator.hasNext())
            {
                UserStore user = (UserStore) iterator.next();
                String username = user.getUsername();
                String firstName = user.getFirstname();
                String lastName = user.getLastname();
                int onlineTheory = user.getOnlineTheory();
                int challenge = user.getChallenge();
                int action = user.getAction();
                int project = user.getProject();
                int total = user.getTotal();
                String institution = user.getInstitution();
                String subInstitution = user.getSubInstitution();

        %>
                <tr>
        <%

                if (total != lastPoints) {
                    %><td style="text-align: center;"><%=rankCounter%></td><%
                    lastPoints = total;
                    lastRank = rankCounter;
                } else {
                    %><td style="text-align: center;"><%=lastRank%>=</td><% // print the same rank as the last person
                }

                rankCounter++;

                if (username.equals("Anonymous")){
                    %><td>Anonymous<%
                } else {
                    %><td><a href="/eGym/profile/<%=username%>"><%=firstName%> <%=lastName%></a><%
                }
        %>
                </td><td style="text-align: center;"><%=total%></td>
                <td style="text-align: center;"><%=onlineTheory%></td>
                <td style="text-align: center;"><%=challenge%></td>
                <td style="text-align: center;"><%=action%></td>
                <td style="text-align: center;"><%=project%></td>
                <td><%=institution%></td>
                <td><%=subInstitution%></td>
            </tr>
        <%
            }
        %>
        </tbody></table></div>
        </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>