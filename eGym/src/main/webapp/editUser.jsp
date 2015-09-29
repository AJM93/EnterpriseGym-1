<%-- 
    Document   : editUser
    Created on : 20-Sep-2015, 17:08:02
    Author     : Dreads
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Stores.UserStatusTypes"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.UserStore"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%
    UserStore us = (UserStore) request.getAttribute("UserStore");
    
    LinkedList<UserStatusTypes> statusType = (LinkedList<UserStatusTypes>) request.getAttribute("StatusTypes");
    Iterator<UserStatusTypes> statusTypeIterator = statusType.iterator();
    String Username = us.getUsername();
    request.setAttribute("OriginalUsername", Username);
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
<div id="services" class="pad-section">
    <div class="container">    
        <h1>Edit User</h1>

        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
            <div class="bs-example">
                <form method="POST"  action="editUserDetails">
                    <div class="form-group">
                        <label for="inputUsername">Username</label>
                        <input type="text" class="form-control" id="inputUsername" name="username" readonly value="<%=Username%>" placeholder="Enter Username">
                    </div>
                    <div class="form-group">
                        <label for="inputFirstname">First Name</label>
                        <input type="text" class="form-control" id="inputFirstname" name="firstname" value="<%=Firstname%>" placeholder="Enter First Name">
                    </div>
                    <div class="form-group">
                        <label for="inputLastname">Last Name</label>
                        <input type="text" class="form-control" id="inputLastname"  name="lastname" value="<%=Lastname%>" placeholder="Enter Last Name">
                    </div>
                    <div class="form-group">
                        <label for="inputMatriculationNumber">Matriculation Number</label>
                        <input type="text" class="form-control" id="inputMatriculationNumber" name="matricNO" value="<%=MatriculationNo%>" placeholder="Enter Matric No">
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">Email</label>
                        <input type="email" class="form-control" id="inputEmail" name="email" value="<%=Email%>" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="inputPhoneNumber">Phone Number</label>
                        <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNO" value="<%=PhoneNo%>" placeholder="Phone number">
                    </div>
                    <div class="form-group">
                        <label for="inputGender">Gender</label>
                        <input type="text" class="form-control" id="inputGender" name="gender" value="<%=Gender%>" placeholder="Gender">
                    </div>
                    <div class="form-group">
                        <label for="inputCountry">Country</label>
                        <input type="text" class="form-control" id="inputCountry" name="country" value="<%=Country%>" placeholder="Country of Origin">
                    </div>
                    <div class="form-group">
                        <label for="inputInstitution">Institution</label>
                        <input type="text" class="form-control" id="inputInstitution" name="institution" value="<%=Institution%>" placeholder="Institution">
                    </div>
                    <div class="form-group">
                        <label for="inputSubInstitution">Sub Institution</label>
                        <input type="text" class="form-control" id="inputSubInstitution" name="subInstitution" value="<%=SubInstitution%>" placeholder="Sub Institution">
                    </div>
                    <div class="form-group">
                        <label for="inputDegree">Degree</label>
                        <input type="text" class="form-control" id="inputDegree" name="degree" value="<%=Degree%>" placeholder="Degree">
                    </div>
                    <div class="form-group">
                        <label for="inputDOB">Date Of Birth</label>
                        <input type="text" class="form-control" id="inputDOB" name="dob" value="<%=dob%>" placeholder="YYYY-MM-DD" >
                    </div>
                    <div class="form-group">
                        <label for="inputYOS">Year Of Study</label>
                        <input type="text" class="form-control" id="inputYOS" name="yos" value="<%=yos%>" placeholder="Year of Study">
                    </div>
                    <div class="from-group">
                        <label for="inputUserStatus">User Account Status</label>
                        <select name="userStatus" required>
                            <%
                                while(statusTypeIterator.hasNext())
                                {
                                    UserStatusTypes st = statusTypeIterator.next();
                                    if(st.getId() == UserStatus){
                            %>
                            <option selected value="<%=st.getId()%>"><%=st.getType()%></option>
                            <%
                                }else{
                            %>
                            <option value="<%=st.getId()%>"><%=st.getType()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <button type="submit" name="originalName" value="<%=Username%>" class="btn btn-default">Submit Details</button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>