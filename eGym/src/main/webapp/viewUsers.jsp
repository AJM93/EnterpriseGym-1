<%-- 
    Document   : viewUsers
    Created on : 21-Sep-2015, 20:01:33
    Author     : Dreads
--%>
<%@page import="Stores.LoggedIn"%>
<%@page import="Stores.UserStore"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
   
    <div id="services" class="pad-section">
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
            if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
    %>
    
    
    <h1>Users</h1>
        <div class="table-responsive">    
        <table class="table" >
            <thead>
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
                    <th>Edit User Type</th>
                    <th>Edit User Details</th>
                    <th>Reset User's Password</th>
                    <th>Delete User's Account</th>
                </tr>
            </thead>    
            <tbody>
            <%
                LinkedList<UserStore> usersList = (LinkedList<UserStore>) request.getAttribute("UserList");
                Iterator<UserStore> iterator = usersList.iterator();
                while (iterator.hasNext()) {
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
                    String UserStatus = us.getStatus();
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
                    <td><form action="GetUserTypes" method="POST"><button type="submit" class="btn btn-default" name="Username" value=<%=Username%>>Edit Type</button></form></td>
                    <td><form action="getUserDetails" method="POST"><button type="submit" class="btn btn-default" name="getUsername" value=<%=Username%>>Edit User</button></form></td>
                    <td><form action="resetUserPassword" method="POST"><button type="submit" class="btn btn-default" name="getPasswordUsername" value=<%=Username%>>Reset Password</button></form></td>
                    <td><form action="DeleteUserAccount" method="POST"><button type="submit" class="btn btn-default" name="getDeletedUser" value=<%=Username%>>Delete</button></form></td>
                </tr>
            
            <%
                }
            %>
            </tbody>    
        </table>
    </div>
    <%
    } else {
    %>                
    <h1>You are not authorised to view this page. Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a> as an administrator.</h1>
    <%
        }
    } else {
    %>
    <h1>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h1>
    <%
        }
    %>
</div>    
<jsp:include page="footer.jsp"></jsp:include>
