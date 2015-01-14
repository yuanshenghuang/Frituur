<%-- 
    Document   : klantgegevens
    Created on : 2-jan-2015, 14:53:13
    Author     : huang
--%>

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
        
        <div class="container" >
         
                
            <form method="post" action="CCheckout">
                
              <div class="form-group">
                <label for="klantnaam">klantnaam</label>
                <input type="text" class="form-control" id="klantnaam" name="klantnaam" placeholder="Enter name">
              </div>
              <div class="form-group">
                <label for="afhaaltijd">afhaaltijd</label>
                <input type="text" class="form-control" id="afhaaltijd" name="afhaaltijd" placeholder="afhaaltijd">
              </div>            
             
                
              <button type="submit" class="btn btn-default" name="action" > check out </button>
              
            </form>
            
         
        </div>
        
    </body>
</html>
