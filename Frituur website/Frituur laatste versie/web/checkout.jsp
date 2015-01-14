<%-- 
    Document   : checkout
    Created on : 2-jan-2015, 13:59:12
    Author     : huang
--%>

<%@page import="Dal.TblBestelling"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
       
    </head>
    <body>
      <%
          session = request.getSession();
          TblBestelling bestelling = (TblBestelling) session.getAttribute("bestelling");
          
          
      %>
        <div class="container">
            
         <nav class="navbar navbar-default">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.jsp" target="_self">Home</a>
                        </li>
                        <li>
                            <a href="cart.jsp" target="_self">Cart</a>
                        </li>                       
                        <li>
                            <a href="contact.jsp">Contact</a>
                        </li>                       
                    </ul>
         </nav>
        <h1>check out</h1>
           
         <div class="alert alert-success" role="alert"> bestellingsnummer: <%= bestelling.getId() %>  klantnaam: <%= bestelling.getKlantnaam()%>  is successvol doorgestuurd </div>
        
        </div>
        
    </body>
  
</html>
