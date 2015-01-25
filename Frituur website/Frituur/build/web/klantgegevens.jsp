<%-- 
    Document   : klantgegevens
    Created on : 2-jan-2015, 14:53:13
    Author     : huang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/master.jsp" %>
<!DOCTYPE html>
<html>
    <head>      
      <%-- stop de functie timepicker() in html veld waar id timepick is   --%>
      <script>
      $(function() 
      {
        
        $( "#timepick" ).timepicker();
       
      });
      </script>
      
      <script type="text/javascript">
          
      </script>
        <title>klantengegevens</title>
       
    </head>
    <body>      
        
        <div class="container" >
         
              <header> 
                <nav class="navbar navbar-default">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.jsp" target="_self">Home</a>
                        </li>  
                        <li>
                            <a href="cart.jsp" target="_self">Cart</a>
                        </li>
                        <li>
                            <a href="contact.jsp">Contact</a>
                        </li>                  
                    </ul>
                 </nav>   
             </header> 

             <div id="midden">            
                <form method="post" action="CBestellingBevestigen">

                  <div class="form-group">
                    <label for="klantnaam">klantnaam</label>
                    <input type="text" class="form-control" id="klantnaam" name="klantnaam" placeholder="Enter name" required="required">
                  </div>
                  <div class="form-group">
                    <label for="afhaaltijd">afhaaltijd</label>
                    <input type="time" id="timepick" name="afhaaltijd" required="required"/>              
                  </div>  

                  <div class="form-group">
                    <label for="betalen"> momenteel enkel te betalen met cash </label>
                  </div>   

                  <button type="submit" class="btn btn-default" name="action" > bevestig je bestelling </button>

                </form>
             </div>  
            <footer></footer>
        </div>        
    </body>  
</html>
