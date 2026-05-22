package main.java.dto;

import java.io.Serializable;

public class Member implements Serializable{
    private String Id;
    private String password;
    private String name;
    private String gender;
    private String birth;
    private String phone;
    private String email;
    private String regist_day;
    private String address;
   
    public Member() {
    }

    public String getId() {
        return Id;
    }

    public String getRegist_day() {
        return regist_day;
    }

    public void setRegist_day(String regist_day) {
        this.regist_day = regist_day;
    }

    public void setId(String id) {
        this.Id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
