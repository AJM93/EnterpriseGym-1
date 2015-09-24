/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Stores;

/**
 *
 * @author Dreads
 */
public class QuestionStore 
{
    private int QuestionId = 0;
    private int QuizId = 0;
    private String QuestionBody = null;
    private String Answer1 = null;
    private String Answer2 = null;
    private String Answer3 = null;
    private String Answer4 = null;
    private int CorrectAnswer = 0;
    
    public QuestionStore(final int QuestionId, final int QuizId, final String QuestionBody, final String Answer1, final String Answer2, final String Answer3, final String Answer4, final int CorrectAnswer)
    {    
        this.QuestionId = QuestionId;
        this.QuizId = QuizId;
        this.QuestionBody = QuestionBody;
        this.Answer1 = Answer1;
        this.Answer2 = Answer2;
        this.Answer3 = Answer3; 
        this.Answer4 = Answer4;
        this.CorrectAnswer = CorrectAnswer;
    }
    public int getQuestionId()
    {
        return this.QuestionId;
    }
    public void setQuestionId(final int QuestionId)
    {
        this.QuestionId = QuestionId;
    }
    public int getQuizId()
    {
        return this.QuizId;
    }
    public void setQuizId(final int QuizId)
    {
        this.QuizId = QuizId;
    }
    public String getQuestionBody()
    {
        return this.QuestionBody;
    }
    public void setQuestionBody(final String QuestionBody)
    {
        this.QuestionBody = QuestionBody;
    }
    public String getAnswer1()
    {
        return this.Answer1;
    }
    public void setAnswer1(final String Answer1)
    {
        this.Answer1 = Answer1;
    }
    public String getAnswer2()
    {
        return this.Answer2;
    }
    public void setAnswer2(final String Answer2)
    {
        this.Answer2 = Answer2;
    }
    public String getAnswer3()
    {
        return this.Answer3;
    }
    public void setAnswer3(final String Answer3)
    {
        this.Answer3 = Answer3;
    }
    public String getAnswer4()
    {
        return this.Answer4;
    }
    public void setAnswer4(final String Answer4)
    {
        this.Answer4 = Answer4;
    }
    public int getCorrectAnswer()
    {
        return this.CorrectAnswer;
    }
    public void setCorrectAnswer(final int CorrectAnswer)
    {
        this.CorrectAnswer = CorrectAnswer;
    }
}