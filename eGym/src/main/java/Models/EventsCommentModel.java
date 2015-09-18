/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Timestamp;

/**
 *
 * @author Paris
 */
public class EventsCommentModel {
    
private int eventsCommentID;
    private int eventsID;
    private String author;
    private String body;
    private Timestamp datePosted;
    
    public EventsCommentModel(int eventsCommentID, int eventsID, String author, String body, Timestamp datePosted)
    {
        this.eventsCommentID = eventsCommentID;
        this.eventsID = eventsID;
        this.author = author;
        this.body = body;
        this.datePosted = datePosted;
    }

    /**
     * @return the eventsCommentID
     */
    public int getEventsCommentID() {
        return eventsCommentID;
    }

    /**
     * @param eventsCommentID the eventsCommentID to set
     */
    public void setEventsCommentID(int eventsCommentID) {
        this.eventsCommentID = eventsCommentID;
    }

    /**
     * @return the eventsID
     */
    public int getEventsID() {
        return eventsID;
    }

    /**
     * @param eventsID the eventsID to set
     */
    public void setEventsID(int eventsID) {
        this.eventsID = eventsID;
    }

    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * @return the body
     */
    public String getBody() {
        return body;
    }

    /**
     * @param body the body to set
     */
    public void setBody(String body) {
        this.body = body;
    }

    /**
     * @return the datePosted
     */
    public Timestamp getDatePosted() {
        return datePosted;
    }

    /**
     * @param datePosted the datePosted to set
     */
    public void setDatePosted(Timestamp datePosted) {
        this.datePosted = datePosted;
    }
}

