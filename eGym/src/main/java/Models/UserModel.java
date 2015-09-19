/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Yogi
 */
public class UserModel {
    private String Username = null;
    private String Firstname = null;
    private String Lastname = null;
    private String MatriculationNo = null;
            
    
    
     public UserModel(){
         
     }

    /**
     * @return the Username
     */
    public String getUsername() {
        return Username;
    }

    /**
     * @param Username the Username to set
     */
    public void setUsername(String Username) {
        this.Username = Username;
    }

    /**
     * @return the Firstname
     */
    public String getFirstname() {
        return Firstname;
    }

    /**
     * @param Firstname the Firstname to set
     */
    public void setFirstname(String Firstname) {
        this.Firstname = Firstname;
    }

    /**
     * @return the Lastname
     */
    public String getLastname() {
        return Lastname;
    }

    /**
     * @param Lastname the Lastname to set
     */
    public void setLastname(String Lastname) {
        this.Lastname = Lastname;
    }

    /**
     * @return the MatriculationNo
     */
    public String getMatriculationNo() {
        return MatriculationNo;
    }

    /**
     * @param MatriculationNo the MatriculationNo to set
     */
    public void setMatriculationNo(String MatriculationNo) {
        this.MatriculationNo = MatriculationNo;
    }
}
