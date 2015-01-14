/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

/**
 *
 * @author huang
 */
public class Bestelling 
{
    private int id;
    private String lijst;
    private double totaal;
    private String klantnaam;
    private String afhaaltijd;

    public Bestelling() {
    }

    public Bestelling(int id, String lijst, double totaal, String klantnaam, String afhaaltijd) {
        this.id = id;
        this.lijst = lijst;
        this.totaal = totaal;
        this.klantnaam = klantnaam;
        this.afhaaltijd = afhaaltijd;
    }

    
    
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLijst() {
        return lijst;
    }

    public void setLijst(String lijst) {
        this.lijst = lijst;
    }

    public double getTotaal() {
        return totaal;
    }

    public void setTotaal(double totaal) {
        this.totaal = totaal;
    }

    public String getKlantnaam() {
        return klantnaam;
    }

    public void setKlantnaam(String klantnaam) {
        this.klantnaam = klantnaam;
    }

    public String getAfhaaltijd() {
        return afhaaltijd;
    }

    public void setAfhaaltijd(String afhaaltijd) {
        this.afhaaltijd = afhaaltijd;
    }

    @Override
    public String toString() {
        return
                "Bestellingsnr: " + id + " \n"
              + "klantnaam: " + klantnaam + "\n"
              + "afhaaltijd: " + afhaaltijd +"\n"
              + lijst + "\n"
              + "totaal: " + totaal +"\n\n" ; 
            
    }
    
    
    
    
}
