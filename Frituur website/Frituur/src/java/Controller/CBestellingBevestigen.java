/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dal.TblBestelling;
import Dal.TblCartitem;
import Service.BestellingService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "CBestellingBevestigen", urlPatterns = {"/CBestellingBevestigen"})
public class CBestellingBevestigen extends HttpServlet {

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
      
        
        
          HttpSession session = request.getSession();
          
          ArrayList<TblCartitem> list = (ArrayList<TblCartitem>) session.getAttribute("list");
        
          String klantnaam = request.getParameter("klantnaam");
          String afhaaltijd = request.getParameter("afhaaltijd");
          
          TblBestelling bestelling = new TblBestelling();
          double totaal = 0;
          for(TblCartitem cartitem:list)
          {
             totaal += cartitem.getTblProduct().getPrijs()*cartitem.getQuantity();
             bestelling.setLijst(cartitem );
          }
          bestelling.setTotaal( totaal ) ;
          bestelling.setKlantnaam(klantnaam);
          bestelling.setAfhaaltijd(afhaaltijd);
         
          BestellingService.add(bestelling);
          
          
          session.setAttribute("bestelling",bestelling);
          response.sendRedirect("bestellingVersturen.jsp");
          
          
          
          
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
