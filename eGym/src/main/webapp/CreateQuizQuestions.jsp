<%-- 
    Document   : CreateQuizQuestions
    Created on : 25-Sep-2015, 11:52:17
    Author     : Dreads
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String quizName = (String) request.getAttribute("QuizName");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Quiz Questions and Answers</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Bootstrap -->
        <script src="http://bootstrapformhelpers.com/assets/js/bootstrap.min.js"></script>
        <!-- Bootstrap Form Helpers -->
        <script src="http://bootstrapformhelpers.com/assets/js/bootstrap-formhelpers.min.js"></script>
    </head>
    <body>
        <h1>Please enter 10 questions for the new test.</h1>
        <div id="QuizRegister" class="bs-example">
            <form method="POST"  action="CreateQuizQuestions">
                <div class="form-group" id="Q1">
                    <h1>Question 1:</h1>
                    <label for="QuizName1">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName1" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody1">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody1" name="QuestionBody1" placeholder="Please enter a question">
                    <label for="inputAnswer1Q1">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q1" name="Q1A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q1">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q1" name="Q1A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q1">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q1" name="Q1A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q1">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q1" name="Q1A4" placeholder="Please a possible answer">
                    <label for="inputCorrect1">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect1" name="Correct1" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                    
                <div class="form-group" id="Q2">
                    <h1>Question 2:</h1>
                    <label for="QuizName2">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName2" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody2">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody2" name="QuestionBody2" placeholder="Please enter a question">
                    <label for="inputAnswer1Q2">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q2" name="Q2A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q2">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q2" name="Q2A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q2">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q2" name="Q2A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q2">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q2" name="Q2A4" placeholder="Please a possible answer">
                    <label for="inputCorrect2">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect2" name="Correct2" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                    
                <div class="form-group"  id="Q3">
                    <h1>Question 3:</h1>
                    <label for="QuizName3">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName3" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody3">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody3" name="QuestionBody3" placeholder="Please enter a question">
                    <label for="inputAnswer1Q3">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q3" name="Q3A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q3">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q3" name="Q3A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q3">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q3" name="Q3A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q3">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q3" name="Q3A4" placeholder="Please a possible answer">
                    <label for="inputCorrect3">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect3" name="Correct3" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                    
                <div class="form-group" id="Q4">
                    <h1>Question 4:</h1>
                    <label for="QuizName4">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName4" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody4">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody4" name="QuestionBody4" placeholder="Please enter a question">
                    <label for="inputAnswer1Q4">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q4" name="Q4A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q4">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q4" name="Q4A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q4">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q4" name="Q4A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q4">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q4" name="Q4A4" placeholder="Please a possible answer">
                    <label for="inputCorrect4">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect4" name="Correct4" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                    
                <div class="form-group" id="Q5">
                    <h1>Question 5:</h1>
                    <label for="QuizName5">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName5" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody5">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody5" name="QuestionBody5" placeholder="Please enter a question">
                    <label for="inputAnswer1Q5">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q5" name="Q5A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q5">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q5" name="Q5A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q5">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q5" name="Q5A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q5">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q5" name="Q5A4" placeholder="Please a possible answer">
                    <label for="inputCorrect5">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect5" name="Correct5" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>    
                    
                <div class="form-group" id="Q6">
                    <h1>Question 6:</h1>
                    <label for="QuizName6">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName6" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody6">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody6" name="QuestionBody6" placeholder="Please enter a question">
                    <label for="inputAnswer1Q6">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q6" name="Q6A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q6">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q6" name="Q6A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q6">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q6" name="Q6A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q6">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q6" name="Q6A4" placeholder="Please a possible answer">
                    <label for="inputCorrect6">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect6" name="Correct6" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                    
                <div class="form-group" id="Q7">
                    <h1>Question 7:</h1>
                    <label for="QuizName7">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName7" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody7">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody7" name="QuestionBody7" placeholder="Please enter a question">
                    <label for="inputAnswer1Q7">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q7" name="Q7A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q7">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q7" name="Q7A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q7">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q7" name="Q7A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q7">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q7" name="Q7A4" placeholder="Please a possible answer">
                    <label for="inputCorrect7">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect7" name="Correct7" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                    
                <div class="form-group" id="Q8">
                    <h1>Question 8:</h1>
                    <label for="QuizName8">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName8" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody8">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody8" name="QuestionBody8" placeholder="Please enter a question">
                    <label for="inputAnswer1Q8">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q8" name="Q8A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q8">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q8" name="Q8A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q8">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q8" name="Q8A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q8">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q8" name="Q8A4" placeholder="Please a possible answer">
                    <label for="inputCorrect8">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect8" name="Correct8" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                
                <div class="form-group" id="Q9">
                    <h1>Question 9:</h1>
                    <label for="QuizName9">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName9" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody9">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody9" name="QuestionBody9" placeholder="Please enter a question">
                    <label for="inputAnswer1Q9">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q9" name="Q9A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q9">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q9" name="Q9A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q9">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q9" name="Q9A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q9">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q9" name="Q9A4" placeholder="Please a possible answer">
                    <label for="inputCorrect9">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect9" name="Correct9" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                
                <div class="form-group" id="Q10">
                    <h1>Question 10:</h1>
                    <label for="QuizName10">Quiz Name</label>
                    <input type="text" class="form-control" id="QuizName10" name="QuizName" value="<%=quizName%>">
                    <label for="inputQuestionBody10">Question</label>
                    <input type="text" class="form-control" id="inputQuestionBody10" name="QuestionBody10" placeholder="Please enter a question">
                    <label for="inputAnswer1Q10">Answer 1</label>
                    <input type="text" class="form-control" id="inputAnswer1Q10" name="Q10A1" placeholder="Please a possible answer">
                    <label for="inputAnswer2Q10">Answer 2</label>
                    <input type="text" class="form-control" id="inputAnswer2Q10" name="Q10A2" placeholder="Please a possible answer">
                    <label for="inputAnswer3Q10">Answer 3</label>
                    <input type="text" class="form-control" id="inputAnswer3Q10" name="Q10A3" placeholder="Please a possible answer">
                    <label for="inputAnswer4Q10">Answer 4</label>
                    <input type="text" class="form-control" id="inputAnswer4Q10" name="Q10A4" placeholder="Please a possible answer">
                    <label for="inputCorrect10">Correct Answer</label>
                    <input type="text" class="form-control" id="inputCorrect10" name="Correct10" placeholder="Please enter the NUMBER of the CORRECT ANSWER">
                </div>
                <button type="submit" value="CreateQuizQuestions" class="btn btn-default">Create Quiz Questions</button>    
            </form>
        </div>
    </body>
</html>
