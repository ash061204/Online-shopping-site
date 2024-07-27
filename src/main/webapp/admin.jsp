

<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUsertype().equals("normal")) {

            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }
        else if(user.getUsertype().equals("manager")){
         session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
    }

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .admin .card{

    border:1px solid #673ab7;


}
.admin .card:hover{

    background:#e2e2e2;
    cursor: pointer;
   

}
.a{

    background: transparent;
    border: none !important;
    font-size:0;
}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
         <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
           <%@include  file="components/navbar.jsp" %>
    

        <div class="container admin">

        <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

           




            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/group.png" alt="user_icon">

                            </div> 
                            <h1>2342</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>

                    </div>



                </div>

                <!--second col-->

                <div class="col-md-4">


                    <div class="card text-center">

                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/categories.png" alt="user_icon">

                            </div> 

                            <h1>23432</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>

                        </div>

                    </div>


                </div>


                <!--third col-->
                <div class="col-md-4">


                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/dairy-products.png" alt="user_icon">

                            </div> 

                            <h1>234</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>

                    </div>


                </div>





            </div>

            <!--second row-->

            <div class="row mt-3">

                <!--second :row first col-->
                <div class="col-md-6">


                    <div class="card" data-toggle="modal" data-target="#add-category-modal" >

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/menu.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>

                    </div>
                </div>

                <!--second row : second col-->

                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/add-to-basket.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>

                        </div>

                    </div>

                </div>




            </div>



        </div>



<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
               <input type="hidden" name="operation" value="addcategory"/> 
              
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />

                            </div>
              
                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>

                            </div>

                            <div class="cotnainer text-center">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
              
              
          </form>
          
          
          
          
      </div>
      
    </div>
  </div>
</div>
 <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>

                            <!--product title-->

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="productname" required />
                            </div>

                            <!--product description-->

                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="productdescription"></textarea>

                            </div>

                            <!--product price-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of product" name=" productprice" required />
                            </div>

                            <!--product discount-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="productDiscount" required />
                            </div>


                            <!--product quantity-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Quantity" name="productqty" required />
                            </div>
                           <!--product category-->
                             <%  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();

                            %>
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                     <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryid()%>"> <%= c.getCategorytitle()%> </option>
                                    <%}%>
                                </select>
                            </div>


                           

                        


                            <!--product file-->

                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>  
                                <br>
                                <input type="file" id="pPic" name="productphoto" required />

                            </div>


                            <!--submit button-->
                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add product</button>
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>
                        <!--end form-->
                    </div>
                   
                </div>
            </div>
        </div>

        

    </body>
</html>
