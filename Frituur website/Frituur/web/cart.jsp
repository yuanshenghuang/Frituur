<%-- 
    Document   : cart
    Created on : 24-dec-2014, 17:24:10
    Author     : huang
--%>


<%@page import="java.text.DecimalFormat"%>
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
<%@include file="/master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #cartitem{
                 height: 100%;
                 width: 100%;
            }
        </style>
        <title>cart</title>
        <script type="text/javascript">
            function submitform()
            {
                var dd1=document.forms[0].cartitem.options[document.forms[0].cartitem.selectedIndex].value; 
               
                if(dd1 !== null)
                {
                     document.forms["myform"].submit();
                }                
            }     
        </script>
    </head>
    <body>
      <%  
            //alle categorieën opvragen
            ArrayList<TblCategory> listcategory = CategoryService.selectAll();
            
            //binnenkrijgen van session list
            session = request.getSession();
            ArrayList<TblCartitem> list = (ArrayList<TblCartitem>) session.getAttribute("list");

            
            //producten sorteren per category
            Collections.sort(list, new Comparator<TblCartitem>() 
            {
                @Override
                public int compare(TblCartitem  item1, TblCartitem  item2)
                {//vergelijk de categorie van item1 met de categorie van item2
                    return  item1.getTblProduct().getTblCategory().getName().compareTo(item2.getTblProduct().getTblCategory().getName());
                }
            } );
            


            //bereken totaal
            double subtotaal =0;
            for(TblCartitem cartitem : list)
            {
                
                subtotaal += cartitem.getTblProduct().getPrijs()*cartitem.getQuantity() ;
            }
            double totaal = subtotaal * 1.06D;
            DecimalFormat format = new DecimalFormat("#0.00");
           
            
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

             <form method="post" id="myform" action="CRemoveCartItem" >

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

                <div class="alert alert-success" role="alert"> totaal met btw : €<%=   format.format(totaal) %> </div>

              <%-- <button class="btn btn-default" type="submit" name="action"  ><a href="javascript: submitform()" >  remove selected item/reduce quantity </a> </button>  --%>
              <a href="javascript: submitform()" class="btn btn-primary btn-lg active" role="button">  remove selected item/reduce quantity </a>
            </form>      
               <br/>
               <a  href="CEmptyCart" class="btn btn-primary btn-lg active" role="button"> empty cart </a> 
               <a href="klantgegevens.jsp"  class="btn btn-primary btn-lg active" role="button"> verder gaan </a> 
       </div>
       <footer>
       </footer>
     </div>
    </body>
  
</html>
