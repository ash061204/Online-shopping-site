
package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    public User getUserByUseridAndPassword(String userid, String password)
    {
        User user=null;
        try{
           String query="from User where userid=:e and password=:p" ;
           Session session=this.factory.openSession();
          Query q= session.createQuery(query);
          q.setParameter("e",userid);
           q.setParameter("p",password);
           user =(User) q.uniqueResult();
           session.close();
           
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
          return user;
    }
    public User getUserByType(String usertype)
    {
        User user=null;
        
        try {
            
            String query="from User where usertype =: t ";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("t", usertype);           
            user=(User) q.uniqueResult();         
            session.close();         
            
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }     
        
        
        
        
        return user;
    }
    
    
}
