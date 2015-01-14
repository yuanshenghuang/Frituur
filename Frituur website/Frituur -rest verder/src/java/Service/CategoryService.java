/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Dal.NewHibernateUtil;
import Dal.TblCategory;
import Dal.TblProduct;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author huang
 */
public class CategoryService 
{
    public static ArrayList<TblCategory> selectAll()
    {
        ArrayList<TblCategory> list = new ArrayList<TblCategory>();
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query q = session.createQuery("from TblCategory");
            list = (ArrayList<TblCategory>)q.list();
            
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
}
