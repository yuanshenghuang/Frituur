package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import Dal.TblCartitem;
import Service.CategoryService;
import Dal.TblCategory;
import Service.ProductenService;
import java.util.ArrayList;
import Dal.TblProduct;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/master.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">        \n");
      out.write("        <meta name=\"description\" content=\"online frituur\" />\n");
      out.write("        <meta name=\"keywords\" content=\"frituur,snack,saus,eten,online,frietjes,frieten\" />\n");
      out.write("\n");
      out.write("        <link href=\"css/bootstrap-theme.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/bootstrap-theme.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <script src=\"jq/jquery-1.11.2.js\" type=\"text/javascript\"></script> \n");
      out.write("        <link href=\"jq/jquery-ui.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"jq/jquery-ui.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"jq/jquery-ui.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"jq/jquery-ui.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"jq/jquery-ui.structure.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"jq/jquery-ui.structure.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"jq/jquery-ui.theme.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"jq/jquery-ui.theme.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"jq/jquery-ui-timepicker-addon.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        \n");
      out.write("      \n");
      out.write("         <script type=\"text/javascript\">\n");
      out.write("            if (product.jsp.closed === true && index.jsp.closed === true && klantgegevens.jsp.closed === true && contact.jsp.closed === true && checkout.jsp.closed === true && master.jsp.closed === true && cart.jsp.closed === true) \n");
      out.write("            { \n");
      out.write("            window.close(); \n");
      out.write("            session.invalidate(); \n");
      out.write("            } \n");
      out.write("         </script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("     <body >\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <header> \n");
      out.write("\n");
      out.write("            </header> \n");
      out.write("            <div id=\"midden\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <footer>\n");
      out.write("                 \n");
      out.write("            </footer>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("     </body>\n");
      out.write("  \n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>     \n");
      out.write("\n");
      out.write("        <title>index</title>       \n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("           function readCookie(ypos){\n");
      out.write("            return(document.cookie.match('(^|; )'+ypos+'=([^;]*)')||0)[2]\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body onScroll=\"document.cookie='ypos=' + window.pageYOffset\" onLoad=\"window.scrollTo(0,readCookie('ypos'))\">\n");
      out.write("            ");
  //lijst van alle categorieën          
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
            
      out.write("\n");
      out.write("     <div class=\"container\">\n");
      out.write("           \n");
      out.write("         <header> \n");
      out.write("            <nav class=\"navbar navbar-default\">\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"index.jsp\" target=\"_self\">Home</a>\n");
      out.write("                    </li>                       \n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"contact.jsp\">Contact</a>\n");
      out.write("                    </li>   \n");
      out.write("                    <li>\n");
      out.write("                     <label id=\"aantal\" name=\"aantal\"> \n");
      out.write("                        aantal items in cart: ");
      out.print( totaal);
      out.write("\n");
      out.write("                     </label>                   \n");
      out.write("                    </li> \n");
      out.write("                </ul>\n");
      out.write("             </nav>   \n");
      out.write("         </header> \n");
      out.write("\n");
      out.write("         <div id=\"midden\">\n");
      out.write("              <section>   \n");
      out.write("                   <ul class=\"nav navbar-nav\">\n");
      out.write("\n");
      out.write("                        ");
for(TblCategory category :listcategory)
                        {

                        
      out.write("\n");
      out.write("                        <li>   <a href=\"CBepaalCategory?id=");
      out.print( category.getId() );
      out.write("\" > ");
      out.print( category.getName());
      out.write(" </a>  </li> \n");
      out.write("\n");
      out.write("                        ");

                        }
                        
      out.write("\n");
      out.write("                    </ul>             \n");
      out.write("               </section>  \n");
      out.write("            <br/>            \n");
      out.write("            <br/>               \n");
      out.write("            <br/>   \n");
      out.write("\n");
      out.write("               ");

                for(TblCategory category :listcategory)
                {
                   ArrayList<TblProduct> productSortByCategory = ProductenService.selectAllProduct(category.getId());
                
      out.write("            \n");
      out.write("\n");
      out.write("\n");
      out.write("               ");

                  for(TblProduct product : productSortByCategory)
                  {
               
      out.write(" \n");
      out.write("                    <article id=\"lijst\">\n");
      out.write("                        <form method=\"post\" action=\"CProductToevoegen\" onsubmit=\"refreshPage()\">  \n");
      out.write("                         <ul class=\"list-group\">\n");
      out.write("\n");
      out.write("                          <li class=\"list-group-item\">\n");
      out.write("                            <span class=\"badge\">     \n");
      out.write("                                    <input type=\"hidden\" name=\"id\" id=\"selected\" value=\"");
      out.print( product.getId() );
      out.write("\">\n");
      out.write("                                    <button type=\"submit\" id=\"buttonsubmit\"  > + </button>                             \n");
      out.write("                            </span>\n");
      out.write("                            <span class=\"badge\"> €");
      out.print( product.getPrijs() );
      out.write(" </span>\n");
      out.write("\n");
      out.write("                             ");
      out.print(product.getName());
      out.write("\n");
      out.write("                          </li>                  \n");
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                       </form>\n");
      out.write("                    </article>\n");
      out.write("               ");
               
                   }
                }
               
      out.write("\n");
      out.write("               \n");
      out.write("\n");
      out.write("\n");
      out.write("           <aside > \n");
      out.write("               <ul class=\"list-group\" >\n");
      out.write("                   <li class=\"list-group-item\">artikelen in winkelwagentje</li>\n");
      out.write("                   \n");
      out.write("                ");

                    if(listCartItems != null)
                    {
                        for(TblCartitem cartitem : listCartItems)
                        {
                
      out.write("                                     \n");
      out.write("                          <li class=\"list-group-item\">                      \n");
      out.write("                            <span class=\"badge\"> ");
      out.print( cartitem.getQuantity() );
      out.write("  </span>\n");
      out.write("                                ");
      out.print( cartitem.getTblProduct().getName() );
      out.write("                        \n");
      out.write("                          </li>                 \n");
      out.write("                ");

                        }
                
      out.print( listCartItems == null? "javascript:void(0);"  : "cart.jsp"  );
      out.write("\n");
      out.write("                         <li class=\"list-group-item\">\n");
      out.write("                           <button type=\"button\" id=\"bestellijst\" name=\"bestellijst\"  > <a href=\"#\" onclick=\"Check();return false;\"> naar bestellijst </a>  </button>\n");
      out.write("                         </li>\n");
      out.write("                ");

                    }
                
      out.write("  \n");
      out.write("                </ul>\n");
      out.write("           </aside>           \n");
      out.write("\n");
      out.write("          </div>   \n");
      out.write("        <footer>\n");
      out.write("        </footer>\n");
      out.write("      </div>             \n");
      out.write("    </body>\n");
      out.write(" \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
