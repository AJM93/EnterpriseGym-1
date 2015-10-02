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
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Yogi
 */
public class UserModel {
    
    Connection con = null;
    Statement st = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";
    
    public UserModel() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, password);
    }
    
    public UserStore getUserDetails(String pUsername) throws ClassNotFoundException, InstantiationException, SQLException, IllegalAccessException{
        UserStore userDetails = null;
        
        try (CallableStatement cs = this.con.prepareCall("{call get_user_details(?)}")) {
            cs.setString(1, pUsername);
            ResultSet rs = cs.executeQuery();
            
            if (rs.next()) { // found a user
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
                int userStatusID = rs.getInt("UserStatus_idUserStatus");
                String status = rs.getString("Status");
                int ot = rs.getInt("Online_Theory");
                int ch = rs.getInt("Challenge");
                int ac = rs.getInt("Action");
                int pr = rs.getInt("Project");
                int vl = rs.getInt("Virtual");
                int tt = rs.getInt("Total");
                String showPoints = rs.getString("IncludeInLeaderboard");
                userDetails = new UserStore(Username, Firstname, Lastname, Matric, Email, PhoneNo, Gender.charAt(0), Country, Inst, sInst, degree, dob, yos, userStatusID, status, ot, ch, ac, pr, vl, tt, showPoints);
            }
            
            cs.close();
        }
        
        con.close();        
        return userDetails;
    }
    
    public LinkedList<UserStore> getAllUsers() throws SQLException, InstantiationException, IllegalAccessException {
        LinkedList<UserStore> userList = null;
        
        try (CallableStatement cs = this.con.prepareCall("{call get_users}")) {
            ResultSet rs = cs.executeQuery();
            userList = new LinkedList<>();
            while (rs.next()) {
                String Username = rs.getString("Username");
                String Firstname = rs.getString("Firstname");
                String Lastname = rs.getString("Lastname");
                String MatriculationNo = rs.getString("MatriculationNumber");
                String Email = rs.getString("Email");
                String PhoneNo = rs.getString("PhoneNumber");
                String genderS = rs.getString("Gender");
                char Gender = genderS.charAt(0);
                String Country = rs.getString("Country");
                String Institution = rs.getString("Institution");
                String SubInstitution = rs.getString("Sub_Institution");
                String Degree = rs.getString("Degree");
                Timestamp dob = rs.getTimestamp("DOB");
                String yos = rs.getString("YearOfStudy");
                int UserStatus = rs.getInt("UserStatus_idUserStatus");
                String status = rs.getString("Type");
                UserStore current = new UserStore(Username, Firstname, Lastname, MatriculationNo, Email, PhoneNo, Gender, Country, Institution, SubInstitution, Degree, dob, yos, UserStatus, status);
                userList.add(current);
            }
            
            cs.close();
        }
        
        con.close();
        return userList;
    }
    
    public LinkedList<UserStore> getUnapprovedUsers() throws InstantiationException, SQLException, IllegalAccessException {
        LinkedList<UserStore> userList = null;
        
        try (CallableStatement cs = this.con.prepareCall("{call unapproved_users}")) {
            ResultSet rs = cs.executeQuery();
            userList = new LinkedList<>();
            while (rs.next())
            {
                String Username = rs.getString("Username");
                String Firstname = rs.getString("Firstname");
                String Lastname = rs.getString("Lastname");
                String MatriculationNo = rs.getString("MatriculationNumber");
                String Email = rs.getString("Email");
                String PhoneNo = rs.getString("PhoneNumber");
                String genderS = rs.getString("Gender");
                char Gender = genderS.charAt(0);
                String Country = rs.getString("Country");
                String Institution = rs.getString("Institution");
                String SubInstitution = rs.getString("Sub_Institution");
                String Degree = rs.getString("Degree");
                Timestamp dob = rs.getTimestamp("DOB");
                String yos = rs.getString("YearOfStudy");
                int UserStatus = rs.getInt("UserStatus_idUserStatus");
                String status = rs.getString("Type");
                UserStore current = new UserStore(Username, Firstname, Lastname, MatriculationNo, Email, PhoneNo, Gender, Country, Institution, SubInstitution, Degree, dob, yos, UserStatus, status);
                userList.add(current);
            }
            
            cs.close();
        }
        
        con.close();
        return userList;
    }
    
    public LinkedList<UserStore> getLeaderboard(int numRecords, boolean anonymise) throws SQLException {
        LinkedList<UserStore> leaderboard = null;
        
        try {
            CallableStatement cs = this.con.prepareCall("{call points_leaderboard(?)}");
            cs.setInt(1, numRecords);
            ResultSet rs = cs.executeQuery();
            leaderboard = new LinkedList<>();
            
            while (rs.next()) {
                String username, firstName, lastName;
                
                if (anonymise && rs.getString("IncludeInLeaderboard").equals("N")){
                    username = "Anonymous";
                    firstName = "Anonymous";
                    lastName = "";
                } else {
                    username = rs.getString("Users_Username");
                    firstName = rs.getString("FirstName");
                    lastName = rs.getString("LastName");
                }
                
                int onlineTheory = rs.getInt("Online_Theory");
                int challenge = rs.getInt("Challenge");
                int action = rs.getInt("Action");
                int project = rs.getInt("Project");
                int virtual = rs.getInt("Virtual");
                int total = rs.getInt("Total");
                String institution = rs.getString("Institution");
                String subInstitution = rs.getString("Sub_Institution");
                UserStore lbUser = new UserStore(username, firstName, lastName, onlineTheory, challenge, action, project, virtual, total, institution, subInstitution);
                leaderboard.add(lbUser);
            }
            
            cs.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        con.close();
        return leaderboard;
    }
    public void deleteUsersAccount(final String Username)
    {
        try
        {
            CallableStatement cs = this.con.prepareCall("{call delete_users_account(?)}");
            cs.setString(1, Username);
            cs.executeQuery();
            cs.close();
            con.close();
        }catch (SQLException ex) {
            Logger.getLogger(UserModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void setIncludeInLeaderboard (String username, String newInclude) {
        try {
            CallableStatement cs = this.con.prepareCall("{call set_include_in_leaderboard(?,?)}");
            cs.setString(1, username);
            cs.setString(2, newInclude);
            cs.executeQuery();
            
            cs.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}