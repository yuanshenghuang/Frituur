/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import BO.Product;
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
public class ProductDal {
    public static Connection getConnection() throws SQLException
    {
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/frituurdb","root","usbw");
    }
    
    public static ArrayList<Product> selectAll()
    {
        ArrayList<Product> list = new ArrayList<Product>();
        
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("select * from tbl_product");
        
            ResultSet rs = ps.executeQuery();
            
            
            Product f; 
            
            while(rs.next())
            {
                f = new Product();
                f.setID(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setPrijs(rs.getDouble("prijs"));
                f.setCategoryid(rs.getInt("categoryid"));
                
                list.add(f);
            }
            
        }
        catch (SQLException ex)
        {
           System.out.println(ex.getMessage());
        }
           
        return list;
    }
    
    
    public static void add(Product f)
    {
        try
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("insert into tbl_product (name,prijs,categoryid) values(?,?,?)");
            
          
            ps.setString(1, f.getName());
            ps.setDouble(2, f.getPrijs());
            ps.setInt(3, f.getCategoryid());
            
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
            
            PreparedStatement ps = conn.prepareStatement("delete from tbl_product where id=?");
            
            ps.setInt(1, id);
            
            ps.executeUpdate();
        } 
        catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        }
        
        
    }
    
    
    public static void update(Product f)
    {
        try 
        {
            Connection conn = getConnection();
            
            PreparedStatement ps = conn.prepareStatement("update tbl_product set name=?,prijs=?,categoryid=? where id =?");
            
            ps.setString(1,f.getName());
            ps.setDouble(2, f.getPrijs());
            ps.setInt(3, f.getCategoryid());
            ps.setInt(4, f.getID());
            
            ps.executeUpdate();
        } 
        catch (SQLException ex)
        {
            System.out.println(ex.getMessage());
        }
        
        
    }
}
