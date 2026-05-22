package dto;
import java.io.Serializable;
public class Car implements Serializable {
    private String carid;
    private String carname;
    private int carprice;
    private String peopel;
    private String oil;
    private String color;
    private int distancy;
    private String able ;
    private String location ;
    private String fileName;
    private String releasDate;
        public void setDistancy(int distancy) {
        this.distancy = distancy;
    }
    public String getReleasDate() {
        return releasDate;
    }
    public void setReleasDate(String releasDate) {
        this.releasDate = releasDate;
    }
    //생성자
    public Car(){
        super();
    }
    public String getCarid() {
        return carid;
    }
    public void setCarid(String carid) {
        this.carid = carid;
    }
    public String getCarname() {
        return carname;
    }
    public int getDistancy() {
        return distancy;
    }
    public void setCarname(String carname) {
        this.carname = carname;
    }
    public int getCarprice() {
        return carprice;
    }
    public void setCarprice(int carprice) {
        this.carprice = carprice;
    }
    public String getPeopel() {
        return peopel;
    }
    public void setPeopel(String peopel) {
        this.peopel = peopel;
    }
    public String getOil() {
        return oil;
    }
    public void setOil(String oil) {
        this.oil = oil;
    }
    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public String getAble() {
        return able;
    }
    public void setAble(String able) {
        this.able = able;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
}