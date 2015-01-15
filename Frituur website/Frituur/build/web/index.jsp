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

        <title>index</title>       
        <script type="text/javascript">
           function readCookie(ypos){
            return(document.cookie.match('(^|; )'+ypos+'=([^;]*)')||0)[2]
            }
        </script>

    </head>
    <body onScroll="document.cookie='ypos=' + window.pageYOffset" onLoad="window.scrollTo(0,readCookie('ypos'))">
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
     <div class="container">
           
         <header> 
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
         </header> 

         <div id="midden">
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
                    <article id="lijst">
                        <form method="post" action="CProductToevoegen" onsubmit="refreshPage()">  
                         <ul class="list-group">

                          <li class="list-group-item">
                            <span class="badge">     
                                    <input type="hidden" name="id" id="selected" value="<%= product.getId() %>">
                                    <button type="submit" id="buttonsubmit"  > + </button>                             
                            </span>
                            <span class="badge"> <%= product.getPrijs() %> </span>

                             <%=product.getName()%>
                          </li>                  

                        </ul>
                       </form>
                    </article>
               <%               
                   }
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
                    if(listCartItems != null)
                    {
                    for(TblCartitem cartitem : listCartItems)
                    {
                %>                                     
                          <li class="list-group-item">                      
                            <span class="badge"> <%= cartitem.getQuantity() %>  </span>
                                <%= cartitem.getTblProduct().getName() %>                        
                          </li>                 
                <%
                    }
                    }
                %>  
                </ul>
           </aside>           

          </div>   
        <footer>
        </footer>
      </div>             
    </body>
 
</html>
