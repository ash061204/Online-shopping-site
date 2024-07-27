<%-- 
    Document   : index
    Created on : 19 Nov, 2022, 5:38:19 PM
    Author     : rajak
--%>

<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <style>
           .list-group-item.active {
   
    background-color:#9E7676;
    border-color: #9E7676;
    .discount-label{
    font-size: 8px!important;
    font-style: italic!important;
   
.product-card:hover{
     background:#e2e2e2;
    cursor: pointer;
}
}
}
            </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CannoughtPlace</title>
        <%@include file="components/common_css_js.jsp" %>
        
       
            

    </head>
    <body>
        <%@include file="components/navbar.jsp"  %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <% 
               String cat=  request.getParameter("category");
                    
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                     List <Product> list=null;
                    if(cat==null){
                      list=dao.getAllProducts();
                }
                     else if(cat.trim().equals("all")){
                    list=dao.getAllProducts();
                }
                else{
                int cid= Integer.parseInt(cat.trim());
                list =dao.getAllProductsById(cid);
                }
                    
                   
                   

                  CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
List<Category> clist=cdao.getCategories();
                %>
           <!-- show categories -->
            <div class="col-md-2">
                
              <div class="list-group mt-4">
                 <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>
                      <% 
                for(Category c:clist){
               %>
               <a href="index.jsp?category=<%= c.getCategoryid() %>" class="list-group-item list-group-item-action"><%=c.getCategorytitle() %></a>
              
               <%
                    }
                
                %>  
              </div>
            </div>
                 <!-- show products -->
            <div class="col-md-10">
                <div class="row mt-4">
                    
                    <div class="col-md-12">
                        
                        <div class="card-columns">
                           <% 
                           for(Product p:list){
                           
                           
                           
                           %> 
                           <!-- product card -->
                           <div class="card product-card">
                               
                               <div class="container text-center">
                               <img style="max-height:270px;max-width:100%;width:auto;" class="card-img-top m-2" src="img/products/<%=p.getProductphoto() %>" alt="Card image cap">
                               </div>
                               <div class=""card-body">
                                   <h5 class="card-title mt-4"><%= p.getProductname() %></h5>
                                   <p class="cart-text">
                                   <%=Helper.get10Words(p.getProductdescription()) %>
                                       
                                       
                                   </p>
                                   
                                   
                               </div>
                               
                                   <div class="card-footer text-center">
                                       
                                       <button class="btn custom-bg text-white" onclick="add_to_cart('<%= p.getProductid()%>','<%= p.getProductname() %>', '<%= p.getPriceAfterDiscount() %>')">Add to cart</button>
                                       <button class="btn btn-outline-success "> <%= p.getPriceAfterDiscount()%><span class="text-secondary discount-label">-/  &#X20B9;<%= p.getProductprice() %> <%= p.getProductDiscount() %>% off</span></button>
                                       
                                   </div>
                               
                               
                               
                           </div>
                                
                           
                           
                            
                            <% }
                            if(list.size()==0)
{
out.println("<h3>This category does not contain any item</h3>");
}
                            
                            
                            
                            %>
                            
                        </div>
                        
                        
                    </div>
                        
                        
                    
                </div>
            </div>
            
            
            
        </div>
        </div>
                            <%@include file="components/common_modals.jsp" %>
    </body>
</html>
