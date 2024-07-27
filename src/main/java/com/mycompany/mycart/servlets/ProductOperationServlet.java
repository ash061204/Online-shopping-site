
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.dao.CategoryDao;
import com.mycompany.mycart.dao.ProductDao;
import com.mycompany.mycart.entities.Category;
import com.mycompany.mycart.entities.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;

import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            String op=request.getParameter("operation");
            if(op.trim().equals("addcategory"))
            {
                 String title= request.getParameter("catTitle");
            String description= request.getParameter("catDescription");
           Category category= new Category();
           category.setCategorytitle(title);
           category.setCategorydescription(description);
           
             CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
             //out.println("Category Saved");
                 HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added successfully : " + catId);
                response.sendRedirect("admin.jsp");
                return;
            
            }
            
            else if(op.trim().equals("addproduct")){
                 String productname=request.getParameter("productname");
                 String productdescription=request.getParameter("productdescription");
                 int productprice=Integer.parseInt( request.getParameter("productprice"));
                  int productDiscount=Integer.parseInt(  request.getParameter("productDiscount"));
                  int productqty=Integer.parseInt(  request.getParameter("productqty"));
                  int catId=Integer.parseInt(  request.getParameter("catId"));
                  Part part=request.getPart("productphoto");
                   
                  Product p=new Product();
                  p.setProductname(productname);
                  p.setProductdescription(productdescription);
                  p.setProductprice(productprice);
                  p.setProductDiscount(productDiscount);
                  p.setProductqty(productqty);
                  p.setProductphoto(part.getSubmittedFileName());
                 
                   //get category by id
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdoa.getCategoryById(catId);
                  p.setCategory(category);
                 //product save.. 
                  ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            pdao.saveProduct(p);
                
                //pic upload
                
               String path= request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                //uploading code
                try{
                FileOutputStream fos=new FileOutputStream(path);
                
              InputStream is=part.getInputStream();
                byte[] data = new byte[is.available()];
                 is.read(data);
                  fos.write(data);

                    fos.close();
                }
                catch (Exception e){
                  e.printStackTrace();
                }
                
out.println("Product save success");
HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product has been added successfully ");
                response.sendRedirect("admin.jsp");
             

                
                
                
                
            }
            
                }
          
            
        
        catch(Exception e){
            
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
