/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Paris
 */
public class EventsModel {
    
    private int id;
    private String title;
    private int points;
    private String body;
    private String trainer;
    
    public EventsModel(final int id, final String title, final String body, final String trainer, final int points)
    {
    this.id=id;
    this.title=title;
    this.points=points;
    this.body=body;
    this.trainer=trainer;
    }
    
    public int getEventID()
    {
        return this.id;
    }
    
    public void setEventID(final int id)
    {
        this.id=id;
    }
    
    public String getEventTitle()
    {
        return this.title;
    }
    
    public void setEventTitle(final String title)
    {
        this.title=title;
    }
    
    public String getEventBody()
    {
        return this.body;
    }
    
    public void setEventBody(final String body)
    {
        this.body=body;
    }
    
    public int getEventPoints()
    {
        return this.points;
    }
    
    public void setEventPoints(final int points)
    {
        this.points=points;
    }
    
    public String getEventTrainer()
    {
        return this.trainer;
    }
    
    public void setEventTrainer(final String trainer)
    {
        this.trainer=trainer;
    }
    
}
