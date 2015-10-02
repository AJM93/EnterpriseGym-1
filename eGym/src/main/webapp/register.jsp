<%-- 
    Document   : register
    Created on : 18-Sep-2015, 15:48:38
    Author     : Dreads
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Stores.UserStatusTypes"%>
<jsp:include page="header.jsp"></jsp:include>
<script>
    function check() {
        document.getElementById("inputCountry2").value = document.getElementById("inputCountry").value;
    }
</script>

<!-- Bootstrap Form Helpers -->
<link href="http://bootstrapformhelpers.com/assets/css/bootstrap-formhelpers.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="assets/js/jquery.validate.js"></script> 
<script src="http://bootstrapformhelpers.com/assets/js/bootstrap-formhelpers.min.js"></script>

<%
    LinkedList<UserStatusTypes> statusType = (LinkedList<UserStatusTypes>) request.getAttribute("StatusTypes");
    Iterator<UserStatusTypes> statusTypeIterator = statusType.iterator();
%>
<div id="services" class="pad-section">
    <div class="container">    
        <h1>Register</h1>

        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
        <div class="bs-example">
            <form method="POST"  action="RegisterNewUser">
                <div class="form-group">
                    <label for="inputUsername">Username</label>
                    <input type="text" class="form-control" id="inputUsername" name="username" required placeholder="Enter Username">
                </div>
                <div class="form-group">
                    <label for="inputPassword1">Password</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" required placeholder="Enter Password">
                </div>
                <div class="form-group">
                    <label for="inputFirstname">First Name</label>
                    <input type="text" class="form-control" id="inputFirstname" name="firstname" required placeholder="Enter First Name">
                </div>
                <div class="form-group">
                    <label for="inputLastname">Last Name</label>
                    <input type="text" class="form-control" id="inputLastname"  name="lastname" required placeholder="Enter Last Name">
                </div>
                <div class="form-group">
                    <label for="inputMatriculationNumber">Matriculation Number</label>
                    <input type="text" class="form-control" id="inputMatriculationNumber" name="matricNO" required placeholder="Enter Matric No">
                </div>
                <div class="form-group">
                    <label for="inputEmail">Email</label>
                    <input type="email" class="form-control" id="inputEmail" name="email" required placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber">Phone Number</label>
                    <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNO" required placeholder="Phone number">
                </div>
                <div class="form-group">
                    <label for="inputGender">Gender</label>
                    <input type="text" class="form-control" id="inputGender" name="gender" required placeholder="Gender">
                </div>
                <div class="form-group">
                    <label for="inputCountry">Country</label>
                    <div id="inputCountry" data-input-name="country" class="bfh-selectbox bfh-countries" data-flags="true" onChange="check();">
                        <input form='form1' type="hidden" >
                        <a class="bfh-selectbox-toggle" role="button" data-toggle="bfh-selectbox" href="#">
                            <span class="bfh-selectbox-option input-medium"></span>
                            <b class="caret"></b>
                        </a>
                        <div class="bfh-selectbox-options countries">
                            <div role="listbox">
                                <ul role="option">
                                </ul>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" class="form-control" id="inputCountry2" required name="country2">
                </div>
                <div class="form-group">
                    <label>Institution</label>
                    <input type="text" class="form-control" list="institution" name="institution" required>
                    <datalist id="institution">
                      <option value="University of Dundee">
                      <option value="University of Abertay">
                      <option value="Dundee College">
                      <option value="Other">
                      <option value="N/A">
                    </datalist>
                </div>
                <div class="form-group">
                    <label>Sub Institution</label>
                    <input type="text" class="form-control" list="subInstitution" name="subInstitution" required>
                    <datalist id="subInstitution">
                      <option value="Art & Design (DJCAD)">
                      <option value="Dentistry">
                      <option value="Education & Social Work">
                      <option value="Humanities">
                      <option value="Life Sciences">
                      <option value="Medicine">
                      <option value="Nursing & Midwifery">
                      <option value="Physcial Sciences & Engineering">
                      <option value="Social Sciences">
                      <option value="Other">
                      <option value="N/A">
                    </datalist>
                </div>
                <div class="form-group">
                    <label for="inputDegree">Degree</label>
                    <input type="text" class="form-control" id="inputDegree" name="degree" required placeholder="Degree">
                </div> 
                <div class="form-group" >
                    <label for="DOBdate">Date Of Birth</label>
                    <input type="date" class="form-control" required name="DOBdate" style="color: black;">
                </div>
                <div class="form-group">
                    <label>Year of Study</label>
                    <input type="number" class="form-control" list="yos" name="yos" min="0" max="4" required>
                    <datalist id="yos">
                      <option value="1">
                      <option value="2">
                      <option value="3">
                      <option value="4">
                      <option value="0">
                    </datalist>
                </div>
                <div class="from-group">
                        <label for="inputAccountType">Users Status</label>
                        <select name="inputAccountType" style="color: black;" required>
                            <%
                                while(statusTypeIterator.hasNext())
                                {
                                    UserStatusTypes st = statusTypeIterator.next();
                                    
                            %>
                            <option style="color: black;" value="<%=st.getId()%>"><%=st.getType()%></option>
                            <%
                                    
                                }
                            %>
                        </select>
                    </div>
                <button type="submit" value="Register" class="btn btn-default" onload="check();" >Register</button>
            </form>
        </div>
        </div>
    </div>
</div>
</body>
</html>