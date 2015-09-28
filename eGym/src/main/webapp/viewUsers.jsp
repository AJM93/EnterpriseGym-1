<%-- 
    Document   : viewUsers
    Created on : 21-Sep-2015, 20:01:33
    Author     : Dreads
--%>
<%@page import="Stores.UserStore"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<link href="css/style.css" rel="stylesheet" />  
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
                <th>Delete User's Account</th>
            </tr>
            <%
            
            LinkedList<UserStore> usersList = (LinkedList<UserStore>) request.getAttribute("UserList");
            Iterator<UserStore> iterator = usersList.iterator();
            while (iterator.hasNext()) 
            {
                UserStore us = (UserStore) iterator.next();
                
                String Username = us.getUsername();
                String Firstname = us.getFirstname();
                String Lastname = us.getLastname();
                String MatriculationNo = us.getMatriculationNo();
                String Email = us.getEmail();
                String PhoneNo = us.getPhoneNo();
                char Gender = us.getGender();
                String Country = us.getCountry();
                String Institution = us.getInstitution();
                String SubInstitution = us.getSubInstitution();
                String Degree = us.getDegree();
                Timestamp dob = us.getDob();
                String yos = us.getYos();
                int UserStatus = us.getUserStatus();
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
                <td><form action="DeleteUserAccount" method="POST"><button type="submit" name="getDeletedUser" value=<%=Username%>>Delete Account</button></form></td>
            </tr>
            <%
            }
        %>
        </table>
    </body>
</html>

