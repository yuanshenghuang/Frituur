<%-- 
    Document   : index
    Created on : 31-dec-2014, 10:42:53
    Author     : huang
--%>

<%@page import="Service.CategoryService"%>
<%@page import="Dal.TblCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <nav>
            <ul>
                <li>
                    <a href="index.jsp">home</a>
                </li>
                <li>
                    <a href="contact.jsp">contact</a>
                </li>
            </ul>
        </nav>
        <%
            ArrayList<TblCategory> list = CategoryService.selectAll();
            
        %>
        <form method="post" action="product.jsp">
            
            <ul>
                <%
                for(TblCategory category : list) 
                {
                %>   
              
               
                <li>
                    <a href="product.jsp?id=<%= category.getId()  %>"> <%=  category.getName()  %> </a>
                </li> 
                <%
                }
                %>
                
              
            </ul>
            
        </form>
        
    </body>
</html>
