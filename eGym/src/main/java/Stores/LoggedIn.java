/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Stores;

/**
 *
 * @author Tom
 */
public class LoggedIn {
    private boolean loggedIn = false;
    private String username;
    private int role;
    
    public LoggedIn (boolean newLoggedIn, String newUsername, int role) {
        this.loggedIn = newLoggedIn;
        this.username = newUsername;
        this.role = role;
    }

    /**
     * @return the loggedIn
     */
    public boolean isLoggedIn() {
        return loggedIn;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @return the role
     */
    public int getRole() {
        return role;
    }
}
