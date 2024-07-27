
package com.mycompany.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(length=1000,name="userid")
    private String userid;
    @Column(length=100,name="username")
    private String username;
    @Column(length=100,name="email")
    private String email;
    @Column(length=100,name="password")
    private String password;
    @Column(length=10,name="phone")
    private String phone; 
    @Column(length=5000,name="money")
     private String wallet;
     @Column(length=1500,name="address")
     private String address;
      @Column(name="usertype")
     private String usertype;

    public User(String userid, String username, String email, String password, String phone, String wallet, String address, String usertype) {
        this.userid = userid;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.wallet = wallet;
        this.address = address;
         this.usertype = usertype;
    }

    public User(String username, String email, String password, String phone, String wallet, String address, String usertype) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.wallet = wallet;
        this.address = address;
        this.usertype = usertype;
    }

    public User() {
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWallet() {
        return wallet;
    }

    public void setWallet(String wallet) {
        this.wallet = wallet;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" + "userid=" + userid + ", username=" + username + ", email=" + email + ", password=" + password + ", phone=" + phone + ", wallet=" + wallet + ", address=" + address + '}';
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    
     
    
    
}
