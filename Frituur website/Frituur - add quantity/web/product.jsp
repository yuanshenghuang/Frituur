<%-- 
    Document   : product
    Created on : 24-dec-2014, 15:22:37
    Author     : huang
--%>

<%@page import="Service.CategoryService"%>
<%@page import="Dal.TblCategory"%>
<%@page import="Service.ProductenService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dal.TblProduct"%>
<%@page import="Dal.TblProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
       
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            
            ArrayList<TblProduct> list = ProductenService.selectAllProduct(id);
          
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();
        %>
       
      <div class="container">
        <nav class="navbar navbar-default">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.jsp" target="_self">Home</a>
                        </li>                       
                        <li>
                            <a href="contact.jsp">Contact</a>
                        </li>                       
                    </ul>
                </nav>
        <h1>producten</h1>
        
         <form method="post" action="CProductToevoegen">
                       
             <ul class="nav navbar-nav">
              
                    <%for(TblCategory category :listcategory)
                    {

                    %>
                    <li>   <a href="product.jsp?id=<%= category.getId() %>">  <%= category.getName()%>  </a>  </li> 

                    <%
                    }
                    %>
                               
             </ul>
              
            <table class="table table-striped" >    
                <tr >
                    <%for(TblProduct product :list)
                    {

                    %>
                    <td> <button type="submit" name="id" style=" border:none " value="<%= product.getId()%>">  <%= product.getName()%> &nbsp;&nbsp;  €<%= product.getPrijs()%> </button> </td>               
                    <%
                    }
                    %>
                </tr>

            </table>
                
                <button type="button" name="bestellijst"  > <a href="cart.jsp" > naar bestellijst </a>   </button>
        </form>
     </div>
    </body>
</html>
