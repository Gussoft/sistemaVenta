
package Controlador;

import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CarroServlet", urlPatterns = {"/CarroServlet"})
public class CarroServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("listar")) {
            //ProductoService ps = new ProductoServiceImpl();
            //List<Producto> lista = ps.obtenerNuevos();
            //request.setAttribute("listaNuevos", lista);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/main.jsp");
            rd.forward(request, response);
        } else {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            List<Producto> carrito = new ArrayList<>();
           // ProductoService ps = new ProductoServiceImpl();
            if (request.getSession().getAttribute("carrito") == null){
                //crear el carrito
                carrito = new ArrayList<>();
                //carrito.add(ps.obtenerProductoPorCodigo(codigo));
                //crear la sessiom
                request.getSession(true).setAttribute("carrito", carrito);
            }else{
                carrito = (List<Producto>) request.getSession().getAttribute("carrito");
                //carrito.add(ps.obtenerProductoPorCodigo(codigo));
                //crear la sessiom
                request.getSession().setAttribute("carrito", carrito);
               
            }
             // llamar al jsp
             //request.setAttribute("listaNuevos", ps.obtenerNuevos());
             RequestDispatcher rd = getServletContext().getRequestDispatcher("/main.jsp");
             rd.forward(request, response);
        }
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
