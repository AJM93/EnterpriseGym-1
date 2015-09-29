<%-- 
    Document   : register
    Created on : 18-Sep-2015, 15:48:38
    Author     : Dreads
--%>

<jsp:include page="header.jsp"></jsp:include>
<script>
    function check() {
        document.getElementById("inputCountry2").value = document.getElementById("inputCountry").value;
    }
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- Bootstrap Form Helpers -->
<link href="http://bootstrapformhelpers.com/assets/css/bootstrap-formhelpers.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="assets/js/jquery.validate.js"></script> 
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- Bootstrap -->
<script src="http://bootstrapformhelpers.com/assets/js/bootstrap.min.js"></script>
<!-- Bootstrap Form Helpers -->
<script src="http://bootstrapformhelpers.com/assets/js/bootstrap-formhelpers.min.js"></script>


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
                            <span class="bfh-selectbox-option input-medium" data-option=""></span>
                            <b class="caret"></b>
                        </a>
                        <div class="bfh-selectbox-options countries" required>
                            <div role="listbox">
                                <ul role="option">
                                </ul>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" class="form-control" id="inputCountry2" required name="country2">
                </div>
                <div class="form-group">
                    <label for="inputInstitution">Institution</label>
                    <input type="text" class="form-control" id="inputInstitution" name="institution" required placeholder="Institution">
                </div>
                <div class="form-group">
                    <label for="inputSubInstitution">Sub Institution</label>
                    <input type="text" class="form-control" id="inputSubInstitution" name="subInstitution" required placeholder="Sub Institution">
                </div>
                <div class="form-group">
                    <label for="inputDegree">Degree</label>
                    <input type="text" class="form-control" id="inputDegree" name="degree" required placeholder="Degree">
                </div> 
                <div class="form-group" >
                    <label for="DOBdate">Date Of Birth</label>
                    <input type="date" required name="DOBdate" style="color: black;">
                    <input type="time" required name="DOBtime" style="color: black;">
                </div>
                <div class="form-group">
                    <label for="inputYOS">Year Of Study</label>
                    <input type="text" class="form-control" id="inputYOS" name="yos" required placeholder="Year of Study">
                </div>
                
                <button type="submit" value="Register" class="btn btn-default" onload="check();" >Register</button>
            </form>
        </div>
        </div>
    </div>
</div>
</body>
</html>