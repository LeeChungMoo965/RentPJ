package dto;

import java.io.Serializable;

public class Reservation implements Serializable{
    private String id;
    private int res_num;
    private int carid;
    private String endtime ;
    private String starttime ;
    private String regist_day;

    public Reservation(){

    }

    public String getId() {
        return id;
    }

    public int getRes_num() {
        return res_num;
    }

    public void setRes_num(int res_num) {
        this.res_num = res_num;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCarid() {
        return carid;
    }

    public void setCarid(int carid) {
        this.carid = carid;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getRegist_day() {
        return regist_day;
    }

    public void setRegist_day(String regist_day) {
        this.regist_day = regist_day;
    };

    
}