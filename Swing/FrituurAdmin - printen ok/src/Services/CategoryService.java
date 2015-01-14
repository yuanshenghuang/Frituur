/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Category;
import BO.Product;
import DAL.CategoryDal;
import DAL.ProductDal;

import java.util.ArrayList;

/**
 *
 * @author huang
 */
public class CategoryService 
{
    public static ArrayList<Category> selectAll()
    {
        return CategoryDal.selectAll();
    }
    
    public static Category selectOne(int id)
    {
       return CategoryDal.selectOne(id);
    }
    
    public static void add(Category f)
    {
        CategoryDal.add(f);
    }
    
    public static void delete(int id)
    {
        CategoryDal.delete(id);
    }
    
    public static void update(Category f)
    {
        CategoryDal.update(f);
    }
}
