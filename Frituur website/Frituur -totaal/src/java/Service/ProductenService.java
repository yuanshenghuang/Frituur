/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Dal.NewHibernateUtil;
import Dal.TblCartitem;
import Dal.TblProduct;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author huang
 */
public class ProductenService 
{
    public static ArrayList<TblProduct> selectAll()
    {
        ArrayList<TblProduct> list = new ArrayList<TblProduct>();
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query q = session.createQuery("from TblProduct");
            list = (ArrayList<TblProduct>)q.list();
            
        }
        catch(RuntimeException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            session.flush();
            session.close();
        }
        return list;
        
    }
    
    public static ArrayList<TblProduct> selectAllProduct(int id)
    {
        ArrayList<TblProduct> list = new ArrayList<TblProduct>();
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query q = session.createQuery("from TblProduct where tblCategory.id ="+id);
            list = (ArrayList<TblProduct>)q.list();
            
        }
        catch(RuntimeException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            session.flush();
            session.close();
        }
        return list;
        
    }
    
    public static TblProduct selectOne(int id)
    {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Query q = null;
        try
        {
            session.beginTransaction();
            q = session.createQuery("from TblProduct where id ="+id);
        }
        catch(Exception ex)
        {
           ex.getMessage();
        }     
                
        return (TblProduct)q.uniqueResult();
    }
    
    
   
    
    public static void add(TblProduct product)
    {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            session.save(product);
            session.getTransaction().commit();
        }
        catch(RuntimeException ex)
        {
            ex.getMessage();
        }
        finally
        {
            session.flush();
            session.close();
        }
    }
    
    public static void update(TblProduct product)
    {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        try
        {
        session.beginTransaction();
        session.update(product);
        session.getTransaction().commit();
        }
        catch(RuntimeException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            session.flush();
            session.close();
        }
    }
    
     public static void delete(TblProduct bw)
      {
           Session session = NewHibernateUtil.getSessionFactory().openSession();
           
            try 
            {
                session.beginTransaction();
                bw = (TblProduct)session.load(TblProduct.class, bw.getId());
                session.delete(bw);
                session.getTransaction().commit();
            } 
            catch (RuntimeException e)
            {            
                e.printStackTrace();
            } 
            finally 
            {
                session.flush();
                session.close();
            }     
      }
   
}
