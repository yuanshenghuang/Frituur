<%-- 
    Document   : product
    Created on : 24-dec-2014, 15:22:37
    Author     : huang
--%>

<%@page import="net.viralpatel.servlet.listener.SessionListener"%>
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
         <script type="text/javascript">
           function readCookie(ypos){
            return(document.cookie.match('(^|; )'+ypos+'=([^;]*)')||0)[2]
            }
        </script>
    </head>
    
    <body onScroll="document.cookie='ypos=' + window.pageYOffset" onLoad="window.scrollTo(0,readCookie('ypos'))">
        <%
            
            //get categories
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();
            
            
            
            session = request.getSession();      
            
            //get list of product from specific category
            
             ArrayList<TblProduct> productSortByCategory = (ArrayList<TblProduct>) session.getAttribute("productSortByCategory");
             
            
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
                     <label id="aantal" name="aantal"   > 
                        aantal items in cart: <%= totaal%>
                     </label>                                     
                </li> 
            </ul>
         </nav>
         
        <section>
         <ul class="nav navbar-nav">
              
            <% for(TblCategory category :listcategory)
            {
            %>
            <li>   <a href="CBepaalCategory?id=<%= category.getId() %>">  <%= category.getName()%>  </a>  </li> 

            <%
            }
            %>                               
         </ul> 
        </section>            
         <br/>
         <br/> 
         <br/>
             
       <%for(TblProduct product : productSortByCategory)
        {
       %>
             <article id="lijst">  
                   <form method="post"  action="CProductToevoegen">
                     <ul class="list-group">
                      
                      <li class="list-group-item">
                        <span class="badge">     
                                <input type="hidden" name="id" id="selected" value="<%= product.getId()%>">
                                <button type="submit" id="buttonsubmit" onclick="  OnClickButton();"  > + </button>                             
                        </span>
                        <span class="badge"> <%= product.getPrijs() %> </span>

                         <%=product.getName()%>
                      </li>                  
                      
                    </ul> 
                   </form>
                </article>
        <%
        }
        %>
            <ul class="list-group" id="lijst1">
                <li class="list-group-item">
                   <button type="button" id="bestellijst" name="bestellijst"  > <a href=" <%= listCartItems == null? "javascript:void(0);"  : "cart.jsp"  %>   "> naar bestellijst </a>  </button>
                   </li>
            </ul>    
          
            
       <aside> 
           <ul class="list-group">
               <li class="list-group-item">artikelen in winkelwagentje</li>
            <%
                for(TblCartitem cartitem : listCartItems)
                {
            %>                                     
                      <li class="list-group-item">                      
                        <span class="badge"> <%= cartitem.getQuantity() %>  </span>
                            <%= cartitem.getTblProduct().getName() %>                        
                      </li>                 
            <%
                }
            %>  
            </ul>
       </aside>     
      
       
     </div>    
    </body>
</html>
