
<%@page import="com.mycompany.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUsertype().equals("normal")) {

            session.setAttribute("message", "You are not manager ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }
        else if(user.getUsertype().equals("admin")){
         session.setAttribute("message", "You are not manager ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
    }

    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP page</title>
    </head>
    <body>
        <h1>This is manager panel</h1>
    </body>
</html>
