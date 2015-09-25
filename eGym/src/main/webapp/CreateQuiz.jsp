<%-- 
    Document   : CreateQuiz
    Created on : 25-Sep-2015, 11:24:18
    Author     : Dreads
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a new Quiz</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Bootstrap -->
        <script src="http://bootstrapformhelpers.com/assets/js/bootstrap.min.js"></script>
        <!-- Bootstrap Form Helpers -->
        <script src="http://bootstrapformhelpers.com/assets/js/bootstrap-formhelpers.min.js"></script>
    </head>
    <body>
        <h1>Please enter the details of the Quiz that you would like to create</h1>
        <div id="QuizRegister" class="bs-example">
            <form method="POST"  action="CreateNewQuiz">
                <div class="form-group">
                    <label for="inputQuizName">Quiz Name</label>
                    <input type="text" class="form-control" id="inputQuizName" name="QuizName" placeholder="Enter Quiz Name">
                </div>
                <div class="form-group">
                    <label for="inputLearningMaterials">Learning Materials</label>
                    <input type="text" class="form-control" id="inputLearningMaterials" name="LearningMaterials" placeholder="Enter Learning Materials">
                </div>
                <button type="submit" value="CreateNewQuiz" class="btn btn-default">Create Quiz</button>
            </form>
        </div>
    </body>
</html>
