/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Stores.CarouselImageStore;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dreads
 */
public class CarouselImageModel 
{
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    static final String JDBC_DRIVER ="com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://46.101.32.81:3306/EGAlexander";
    String user = "root";
    String password = "teameight";
    
    public CarouselImageModel()
    {
        
    }
    
    public LinkedList<CarouselImageStore> getImages()
    {
        try
        {
            LinkedList<CarouselImageStore> carouselList = new LinkedList<>();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, password);
            CallableStatement cs = null;
            cs = this.con.prepareCall("{call get_home_pictures()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                int Id = rs.getInt("idPhotoCarousel");
                String carouselLink = rs.getString("PhotoLink");
                String captionLink = rs.getString("CaptionLink");
                String captionText = rs.getString("CaptionText");
                CarouselImageStore carouselInfo = new CarouselImageStore(Id, carouselLink, captionLink, captionText);
                carouselList.add(carouselInfo);
            }
            cs.close();
            con.close();
            return carouselList;
        } 
        catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) 
        {
            Logger.getLogger(CarouselImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
