
package com.mycompany.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int productid;
    private String productname;
    @Column(length=3000)
    private String productdescription;
    private String productphoto;
    private int productprice;
    private int productDiscount;
    private int productqty;
    @ManyToOne
    private Category category;

    public Product() {
    }

    public Product(String productname, String productdescription, String productphoto, int productprice, int productDiscount, int productqty,Category category ) {
        this.productname = productname;
        this.productdescription = productdescription;
        this.productphoto = productphoto;
        this.productprice = productprice;
        this.productDiscount = productDiscount;
        this.productqty = productqty;
        this.category=category;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductdescription() {
        return productdescription;
    }

    public void setProductdescription(String productdescription) {
        this.productdescription = productdescription;
    }

    public String getProductphoto() {
        return productphoto;
    }

    public void setProductphoto(String productphoto) {
        this.productphoto = productphoto;
    }

    public int getProductprice() {
        return productprice;
    }

    public void setProductprice(int productprice) {
        this.productprice = productprice;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public int getProductqty() {
        return productqty;
    }

    public void setProductqty(int productqty) {
        this.productqty = productqty;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    

    @Override
    public String toString() {
        return "Product{" + "productid=" + productid + ", productname=" + productname + ", productdescription=" + productdescription + ", productphoto=" + productphoto + ", productprice=" + productprice + ", productDiscount=" + productDiscount + ", productqty=" + productqty + '}';
    }
    
    //calculate price after discount
    public int getPriceAfterDiscount()
    {
       int d= (int)((this.getProductDiscount()/100.0)*this.getProductprice());
       return this.getProductprice()-d;
    }
}
