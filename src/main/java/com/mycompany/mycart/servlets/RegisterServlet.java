package com.mycompany.mycart.servlets;

import com.mycompany.mycart.entities.User;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           try{
             String username= request.getParameter("name");
              String email= request.getParameter("email");
               String phone= request.getParameter("phone");
                String password= request.getParameter("password");
                  String address= request.getParameter("address");
                   String wallet= request.getParameter("wallet");
                   String usertype= request.getParameter("usertype");
                  User user= new User( username, email, password, phone, wallet, address,usertype);
                  Session hibernateSession=FactoryProvider.getFactory().openSession();
                 Transaction tx= hibernateSession.beginTransaction();
               String userid= (String) hibernateSession.save(user);
                 tx.commit();
                 hibernateSession.close();
                 HttpSession httpSession= request.getSession();
                 httpSession.setAttribute("message","Registration Successful! UserId is"+userid);
                 response.sendRedirect("register.jsp");
                 return;
           }
           catch(Exception e){
               e.printStackTrace();
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
