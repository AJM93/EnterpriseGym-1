/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Dreads
 */
public class NewsModel 
{
    private int id;
    private String Title;
    private String Body;
    private String User;
    
    public NewsModel(final int id, final String Title, final String Body, final String User)
    {
        this.id = id;
        this.Title = Title;
        this.Body = Body;
        this.User = User;
    }
    public int getNewsId()
    {
        return this.id;
    }
    public void setNewsId(final int id)
    {
        this.id = id;
    }
    public String getNewsTitle()
    {
        return this.Title;
    }
    public void setNewsTitle(final String Title)
    {
        this.Title = Title;
    }
    public String getNewsBody()
    {
        return this.Body;
    }
    public void setNewsBody(final String Body)
    {
        this.Body = Body;
    }
    public String getNewsUser()
    {
        return this.User;
    }
    public void setNewsUser(final String User)
    {
        this.User = User;
    }
}
