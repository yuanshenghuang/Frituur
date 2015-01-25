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
        <title>product</title>  
        
    </head>
    
    <body >
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
                         <label id="aantal"> 
                            aantal items in cart: <%= totaal%>
                         </label>                                     
                    </li> 
                </ul>
             </nav>
         </header> 
                         
       <div id="midden">               
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
                            <span class="badge"> €<%= product.getPrijs() %> </span>

                             <%=product.getName()%>
                          </li>                  

                        </ul> 
                       </form>
                  </article>
            <%
              }
            %>
                  


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
                 %>
                         <li class="list-group-item">
                           <a href=" <%= listCartItems == null? "javascript:void(0);"  : "cart.jsp"  %>   "> <button type="button" id="bestellijst" name="bestellijst"  > naar bestellijst  </button></a> 
                         </li>
                 <%
                    }
                %>  
                </ul>
           </aside>     
      </div>  
      <footer></footer>
     </div>    
    </body>
   
</html>
