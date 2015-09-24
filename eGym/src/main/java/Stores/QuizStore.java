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
public class QuizStore 
{
    private int idQuiz = 0; 
    private String Name = null;
    private int Points = 0;
    private String LearningMaterials = null;
    
    public QuizStore(final int idQuiz, final String Name, final int Points, final String LearningMaterials)
    {
        this.idQuiz = idQuiz;
        this.Name = Name;
        this.Points = Points;
        this.LearningMaterials = LearningMaterials;
    }
    
    public int getQuizId()
    {
        return this.idQuiz;
    }
    public void setQuizId(final int idQuiz)
    {
        this.idQuiz = idQuiz;
    }
    public String getName()
    {
        return this.Name;
    }
    public void setName(final String Name)
    {
        this.Name = Name;
    }
    public int getPoints()
    {
        return this.Points;
    }
    public void setPoints(final int Points)
    {
        this.Points = Points;
    }
    public String getLearningMaterials()
    {
        return this.LearningMaterials;
    }
    public void setLearningMaterials(final String LearningMaterials)
    {
        this.LearningMaterials = LearningMaterials;
    }
}
