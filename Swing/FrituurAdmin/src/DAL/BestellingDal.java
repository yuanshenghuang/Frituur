/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import BO.Bestelling;
import BO.Category;
import static DAL.CategoryDal.getConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author huang
 */
public class BestellingDal
{
    public static Connection getConnection() throws SQLException
    {
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/frietendb","root","usbw");
    }
    
    public static ArrayList<Bestelling> selectAll()
    {
        ArrayList<Bestelling> list = new ArrayList<Bestelling>();
        
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("select * from tbl_bestelling");
          
            ResultSet rs = ps.executeQuery();
            
            
            Bestelling f; 
            
            while(rs.next())
            {
                f = new Bestelling();
                f.setId(rs.getInt("id"));
                f.setKlantnaam(rs.getString("klantnaam"));
                f.setAfhaaltijd(rs.getString("afhaaltijd"));
                f.setLijst(rs.getString("lijst"));
                f.setTotaal(rs.getDouble("totaal"));
               
                
                list.add(f);
            }
            
        }
        catch (SQLException ex)
        {
           System.out.println(ex.getMessage());
        }
           
        return list;
    }
    
    
    public static void deleteAll()
    {
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("delete from tbl_bestelling");           
           
            ps.executeUpdate();
            
        } 
        catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        }
        
        
    }
    
}
