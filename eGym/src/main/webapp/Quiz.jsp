<%-- 
    Document   : Quiz
    Created on : 24-Sep-2015, 10:30:42
    Author     : Dreads
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Stores.QuestionStore"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    LinkedList<QuestionStore> questionList = (LinkedList<QuestionStore>) request.getAttribute("QuestionList");
    Iterator<QuestionStore> iterator;
    iterator = questionList.iterator();
    ArrayList<String> Questions = new ArrayList<String>();
    ArrayList<String> Answer1 = new ArrayList<String>();
    ArrayList<String> Answer2 = new ArrayList<String>();
    ArrayList<String> Answer3 = new ArrayList<String>();
    ArrayList<String> Answer4 = new ArrayList<String>();
    ArrayList<Integer> CorrectAnswer = new ArrayList<Integer>();
    while(iterator.hasNext())
    {
        QuestionStore qm = (QuestionStore) iterator.next();
        Questions.add(qm.getQuestionBody());
        Answer1.add(qm.getAnswer1());
        Answer2.add(qm.getAnswer2());
        Answer3.add(qm.getAnswer3());
        Answer4.add(qm.getAnswer4());
        CorrectAnswer.add(qm.getCorrectAnswer());
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quiz</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            var pos = 0, quiz, quiz_status, question, userAnswer, posAnswers, ans1, ans2, ans3, ans4, correct = 0;
            var questions = [];
            var answer1 = [];
            var answer2 = [];
            var answer3 = [];
            var answer4 = [];
            var correctAnswer = [];
            <%  
                for(int i=0; i<Questions.size(); i++)
                {%>
                   questions.push("<%=Questions.get(i)%>");
                   answer1.push("<%=Answer1.get(i)%>");
                   answer2.push("<%=Answer2.get(i)%>");
                   answer3.push("<%=Answer3.get(i)%>");
                   answer4.push("<%=Answer4.get(i)%>");
                   correctAnswer.push("<%=CorrectAnswer.get(i)%>");
                <%}
            %>
            function _(x)
            {
                    return document.getElementById(x);
            }
            function startQuiz()
            {
                    quiz = _("quiz");
                    quiz.innerHTML = "<h2>Click to Start!</h2>";
                    quiz.innerHTML += "<button onclick='startQuizAgain()'>Start Quiz</button>";
            }
            function renderQuestion()
            {
                    if(pos >= questions.length)
                    {
                            quiz.innerHTML = "<h2>You got " + correct + " of " + questions.length + " questions correct</h2>";
                            quiz.innerHTML += "<button onclick='startQuizAgain()'>Start Again</button>";
                            _("quiz_status").innerHTML = "Quiz Completed";
                            pos = 0;
                            correct = 0;
                            return false;
                    }
                    _("quiz_status").innerHTML = "Question " + (pos+1) + " of "+questions.length;
                    question = questions[pos];
                    ans1 = answer1[pos];
                    ans2 = answer2[pos];
                    ans3 = answer3[pos];
                    ans4 = answer4[pos];
                    quiz.innerHTML = "<h4>" + question + "</h4>";
                    quiz.innerHTML += "<input type='radio' name='posAnswers' value='1'> " + ans1 + "<br>";
                    quiz.innerHTML += "<input type='radio' name='posAnswers' value='2'> " + ans2 + "<br>";
                    quiz.innerHTML += "<input type='radio' name='posAnswers' value='3'> " + ans3 + "<br>";
                    quiz.innerHTML += "<input type='radio' name='posAnswers' value='4'> " + ans4 + "<br><br>";
                    quiz.innerHTML += "<button onclick='checkAnswer()'>Submit</button>";
            }
            function checkAnswer()
            {
                    posAnswers = document.getElementsByName("posAnswers");
                    for(var i=0; i<posAnswers.length; i++)
                    {
                            if(posAnswers[i].checked)
                            {
                                    userAnswer = posAnswers[i].value;
                            }
                    }
                    if(userAnswer === correctAnswer[pos])
                    {
                            correct++;
                    }
                    pos++;
                    renderQuestion();
            }
            function startQuizAgain()
            {
                    pos = 0;
                    renderQuestion();
            }
            window.addEventListener("load", startQuiz, false);
	</script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
            <h1>Prototyping Quiz</h1>
            <h2 id="quiz_status"></h2>
            <div id="quiz"></div>
        </div>
    </body>
</html>
