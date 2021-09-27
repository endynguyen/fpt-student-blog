<%-- 
    Document   : admin
    Created on : Sep 25, 2021, 11:27:17 AM
    Author     : khoala
--%>

<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String errorMessage = (String) session.getAttribute("ERROR_MESSAGE");
            if (errorMessage == null) {
                errorMessage = "";
            }
        %>
        <h1><%= errorMessage%></h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("LogoutController");
                return;
            }else{
        %>
            <a>Welcome: <%= loginUser.getUserName()%></a>
            <a href="MainController?action=Logout">Logout</a>                              
        <%
            }
        %>
    </body>
</html>