<%-- 
    Document   : cart
    Created on : 24-dec-2014, 17:24:10
    Author     : huang
--%>


<%@page import="Dal.TblBestelling"%>
<%@page import="Service.ProductenService"%>
<%@page import="Dal.TblProduct"%>
<%@page import="Dal.TblProduct"%>
<%@page import="Service.CategoryService"%>
<%@page import="Dal.TblCategory"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dal.TblCartitem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            #cartitem{
                 height: 100%;
                 width: 100%;
            }
        </style>
        <title>JSP Page</title>
      
    </head>
    <body>
     
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
        <h1>cart item</h1>
        
        <%  
            
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();
            
            
            session = request.getSession();
            ArrayList<TblCartitem> list = (ArrayList<TblCartitem>) session.getAttribute("list");

            Collections.sort(list, new Comparator<TblCartitem>() 
            {
                @Override
                public int compare(TblCartitem  item1, TblCartitem  item2)
                {
                    return  item1.getTblProduct().getTblCategory().getName().compareTo(item2.getTblProduct().getTblCategory().getName());
                }
            });
            
           double subtotaal =0;
            for(TblCartitem cartitem : list)
            {
                
                subtotaal += cartitem.getTblProduct().getPrijs()*cartitem.getQuantity() ;
            }
            double totaal = subtotaal * 1.06D;
          %>
          
        <form method="post" action="CRemoveCartItem">
            
             <ul class="nav navbar-nav">
              
                    <%for(TblCategory category :listcategory)
                    {

                    %>
                    <li>   <a href="product.jsp?id=<%= category.getId() %>" > <%= category.getName()%> </a>  </li> 

                    <%
                    }
                    %>
                               
             </ul>
                    
                    
            <select multiple="multiple" size="10" name="cartitem" id="cartitem" class="list-group"  >                 
                  
                  <%
                    for(int i =0; i< list.size(); i++) 
                    {
                      
                    
                  %>
                  
                  <option value="<%=  i   %>" class="list-group-item" > 
                      
                      <%=  list.get(i) %> 
                        
                  </option>                 
                     
                   <%               
                     }
                   %>

            </select>
                   
            <div class="alert alert-success" role="alert"> totaal met btw : €<%=  totaal %> </div>
            
            <button class="btn btn-default" type="submit" name="action"  >  remove selected item/reduce quantity  </button>        
        </form>       
                
        <button class="btn btn-default" type="button" ><a href="CEmptyCart" >empty cart</a> </button> 
        <button class="btn btn-default" type="button" ><a href="klantgegevens.jsp"  >  verder gaan </a> </button>
      
     </div>
    </body>
</html>
