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
      
      <script>
      $(function() {
        $( "#timepick" ).timepicker();
      });
      </script>
        <title>JSP Page</title>
       
    </head>
    <body>
       
        
        <div class="container" >
         
                
            <form method="post" action="CCheckout">
                
              <div class="form-group">
                <label for="klantnaam">klantnaam</label>
                <input type="text" class="form-control" id="klantnaam" name="klantnaam" placeholder="Enter name">
              </div>
              <div class="form-group">
                <label for="afhaaltijd">afhaaltijd</label>
                <input type="text" id="timepick" name="afhaaltijd" />              
              </div>  
                
              <div class="form-group">
                <label for="betalen"> momenteel enkel te betalen met cash </label>
                           
              </div>   
                
              <button type="submit" class="btn btn-default" name="action" > bevestig je bestelling </button>
              
            </form>
            
         
        </div>
        
    </body>
</html>
