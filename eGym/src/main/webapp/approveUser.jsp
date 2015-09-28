<%-- 
    Document   : approveUser
    Created on : 19-Sep-2015, 18:32:56
    Author     : Dreads
--%>

<%@page import="Stores.LoggedIn"%>
<%@page import="Stores.UserStore"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
    <link href="css/style.css" rel="stylesheet" />  
    <div id="services" class="pad-section">
    <%
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg != null && lg.isLoggedIn()) {
            if (lg.getRole() == 2 || lg.getRole() == 3) { // logged in user is an editor or an admin
        %>
                <h1>Approve Users</h1>
                <div class="col-md-12">
                <table class="table" >
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
                        <th>Approve</th>
                    </tr>
                    <%

                    LinkedList<UserStore> usersList = (LinkedList<UserStore>) request.getAttribute("UserList");
                    Iterator<UserStore> iterator = usersList.iterator();
                    while (iterator.hasNext()) 
                    {
                        UserStore um = (UserStore) iterator.next();

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
                        <td><form action="getUserDetails"><button type="submit" class="btn btn-default" name="getUsername" value=<%=Username%>>Edit User Details</button></form></td>
                        <td><form action="UserApproved"><button type="submit" class="btn btn-default" name="username" value=<%=Username%>>Approve</button></form></td>
                    </tr>
                    <%
                    }
                %>
                </table>
                </div>
       <%
           }else{
       %>
                <h1>You are not authorised to view this page. Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a> as an administrator.</h1>
<%
            }
        }else{
%>
            <h1>Please <a href="<%=response.encodeURL("login.jsp")%>">sign in</a></h1>
<%
        }
        %>
        </div>
<jsp:include page="footer.jsp"></jsp:include>