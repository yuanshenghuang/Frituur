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
        <script type="text/javascript">

            /* Time Picker ©2008 John Davenport Scheuer
               As first seen in http://www.dynamicdrive.com/forums/
               username:jscheuer1 - This notice must remain for legal use
               */

            function timepicker(){
            var d = new Date();
            d.setHours(d.getHours() + timepicker.h);
            var p = function(n){return ':' + (n < 10? '0' + n : n);},
            h = d.getHours(),
            m = p(d.getMinutes()),
            s = p(d.getSeconds()),
            ampm = h >= 12? 'PM' : 'AM';
            h = h%12 || 12;
            h = h < 10? '\xa0' + h : h;
            document.forms[0].elements['timepick'].value = h + m + s + ampm;
            timepicker.timer = setTimeout(timepicker, 1000);
            };
            timepicker.h = 0;
            timepicker.updown = function(n){
            clearTimeout(timepicker.timer);
            timepicker.h += n;
            timepicker();
            };
            window.onload = timepicker;
        </script>
        <title>JSP Page</title>
       
    </head>
    <body>
        <script>
            $(document).ready(function)
            {
                 $( "#datepicker" ).datepicker();
            }
        </script>
        
        <div class="container" >
         
                
            <form method="post" action="CCheckout">
                
              <div class="form-group">
                <label for="klantnaam">klantnaam</label>
                <input type="text" class="form-control" id="klantnaam" name="klantnaam" placeholder="Enter name">
              </div>
              <div class="form-group">
                <label for="afhaaltijd">afhaaltijd</label>
                <input type="text" name="timepick" />
                <input type="button" value="/\" onclick="timepicker.updown(1);" />
                <input type="button" value="\/" onclick="timepicker.updown(-1);" />
              </div>            
             
                
              <button type="submit" class="btn btn-default" name="action" > check out </button>
              
            </form>
            
         
        </div>
        
    </body>
</html>
