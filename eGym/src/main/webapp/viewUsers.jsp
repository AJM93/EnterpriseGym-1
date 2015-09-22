<%-- 
    Document   : viewUsers
    Created on : 21-Sep-2015, 20:01:33
    Author     : Dreads
--%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Users</h1>
        <table width='700px' border='1px'>
            <tr>
                <th>Username</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Matriculation No</th>
                <th>Email</th>
                <th>Phone No</th>
                <th>Gender</th>
                <th>Country</th>
                <th>Institution</th>
                <th>Sub Institution</th>
                <th>Degree</th>
                <th>D.O.B</th>
                <th>Y.O.S</th>
                <th>User Status</th>
                <th>Edit User Details</th>
                <th>Reset User's Password</th>
            </tr>
            <%
            
            LinkedList<UserModel> usersList = (LinkedList<UserModel>) request.getAttribute("UserList");
            Iterator<UserModel> iterator;
            iterator = usersList.iterator();
            while (iterator.hasNext()) 
            {
                UserModel um = (UserModel) iterator.next();
                
                String Username = um.getUsername();
                String Firstname = um.getFirstname();
                String Lastname = um.getLastname();
                String MatriculationNo = um.getMatriculationNo();
                String Email = um.getEmail();
                String PhoneNo = um.getPhoneNo();
                char Gender = um.getGender();
                String Country = um.getCountry();
                String Institution = um.getInstitution();
                String SubInstitution = um.getSubInstitution();
                String Degree = um.getDegree();
                Timestamp dob = um.getDob();
                String yos = um.getYos();
                int UserStatus = um.getUserStatus();
        %>
            <tr>
                <td><%=Username%></td>
                <td><%=Firstname%></td>
                <td><%=Lastname%></td>
                <td><%=MatriculationNo%></td>
                <td><%=Email%></td>
                <td><%=PhoneNo%></td>
                <td><%=Gender%></td>
                <td><%=Country%></td>
                <td><%=Institution%></td>
                <td><%=SubInstitution%></td>
                <td><%=Degree%></td>
                <td><%=dob%></td>
                <td><%=yos%></td>
                <td><%=UserStatus%></td>
                <td><form action="getUserDetails"><button type="submit" name="getUsername" value=<%=Username%>>Edit User Details</button></form></td>
                <td><form action="resetUserPassword" method="POST"><button type="submit" name="getPasswordUsername" value=<%=Username%>>Reset Password</button></form></td>
            </tr>
            <%
            }
        %>
        </table>
    </body>
</html>

