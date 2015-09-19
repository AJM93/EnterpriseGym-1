/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Timestamp;

/**
 *
 * @author Yogi
 */
public class UserModel {
    private String Username = null;
    private String Firstname = null;
    private String Lastname = null;
    private String MatriculationNo = null;
    private String Email = null;
    private String PhoneNo = null;
    private char Gender;
    private String Country = null;
    private String Institution = null;
    private String SubInstitution = null;
    private String Degree = null;
    private Timestamp dob = null;
    private String yos = null;
    private int UserStatus;
    
    public UserModel(final String Username, final String Firstname, final String Lastname, final String MatriculationNo, final String Email, final String PhoneNo, final char Gender, final String Country, final String Institution, final String SubInstitution, final String Degree, final Timestamp dob, final String yos, final int UserStatus)
    {
         this.Username = Username;
         this.Firstname = Firstname;
         this.Lastname = Lastname;
         this.MatriculationNo = MatriculationNo;
         this.Email = Email;
         this.PhoneNo = PhoneNo;
         this.Gender = Gender;
         this.Country = Country;
         this.Institution = Institution;
         this.SubInstitution = SubInstitution;
         this.Degree = Degree;
         this.dob = dob;
         this.yos = yos;
         this.UserStatus = UserStatus;
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
    /**
     * @return the Email 
     */
    public String getEmail()
    {
       return this.Email;
    }
    /**
     * @param Email the Email to set
     */
    public void setEmail(String Email)
    {
        this.Email = Email;
    }
    /**
     * @return PhoneNo
     */
    public String getPhoneNo()
    {
        return this.PhoneNo;
    }
    /**
     * 
     * @param PhoneNo the PhoneNo to set
     */
    public void setPhoneNo(String PhoneNo)
    {
        this.PhoneNo = PhoneNo;
    }
    /**
     * 
     * @return the Gender 
     */
    public char getGender()
    {
        return this.Gender;
    }
    /**
     * 
     * @param Gender the Gender to set
     */
    public void setGender(char Gender)
    {
        this.Gender = Gender;
    }
    /**
     * 
     * @return the Country
     */
    public String getCountry()
    {
        return this.Country;
    }
    /**
     * 
     * @param Country the Country to set
     */
    public void setCountry(String Country)
    {
        this.Country = Country;
    }
    /**
     * 
     * @return the Institution
     */
    public String getInstitution()
    {
        return this.Institution;
    }
    /**
     * 
     * @param Institution 
     */
    public void setInstitution(String Institution)
    {
        this.Institution = Institution;
    }
    /**
     * 
     * @return the SubIstitution
     */
    public String getSubInstitution()
    {
        return this.SubInstitution;
    }
    /**
     * 
     * @param SubInstitution the SubInstitution to be set 
     */
    public void setSubInstitution(String SubInstitution)
    {
        this.SubInstitution = SubInstitution;
    }
    /**
     * 
     * @return the Degree
     */
    public String getDegree()
    {
        return this.Degree;
    }
    /**
     * 
     * @param Degree the Degree to set
     */
    public void setDegree(String Degree)
    {
        this.Degree = Degree;
    }
    /**
     * 
     * @return the dob
     */
    public Timestamp getDob()
    {
        return this.dob;
    }
    /**
     * 
     * @param dob the dob to set
     */
    public void setDob(Timestamp dob)
    {
        this.dob = dob;
    }
    /**
     * 
     * @return the yos
     */
    public String getYos()
    {
        return this.yos;
    }
    /**
     * 
     * @param yos the yos to set
     */
    public void setYos(String yos)
    {
        this.yos = yos;
    }
    /**
     * 
     * @return UserStatus
     */
    public int getUserStatus()
    {
        return this.UserStatus;
    }
    /**
     * 
     * @param UserStatus the UserStatus to set
     */
    public void setUserStatus(int UserStatus)
    {
        this.UserStatus = UserStatus;
    }
}
