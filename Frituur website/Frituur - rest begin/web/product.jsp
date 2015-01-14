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
            
            //get categories
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();
            
            
            
            session = request.getSession();      
            
            //get list of product from specific category
            
             ArrayList<TblProduct> productSortByCategory = (ArrayList<TblProduct>) session.getAttribute("productSortByCategory");
             
            
             
            List<TblCartitem> listCartItems = (List<TblCartitem>) session.getAttribute("list");
            
            
           
         %>
         
     
        <script type="text/javascript">
        function OnClickButton()
        {
              <%
                  Integer count = (Integer)session.getAttribute("count");

                  if (count == null)
                  {
                    count = new Integer(0);
                    session.setAttribute("count", count);
                  }
                  else
                  {         
                    count = new Integer(count.intValue() + 1);

                    session.setAttribute("count", count);        
                  }
             %>
         }
       </script>
        <%
            session.setMaxInactiveInterval(30);
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
                             <label id="aantal" style="margin-top: 1em"> aantal artikelen in car: <%= count%>  </label>
                        </li> 
                      
                    </ul>
                </nav>
        <h1>producten</h1>
        
        
         <ul class="nav navbar-nav">
              
            <% for(TblCategory category :listcategory)
            {
            %>
            <li>   <a href="CBepaalCategory?id=<%= category.getId() %>">  <%= category.getName()%>  </a>  </li> 

            <%
            }
            %>                               
         </ul> 
                    
         <br/>
         <br/> 
         <br/>
             
         <form method="post" action="CProductToevoegen">
            
            <div class="row">
                 <%for(TblProduct product : productSortByCategory)
                    {

                 %>
                     <div class="col-md-2">  <button type="submit" name="id"  style=" border:none " value="<%= product.getId()%>" onclick="OnClickButton()">  <%= product.getName()%> &nbsp;&nbsp;  €<%= product.getPrijs()%> </button>  </div>
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
