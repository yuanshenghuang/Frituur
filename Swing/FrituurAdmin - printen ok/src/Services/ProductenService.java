/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Product;

import DAL.ProductDal;
import java.util.ArrayList;

/**
 *
 * @author huang
 */
public class ProductenService {
    public static ArrayList<Product> selectAll()
    {
        return ProductDal.selectAll();
    }
    
    public static void add(Product f)
    {
        ProductDal.add(f);
    }
    
    public static void delete(int id)
    {
        ProductDal.delete(id);
    }
    
    public static void update(Product f)
    {
        ProductDal.update(f);
    }
}
