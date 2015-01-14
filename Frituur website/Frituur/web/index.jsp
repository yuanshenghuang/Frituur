<%-- 
    Document   : index
    Created on : 23-dec-2014, 15:02:04
    Author     : huang
--%>

<%@page import="java.util.List"%>
<%@page import="Dal.TblCartitem"%>
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
            #lijst,#lijst1{
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
       
         
        <%  //lijst van alle categorieën          
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();          
         
            
            session = request.getSession();    
              //nodig om te checken of listCartItems leeg is of niet
            List<TblCartitem> listCartItems = (List<TblCartitem>) session.getAttribute("list"); 
            
            
            //bereken aantal producten
            int count = 0; 
            int quantity = 0 ;
            int totaal = 0;
            if(listCartItems != null)
            {
                count = listCartItems.size();
                
                int teller = 0;
                for(TblCartitem cartitem : listCartItems)
                {                    
                    if(cartitem.getQuantity() > 1)
                    {                    
                      teller++;
                      quantity +=  cartitem.getQuantity();
                    }
                }
                
                
                 totaal = count + quantity -teller;
            }
        %>
         <nav class="navbar navbar-default">
            <ul class="nav navbar-nav">
                <li>
                    <a href="index.jsp" target="_self">Home</a>
                </li>                       
                <li>
                    <a href="contact.jsp">Contact</a>
                </li>   
                <li>

                 <label id="aantal" name="aantal"   > 
                    aantal items in cart: <%= totaal%>
                 </label>                   

                </li> 
            </ul>
         </nav>   
        
       
      <section>   
       <ul class="nav navbar-nav">

            <%for(TblCategory category :listcategory)
            {

            %>
            <li>   <a href="CBepaalCategory?id=<%= category.getId() %>" > <%= category.getName()%> </a>  </li> 

            <%
            }
            %>
        </ul>             
       </section>  
        <br/>            
        <br/>               
        <br/>   
        
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
                    <form method="post" action="CProductToevoegen">  
                     <ul class="list-group">
                      
                      <li class="list-group-item">
                        <span class="badge">     
                                <input type="hidden" name="id" value="<%= product.getId() %>">
                                <button type="submit" id="buttonsubmit"  > + </button>                             
                        </span>
                        <span class="badge"> <%= product.getPrijs() %> </span>

                         <%=product.getName()%>
                      </li>                  

                    </ul>
                   </form>
                </div>
       <%               
           }
        }
       %>
            <ul class="list-group" id="lijst1">
                <li class="list-group-item">
                   <button type="button" id="bestellijst" name="bestellijst"  > <a href=" <%= listCartItems == null? "javascript:void(0);"  : "cart.jsp"  %>   "> naar bestellijst </a>  </button>
                   </li>
            </ul>
                   
      </div>           
    
    </body>
</html>
