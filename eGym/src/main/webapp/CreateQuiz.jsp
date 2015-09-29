<%-- 
    Document   : CreateQuiz
    Created on : 25-Sep-2015, 11:24:18
    Author     : Dreads
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

<div id="services" class="pad-section">
    <div class="container">   
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
        <h1>Please enter the details of the Quiz that you would like to create</h1>
        <div id="QuizRegister" class="bs-example">
            <form method="POST"  action="CreateNewQuiz">
                <div class="form-group">
                    <label for="inputQuizName">Quiz Name</label>
                    <input type="text" class="form-control" id="inputQuizName" name="QuizName" required autofocus placeholder="Enter Quiz Name">
                </div>
                <div class="form-group">
                    <label for="inputLearningMaterials">Learning Materials</label>
                    <input type="text" class="form-control" id="inputLearningMaterials" name="LearningMaterials" required placeholder="Enter Learning Materials">
                </div>
                <button type="submit" value="CreateNewQuiz" class="btn btn-default">Create Quiz</button>
            </form>
        </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
