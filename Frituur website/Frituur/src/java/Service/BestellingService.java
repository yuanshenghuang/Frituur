/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Dal.NewHibernateUtil;
import Dal.TblBestelling;
import Dal.TblProduct;
import org.hibernate.Session;

/**
 *
 * @author huang
 */
public class BestellingService 
{
    public static void add(TblBestelling bestelling)
    {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            session.save(bestelling);
            session.getTransaction().commit();
        }
        catch(RuntimeException ex)
        {
            System.out.println(ex.getMessage());
        }
        finally
        {
            session.flush();
            session.close();
        }
    }
}
