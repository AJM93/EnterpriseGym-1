/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Timestamp;

/**
 *
 * @author Tom
 */
public class NewsCommentModel {
    private int newsCommentID;
    private int newsID;
    private String author;
    private String body;
    private Timestamp datePosted;
    
 
    
    public NewsCommentModel(int newsCommentID, int newsID, String author, String body, Timestamp datePosted)
    {
        this.newsCommentID = newsCommentID;
        this.newsID = newsID;
        this.author = author;
        this.body = body;
        this.datePosted = datePosted;
    }

    /**
     * @return the newsCommentID
     */
    public int getNewsCommentID() {
        return newsCommentID;
    }

    /**
     * @param newsCommentID the newsCommentID to set
     */
    public void setNewsCommentID(int newsCommentID) {
        this.newsCommentID = newsCommentID;
    }

    /**
     * @return the newsID
     */
    public int getNewsID() {
        return newsID;
    }

    /**
     * @param newsID the newsID to set
     */
    public void setNewsID(int newsID) {
        this.newsID = newsID;
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