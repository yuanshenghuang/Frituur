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
     <div class="container">
         
         
        <%
            ArrayList<TblProduct> list = ProductenService.selectAll();
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
        
        <form method="post" action="CProductToevoegen">
            
             <ul class="nav navbar-nav">

              
                    <%for(TblCategory category :listcategory)
                    {

                    %>
                    <li>   <a href="product.jsp?id=<%= category.getId() %>" > <%= category.getName()%> </a>  </li> 

                    <%
                    }
                    %>
             
            </ul>             
        </form>
                    
                    
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
           <p> 
               Welkom op onze website!
           </p>
           <p>    
                Sinds 2003 trachten wij de beste frietjes te bakken ter wereld.
          
                Wij werken met dagverse produkten en bakken onze frietjes nog steeds ambachtelijk.
                Ondertussen zijn onze eigen bereidingen een waar succes voor elke frietliefhebber. 
                Tartaar, Drakensaus, een Twijfelaar en de Drakenburger zijn zowat gekend over heel België en worden met veel smaak verorberd.
 
                Ons team zorgt ervoor dat u elke dag kan genieten van onze typische belgische friet en onze specialiteiten.
                Een supersnelle en vriendelijke service, een eerlijke prijs en een propere zaak staan u op te wachten in de Drakenhoflaan te Deurne.  
           </p>
                
      </div>  
    </body>
</html>
