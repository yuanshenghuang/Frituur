/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Dal.TblCartitem;
import Dal.TblProduct;
import Service.ProductenService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author huang
 */
@WebServlet(name = "CProductToevoegen", urlPatterns = {"/CProductToevoegen"})
public class CProductToevoegen extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        
        //haal de product uit de databank met behulp van de binnengekomen id
        int id = Integer.parseInt(request.getParameter("id"));
        // geef mij de product waarvan de id = id
        TblProduct product= ProductenService.selectOne(id);
        
        
        HttpSession session = request.getSession();     
        //ik maak gebruik van mijn sessionListener 
       // ik vraag de lijst op
        List<TblCartitem> list = (List<TblCartitem>) session.getAttribute("list");
        //indien de lijst van de winkelwagen leeg is maak dan een nieuwe
        if (list == null) 
        {
            list = new ArrayList<TblCartitem>();
        }
        
        //ik stop object product in Cartitem
        TblCartitem cartItem = null;
        cartItem = new TblCartitem(product);
        cartItem.addQuantity(1);
        
        //check in de lijst of de product reeds bestaat.
        TblCartitem item = TblCartitem.findOne(product.getId(), list);
      
        //als de product reeds bestaat verhoog de hoeveelheid anders voeg de product toe aan de lijst
        if(item == null)
        {           
            list.add(cartItem);
           
        }
        else
        {
          item.addQuantity(1);         
        }
      
        session.setAttribute("list", list);     
      
        //we gaan terug naar de vorige pagina
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
        
//        RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
//        dispatcher.forward(request, response);
            
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
