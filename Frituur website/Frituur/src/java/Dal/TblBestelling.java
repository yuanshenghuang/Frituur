package Dal;
// Generated 2-jan-2015 14:32:05 by Hibernate Tools 4.3.1



/**
 * TblBestelling generated by hbm2java
 */
public class TblBestelling  implements java.io.Serializable {


     private Integer id;
     private String lijst="";
     private double totaal;
     private String klantnaam;
     private String afhaaltijd;

    public TblBestelling() {
    }

    public TblBestelling(int id ,TblCartitem item, double totaal, String klantnaam, String afhaaltijd) {
       this.id = id;
       this.lijst += item+"\n";
       this.totaal = totaal;
       this.klantnaam = klantnaam;
       this.afhaaltijd = afhaaltijd;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getLijst() {
        return this.lijst;
    }
    
    public void setLijst(TblCartitem item) {
        this.lijst += item +"\n";
    }
    public double getTotaal() {
        return this.totaal;
    }
    
    public void setTotaal(double totaal) {
        this.totaal = totaal;
    }
    public String getKlantnaam() {
        return this.klantnaam;
    }
    
    public void setKlantnaam(String klantnaam) {
        this.klantnaam = klantnaam;
    }
    public String getAfhaaltijd() {
        return this.afhaaltijd;
    }
    
    public void setAfhaaltijd(String afhaaltijd) {
        this.afhaaltijd = afhaaltijd;
    }




}


