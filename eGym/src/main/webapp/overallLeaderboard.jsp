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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Leaderboard</title>
    </head>
    <body>
        <table border="1px">
            <tr>
                <th>Rank</th>
                <th>Name</th>
                <th>Total</th>
                <th>Online Theory</th>
                <th>Challenge</th>
                <th>Action</th>
                <th>Project</th>
                <th>Institution</th>
                <th>Department</th>
            </tr>
        <%
            LinkedList<UserStore> leaderboard = (LinkedList<UserStore>) request.getAttribute("leaderboard");
            Iterator<UserStore> iterator = leaderboard.iterator();
            int rankCounter = 0;
            while (iterator.hasNext()) 
            {
                rankCounter++;
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
                <td><%=rankCounter%></td>
                <td><%=firstName%> <%=lastName%></td>
                <td><%=total%></td>
                <td><%=onlineTheory%></td>
                <td><%=challenge%></td>
                <td><%=action%></td>
                <td><%=project%></td>
                <td><%=institution%></td>
                <td><%=subInstitution%></td>
            </tr>
        <%
            }
        %>
        </table>
    </body>
</html>
