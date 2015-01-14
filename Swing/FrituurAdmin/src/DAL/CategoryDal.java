/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import BO.Category;
import BO.Product;
import static DAL.ProductDal.getConnection;

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
public class CategoryDal 
{
    public static Connection getConnection() throws SQLException
    {
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/frituurdb","root","usbw");
    }
    
    public static ArrayList<Category> selectAll()
    {
        ArrayList<Category> list = new ArrayList<Category>();
        
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("select * from tbl_category");
          
            ResultSet rs = ps.executeQuery();
            
            
            Category f; 
            
            while(rs.next())
            {
                f = new Category();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
               
                
                list.add(f);
            }
            
        }
        catch (SQLException ex)
        {
           System.out.println(ex.getMessage());
        }
           
        return list;
    }
    
   public static Category selectOne(int id)
   {
        Category f = null;
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("select * from tbl_category where id=?");
            ps.setInt(1,id);
            
            ResultSet rs = ps.executeQuery();
            
            
         
            
            while(rs.next())
            {
                f = new Category();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));            
                
                
            }
            
        }
        catch (SQLException ex)
        {
           System.out.println(ex.getMessage());
        }
        
        return f;
   }
    
    
    public static void add(Category f)
    {
        try
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("insert into tbl_category (name) values(?)");
            
          
            ps.setString(1, f.getName());
          
            ps.executeUpdate();
        } 
        catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        }
        
    }
    
    
    public static void delete(int id)
    {
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("delete from tbl_category where id=?");
            
            ps.setInt(1, id);
            
            ps.executeUpdate();
        } 
        catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        }
        
        
    }
    
    
    public static void update(Category f)
    {
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("update tbl_category set name=? where id =?");
            
            ps.setString(1,f.getName());          
            ps.setInt(2, f.getId());
            
            ps.executeUpdate();
        } 
        catch (SQLException ex)
        {
            System.out.println(ex.getMessage());
        }
        
        
    }
}
