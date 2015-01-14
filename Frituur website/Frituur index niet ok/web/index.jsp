<%-- 
    Document   : index
    Created on : 23-dec-2014, 15:02:04
    Author     : huang
--%>

<%@page import="Service.CategoryService"%>
<%@page import="Dal.TblCategory"%>
<%@page import="Service.ProductenService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dal.TblProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/master.jsp" %>
<!DOCTYPE html>
<html>
    <head>     
       
        <title>JSP Page</title>
        
        <style>
            #lijst{
                width: 40%;
                margin-left: 25%;              
            }  
            #buttonsubmit{
                color:#cd0a0a;
            }  
        </style>
    </head>
    <body>
     <div class="container">
         
         
        <%            
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();          
         
        %>
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
        
        <form method="post" action="">
            
             <ul class="nav navbar-nav">

              
                    <%for(TblCategory category :listcategory)
                    {

                    %>
                    <li>   <a href="CBepaalCategory?id=<%= category.getId() %>" > <%= category.getName()%> </a>  </li> 

                    <%
                    }
                    %>
             
            </ul>             
        </form>
        <br/>            
        <br/>               
        <br/>   
          <form method="post" action="CProductToevoegen">
           <%
                    for(TblCategory category :listcategory)
                    {
                       ArrayList<TblProduct> productSortByCategory = ProductenService.selectAllProduct(category.getId());
            %>            
           
                          
           <%
                    for(TblProduct product : productSortByCategory)
                    {
            %> 
                    <div id="lijst">
                         <ul class="list-group">
                          <li class="list-group-item">
                            <span class="badge">                                
                                    <button type="submit" id="buttonsubmit" name="id" value=" <%= product.getId() %> " > + </button>                             
                            </span>
                            <span class="badge"> <%= product.getPrijs() %> </span>
                           
                             <%=product.getName()%>
                          </li>
                        </ul>
                    </div>
           <%               
                       }
                    }
           %>
        
           </form>
                
      </div>  
    </body>
</html>
