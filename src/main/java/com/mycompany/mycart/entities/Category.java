
package com.mycompany.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int categoryid;
    private String categorytitle;
    private String categorydescription;
    @OneToMany(mappedBy="category")
    private List<Product> products=new ArrayList<>();
    

    public Category(int categoryid, String categorytitle, String categorydescription) {
        this.categoryid = categoryid;
        this.categorytitle = categorytitle;
        this.categorydescription = categorydescription;
    }
    

    public Category() {
    }

    public Category(String categorytitle, String categorydescription,List<Product> products) {
        this.categorytitle = categorytitle;
        this.categorydescription = categorydescription;
        this.products=products;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategorytitle() {
        return categorytitle;
    }

    public void setCategorytitle(String categorytitle) {
        this.categorytitle = categorytitle;
    }

    public String getCategorydescription() {
        return categorydescription;
    }

    public void setCategorydescription(String categorydescription) {
        this.categorydescription = categorydescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryid=" + categoryid + ", categorytitle=" + categorytitle + ", categorydescription=" + categorydescription + '}';
    }
    
}
