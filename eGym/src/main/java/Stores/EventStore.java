/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Stores;

import java.sql.Timestamp;

/**
 *
 * @author Yogi
 */
public class EventStore {
    private int id;
    private String title;
    private int points;
    private String body;
    private String trainer;
    private String type;
    private Timestamp start;
    private Timestamp stop;

    
    public EventStore(){}
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the points
     */
    public int getPoints() {
        return points;
    }

    /**
     * @param points the points to set
     */
    public void setPoints(int points) {
        this.points = points;
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
     * @return the trainer
     */
    public String getTrainer() {
        return trainer;
    }

    /**
     * @param trainer the trainer to set
     */
    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the start
     */
    public Timestamp getStart() {
        return start;
    }

    /**
     * @param start the start to set
     */
    public void setStart(Timestamp start) {
        this.start = start;
    }

    /**
     * @return the stop
     */
    public Timestamp getStop() {
        return stop;
    }

    /**
     * @param stop the stop to set
     */
    public void setStop(Timestamp stop) {
        this.stop = stop;
    }
}
