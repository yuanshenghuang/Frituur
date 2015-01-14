/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BO;

/**
 *
 * @author 11627
 */
public class Product {
    
    private int ID;
    private String name;
    private double prijs;
    private int categoryid;

    public Product() {
    }

    public Product(int ID, String naam, double prijs, int categoryid) {
        this.ID = ID;
        this.name = naam;
        this.prijs = prijs;
        this.categoryid = categoryid;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String naam) {
        this.name = naam;
    }

    public double getPrijs() {
        return prijs;
    }

    public void setPrijs(double prijs) {
        this.prijs = prijs;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    @Override
    public String toString() {
        return name + " " + prijs + " " + categoryid;
    }
    
  
    
    
}
