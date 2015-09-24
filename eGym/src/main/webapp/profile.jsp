<%-- 
    Document   : profile
    Created on : 24-Sep-2015, 13:30:50
    Author     : Tom
--%>
<%@page import="Stores.LoggedIn"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Stores.UserStore"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            String subInst = profile.getInstitution();
            String degree = profile.getDegree();
            Timestamp dob = profile.getDob();
            String yos = profile.getYos();
            int status = profile.getUserStatus();
            int onlineTheory = profile.getOnlineTheory();
            int action = profile.getAction();
            int project = profile.getProject();
            int challenge = profile.getChallenge();
            int total = profile.getTotal();
    %>
        <title><%=firstName%> <%=lastName%>'s Profile</title>
    </head>
    <body>
        <h1><%=firstName%> <%=lastName%></h1>
        <h4><%=username%></h4>
        
        <table border="1px">
            <tr>
                <th>Online Theory</th>
                <th>Action</th>
                <th>Project</th>
                <th>Challenge</th>
                <th>Total</th>
            </tr>
            <tr>
                <td><%=onlineTheory%></td>
                <td><%=action%></td>
                <td><%=project%></td>
                <td><%=challenge%></td>
                <td><%=total%></td>
            </tr>
        </table>
    </body>
    <%
        } else {
    %>
        <title>Profile not found</title>
    </head>
    <body>
        <h1>User does not exist!</h1>
    </body>
    <%
        }
    %>
</html>
