package dto;
import java.io.Serializable;
public class Car implements Serializable {
    private String carid;
    private String carname;
    private int carprice;
    private int people;
    private String oil;
    private String color;
    private int distancy;
    private String endtime ;
    private String starttime ;
    private String locationX;
    private String locationY;
    private String fileName;
    private String releasDate;
        public void setDistancy(int distancy) {
        this.distancy = distancy;
    }
    public String getReleasDate() {
        return releasDate;
    }
    public String getStarttime() {
        return starttime;
    }
    public void setStarttime(String starttime) {
        this.starttime = starttime;
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
    public int getPeople() {
        return people;
    }
    public void setPeople(int people) {
        this.people = people;
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
    public String getEndtime() {
        return endtime;
    }
    public void setEndtime(String time) {
        this.endtime = time;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getLocationX() {
        return locationX;
    }
    public void setLocationX(String locationX) {
        this.locationX = locationX;
    }
    public String getLocationY() {
        return locationY;
    }
    public void setLocationY(String locationY) {
        this.locationY = locationY;
    }
}
