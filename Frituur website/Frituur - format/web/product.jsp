<%-- 
    Document   : product
    Created on : 24-dec-2014, 15:22:37
    Author     : huang
--%>

<%@page import="Dal.TblCartitem"%>
<%@page import="java.util.List"%>
<%@page import="Service.CategoryService"%>
<%@page import="Dal.TblCategory"%>
<%@page import="Service.ProductenService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dal.TblProduct"%>
<%@page import="Dal.TblProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@include file="/master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
      
        <title>JSP Page</title>
       
    </head>
    <body>
        <%
            //get list of product from specific category
            int id = Integer.parseInt(request.getParameter("id"));
            
            ArrayList<TblProduct> list = ProductenService.selectAllProduct(id);
          
            //get categories
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();
            
            
            
            session = request.getSession();      
               
            List<TblCartitem> listCartItems = (List<TblCartitem>) session.getAttribute("list");
            
           
            int aantal = 0;
            if(listCartItems != null)
            {
                
                for( int i =0 ; i< listCartItems.size(); i++)
                {
                    aantal += i;
                }
            }
            
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
                         <li>
                             <label style="margin-top: 1em">aantal producten in winkelwagentje : <%= aantal %> </label>
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
             
             <br/>
             <br/> 
             <br/>
             
            <div class="row">
                 <%for(TblProduct product :list)
                    {

                 %>
                     <div class="col-md-2">  <button type="submit" name="id" style=" border:none " value="<%= product.getId()%>">  <%= product.getName()%> &nbsp;&nbsp;  €<%= product.getPrijs()%> </button>  </div>
                  <%
                    }
                  %>
            </div>
           
            <br/>
            <br/>
                
            <button type="button" id="bestellijst" name="bestellijst"  > <a href=" <%= listCartItems == null? "javascript:void(0);"  : "cart.jsp"  %>   "> naar bestellijst </a>  </button>
            
            
        </form>
       
     </div>    
    </body>
</html>
