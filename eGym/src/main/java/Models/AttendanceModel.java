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
public class AttendanceModel {
    
    private int eventID;
    private String userName;
    private String firstName;
    private String surName;
    private String email;
    private String phoneNumber;
    
    public AttendanceModel(int eventID, String userName, String firstName, String surName, String email, String phoneNumber)
    {
        this.eventID = eventID;
        this.userName = userName;
        this.firstName = firstName;
        this.surName = surName;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }
    
    public AttendanceModel(){}

    /**
     * @return the getEventID
     */
    public int getEventID() {
        return eventID;
    }

    /**
     * @param eventID the eventID to set
     */
    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the surname
     */
    public String getSurName() {
        return surName;
    }

    /**
     * @param surName the surname to set
     */
    public void setSurName(String surName) {
        this.surName = surName;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
