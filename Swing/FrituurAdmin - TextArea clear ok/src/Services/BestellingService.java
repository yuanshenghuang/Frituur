/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Bestelling;
import BO.Category;
import DAL.BestellingDal;
import DAL.CategoryDal;
import java.util.ArrayList;

/**
 *
 * @author huang
 */
public class BestellingService
{
    public static ArrayList<Bestelling> selectAll()
    {
        return BestellingDal.selectAll();
    }
    
    public static void deleteAll()
    {
        BestellingDal.deleteAll();
    }
}
