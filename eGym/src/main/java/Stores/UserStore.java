/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Stores;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Timestamp;

/**
 *
 * @author Yogi
 */
public class UserStore {
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
    private int OnlineTheory = 0;
    private int Challenge = 0;
    private int Action = 0;
    private int Project = 0;
    private int Virtual = 0;
    private int Total = 0;
    private int userStatusID;
    private String status;
    private String showPoints;
    
    public UserStore(final String Username, final String Firstname, final String Lastname, final String MatriculationNo, final String Email, final String PhoneNo, final char Gender, final String Country, final String Institution, final String SubInstitution, 
            final String Degree, final Timestamp dob, final String yos, final int userStatusID, final String status, final int OnlineTheory, final int Challenge, final int Action, final int Project, final int Virtual, final int Total, String showPoints)
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
         this.userStatusID = userStatusID;
         this.status = status;
         this.OnlineTheory = OnlineTheory;
         this.Action = Action;
         this.Project = Project;
         this.Challenge = Challenge;
         this.Virtual = Virtual;
         this.Total = Total;
         this.showPoints = showPoints;
    }
    
    public UserStore(String username, String firstName, String lastName, int onlineTheory, int challenge, int action, int project, int virtual, int total, String institution,
            String subInstitution) {
        this.Username = username;
        this.Firstname = firstName;
        this.Lastname = lastName;
        this.OnlineTheory = onlineTheory;
        this.Challenge = challenge;
        this.Action = action;
        this.Project = project;
        this.Virtual = virtual;
        this.Total = total;
        this.Institution = institution;
        this.SubInstitution = subInstitution;
    }
    
    public UserStore(String Username, String Firstname, String Lastname, String MatriculationNo, String Email, String PhoneNo, char Gender, String Country,
            String Institution, String SubInstitution, String Degree, Timestamp dob, String yos, int UserStatus, String status){
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
        this.userStatusID = UserStatus;
        this.status = status;
    }
    public UserStore(String Username, String Firstname, String Lastname, String MatriculationNo, String Email, String PhoneNo, char Gender, String Country,
            String Institution, String SubInstitution, String Degree, Timestamp dob, String yos, int UserStatus){
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
        this.userStatusID = UserStatus;
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
    public int getUserStatusID()
    {
        return this.userStatusID;
    }
    /**
     * 
     * @param userStatusID the UserStatus to set
     */
    public void setUserStatusID(int userStatusID)
    {
        this.userStatusID = userStatusID;
    }

    /**
     * @return the OnlineTheory
     */
    public int getOnlineTheory() {
        return OnlineTheory;
    }

    /**
     * @param OnlineTheory the OnlineTheory to set
     */
    public void setOnlineTheory(int OnlineTheory) {
        this.OnlineTheory = OnlineTheory;
    }

    /**
     * @return the Challenge
     */
    public int getChallenge() {
        return Challenge;
    }

    /**
     * @param Challenge the Challenge to set
     */
    public void setChallenge(int Challenge) {
        this.Challenge = Challenge;
    }

    /**
     * @return the Action
     */
    public int getAction() {
        return Action;
    }

    /**
     * @param Action the Action to set
     */
    public void setAction(int Action) {
        this.Action = Action;
    }

    /**
     * @return the Project
     */
    public int getProject() {
        return Project;
    }

    /**
     * @param Project the Project to set
     */
    public void setProject(int Project) {
        this.Project = Project;
    }

    /**
     * @return the Total
     */
    public int getTotal() {
        return Total;
    }

    /**
     * @param Total the Total to set
     */
    public void setTotal(int Total) {
        this.Total = Total;
    }

    /**
     * @return the showPoints
     */
    public String getShowPoints() {
        return showPoints;
    }

    /**
     * @param showPoints the showPoints to set
     */
    public void setShowPoints(String showPoints) {
        this.showPoints = showPoints;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the Virtual
     */
    public int getVirtual() {
        return Virtual;
    }

    /**
     * @param Virtual the Virtual to set
     */
    public void setVirtual(int Virtual) {
        this.Virtual = Virtual;
    }
}
