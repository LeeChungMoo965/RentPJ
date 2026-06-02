package dto;

import java.io.Serializable;

public class PayInfo implements Serializable {
    private int pay_number;
    private String id;
    private int carid;
    private double total_price;
    private String releasDate;

   
    public int getPay_number() {
        return pay_number;
    }


    public void setPay_number(int pay_number) {
        this.pay_number = pay_number;
    }


    public String getId() {
        return id;
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


    public double getTotal_price() {
        return total_price;
    }


    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }


    public String getReleasDate() {
        return releasDate;
    }


    public void setReleasDate(String releasDate) {
        this.releasDate = releasDate;
    }


    public PayInfo() {
    }

}