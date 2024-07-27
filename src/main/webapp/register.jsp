

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
         <%@include file="components/common_css_js.jsp" %>
      
         
         
    </head>
    <body>
           <%@include file="components/navbar.jsp"  %>
           <div class="container-fluid">
               <div class="row mt-5">
               <div class="col-md-4 offset-md-4">
                   <div class="card">
                       <%@include file="components/message.jsp"%>
                       <div class="card-body px-5">
                           <img src="img/profile.png"  style="max-width: 100px;" class="img-fluid" alt="">
                           <h3 class="text-center my-3">Sign up here!!</h3>
                   <form action="RegisterServlet" method="post">
                     <div class="form-group">
    <label for="username">User Name</label>
    <input name="name" type="text" class="form-control" id="username"  placeholder="Enter name">
     </div>  
                        <div class="form-group">
    <label for="email">Email</label>
    <input name="email" type="email" class="form-control" id="email"  placeholder="Enter your email address">
     </div>  
                  <div class="form-group">
    <label for="password">Password</label>
    <input name="password" type="password" class="form-control" id="password"  placeholder="Enter your password">
     </div>     
                        <div class="form-group">
    <label for="userid">User Type</label>
    <input name="usertype" type="text" class="form-control" id="usertype"  placeholder="Enter user type(normal/manager/admin)">
     </div>  
                               <div class="form-group">
    <label for="phone">Phone number</label>
    <input name="phone" type="number" class="form-control" id="phone"  placeholder="Enter phone number">
     </div>  
                               <div class="form-group">
    <label for="address">Address</label>
    <textarea name="address" style="height:150px;" class="form-control" placeholder="Enter your address"></textarea>
     </div>  
                               <div class="form-group">
    <label for="wallet">Add money to your wallet</label>
    <input name="wallet" type="number" class="form-control" id="wallet"  placeholder="Enter amount of money(min 1000)">
     </div>  
                       <div class="container text-center" >
                           <button class="btn btn-outline-success">Register</button> 
                            <button class="btn btn-outline-warning">Reset</button> 
                       </div>
                   </form>
                           
                       </div>
                       
                       
                   </div>
                   
                   
               </div>
           </div>
           
           </div>
    </body>
</html>
