/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Stores.UserStore;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import Stores.*;
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
    private int OnlineTheory = 0;
    private int Challenge = 0;
    private int Action = 0;
    private int Project = 0;
    private int Total = 0;
    private int UserStatus;
    
     Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";
    
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
    
    public UserModel(){}
    
    
    public UserStore getUserDetails(String pUsername) throws ClassNotFoundException, InstantiationException, SQLException, IllegalAccessException{
        UserStore rt = null;
        
         Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call get_user_details(?)}");   //(?,?)}"
            cs.setString(1,pUsername);
            ResultSet rs = cs.executeQuery();
            rs.next();
            String Username = rs.getString("Username");
            String Firstname = rs.getString("FirstName");
            String Lastname = rs.getString("LastName");
            String Matric = rs.getString("MatriculationNumber");
            String Email = rs.getString("Email");
            String PhoneNo = rs.getString("PhoneNumber");
            String Country = rs.getString("Country");
            String Gender = rs.getString("Gender");
            String Inst = rs.getString("Institution");
            String sInst = rs.getString("Sub_Institution");
            String degree = rs.getString("Degree");
            Timestamp dob = rs.getTimestamp("DOB");
            String yos = rs.getString("YearOfStudy");
            int Userstatus = rs.getInt("UserStatus_idUserStatus");
            int ot = rs.getInt("Online_Theory");
            int ch = rs.getInt("Challenge");
            int ac = rs.getInt("Action");
            int pr = rs.getInt("Project");
            int tt = rs.getInt("Total");
            rt = new UserStore(Username, Firstname, Lastname, Matric, Email, PhoneNo, Gender.charAt(0), Country, Inst, sInst, degree, dob, yos, Userstatus, ot, ch, ac, pr, tt);
            
        return rt;
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
}
