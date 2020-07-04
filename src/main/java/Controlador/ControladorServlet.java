package Controlador;

import Modelo.Cliente;
import Modelo.ClienteDAO;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Venta;
import Modelo.VentaDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.Case;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Config.GenerarSerie;

@WebServlet(name = "ControladorServlet", urlPatterns = {"/Controlador"})
public class ControladorServlet extends HttpServlet {

    Empleado em = new Empleado();
    EmpleadoDAO edao = new EmpleadoDAO();
    Cliente cl = new Cliente();
    ClienteDAO cdao = new ClienteDAO();
    Producto pr = new Producto();
    ProductoDAO pdao = new ProductoDAO();
    int idp;
    int ide;
    int idc;
    Venta ve = new Venta();
    List<Venta> lista = new ArrayList<>();
    int item;
    int cod;
    String desc;
    double precio;
    int cant;
    double subtotal;
    double totalpagar;
    String numerserie;
    VentaDAO vdao = new VentaDAO();
    int io;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Home")) {

            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }
        if (menu.equals("Principal")) {

            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equals("Empleado")) {
            switch (accion) {
                case "Listar":
                    List lista = edao.listar();
                    request.setAttribute("empleados", lista);
                    break;
                case "Agregar":
                    String dni = request.getParameter("txtdni");
                    String nom = request.getParameter("txtnombre");
                    String tel = request.getParameter("txtcel");
                    String est = request.getParameter("txtestado");
                    String user = request.getParameter("txtuser");
                    em.setDni(dni);
                    em.setNom(nom);
                    em.setTel(tel);
                    em.setEstado(est);
                    em.setUser(user);
                    edao.agregar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    Empleado e = edao.listarId(ide);
                    request.setAttribute("empleado", e);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String dni1 = request.getParameter("txtdni");
                    String nom1 = request.getParameter("txtnombre");
                    String tel1 = request.getParameter("txtcel");
                    String est1 = request.getParameter("txtestado");
                    String user1 = request.getParameter("txtuser");
                    em.setDni(dni1);
                    em.setNom(nom1);
                    em.setTel(tel1);
                    em.setEstado(est1);
                    em.setUser(user1);
                    em.setId(ide);
                    edao.actualizar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    ide = Integer.parseInt(request.getParameter("id"));
                    edao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                default:
                    
                    throw new AssertionError();

            }
            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
        }
        if (menu.equals("Cliente")) {
            switch (accion) {
                case "Listar":
                    List lista = cdao.listar();
                    request.setAttribute("clientes", lista);
                    break;
                case "Agregar":
                    String dniC = request.getParameter("txtdnic");
                    String nomC = request.getParameter("txtnombrec");
                    String dirC = request.getParameter("txtdirec");
                    String estC = request.getParameter("txtestac");
                    cl.setDni(dniC);
                    cl.setNom(nomC);
                    cl.setDirec(dirC);
                    cl.setEstado(estC);
                    cdao.agregar(cl);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idc = Integer.parseInt(request.getParameter("id"));
                    Cliente c = cdao.listarId(idc);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String dni = request.getParameter("txtdnic");
                    String nom = request.getParameter("txtnombrec");
                    String dir = request.getParameter("txtdirec");
                    String est = request.getParameter("txtestac");
                    cl.setDni(dni);
                    cl.setNom(nom);
                    cl.setDirec(dir);
                    cl.setEstado(est);
                    cl.setId(idc);
                    cdao.actualizar(cl);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    idc = Integer.parseInt(request.getParameter("id"));
                    cdao.delete(idc);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                default:
                throw new AssertionError();
            }
            request.getRequestDispatcher("Cliente.jsp").forward(request, response);
        }
        if (menu.equals("Producto")) {
            switch (accion) {
                case "Listar":
                    List lista = pdao.listar();
                    request.setAttribute("productos", lista);
                    break;
                case "Agregar":
                    String nop = request.getParameter("txtdes");
                    Double pre = Double.parseDouble(request.getParameter("txtpre"));
                    Integer sto = Integer.parseInt(request.getParameter("txtstock"));
                    String est = request.getParameter("txtestado");
                    pr.setNop(nop);
                    pr.setPre(pre);
                    pr.setStock(sto);
                    pr.setEsta(est);
                    pdao.agregar(pr);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idp = Integer.parseInt(request.getParameter("id"));
                    Producto p = pdao.listarid(idp);
                    request.setAttribute("producto", p);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nopp = request.getParameter("txtdes");
                    Double prep = Double.parseDouble(request.getParameter("txtpre"));
                    Integer stop = Integer.parseInt(request.getParameter("txtstock"));
                    String estp = request.getParameter("txtestado");
                    pr.setNop(nopp);
                    pr.setPre(prep);
                    pr.setStock(stop);
                    pr.setEsta(estp);
                    pr.setIdp(idp);
                    pdao.actualizar(pr);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    idp = Integer.parseInt(request.getParameter("id"));
                    pdao.delete(idp);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                default:
                throw new AssertionError();
            }
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        }
        if (menu.equals("NuevaVenta")) {
            switch (accion) {
                case "BuscarCliente":
                    String dni = request.getParameter("codcliente");
                    cl.setDni(dni);
                    cl = cdao.buscar(dni);
                    request.setAttribute("c", cl);
                    request.setAttribute("nserie", numerserie);
                    break;
                case "BuscarProducto":
                    int id = Integer.parseInt(request.getParameter("codproducto"));
                    pr = pdao.listarid(id);
                    request.setAttribute("nserie", numerserie);
                    request.setAttribute("pro", pr);
                    request.setAttribute("c", cl);
                    request.setAttribute("lista", lista);
                    request.setAttribute("totalpagar", totalpagar);
                    break;
                case "AgregarProducto":
                    request.setAttribute("c", cl);
                    totalpagar = 0.0;
                    item = item + 1;
                    cod = pr.getIdp();//Integer.parseInt(request.getParameter("codproducto"));
                    desc = request.getParameter("nomproducto");
                    precio = Double.parseDouble(request.getParameter("precio"));
                    cant = Integer.parseInt(request.getParameter("cant"));
                    subtotal = precio * cant;
                    ve = new Venta();
                    ve.setItem(item);
                    ve.setIdproducto(cod);
                    ve.setDescripcion(desc);
                    ve.setPrecio(precio);
                    ve.setCantidad(cant);
                    ve.setSubtotal(subtotal);
                    lista.add(ve);
                   
                    for (int i = 0; i < lista.size(); i++) {
                        totalpagar = totalpagar + lista.get(i).getSubtotal();
                    }
                    request.setAttribute("nserie", numerserie);
                    request.setAttribute("totalpagar", totalpagar);
                    request.setAttribute("lista", lista);
                    break;
                case "GenerarVenta":
                    //Actualizar stock
                    for (int i = 0; i < lista.size(); i++) {
                        Producto pr = new Producto();
                        int cant = lista.get(i).getCantidad();
                        int idpro = lista.get(i).getIdproducto();
                        ProductoDAO prodao = new ProductoDAO();
                        pr = prodao.buscar(idpro);
                        int sac = pr.getStock() - cant;
                        prodao.actualizarstock(idpro, sac);
                    }
                    //Guardar venta
                    ve.setIdcliente(cl.getId());
                    ve.setIdempleado(12);// setIdempleado
                    ve.setNumSerie(numerserie);
                    ve.setFecha("2020-07-01");
                    ve.setMonto(totalpagar);
                    ve.setEstado("1");
                    vdao.guardarventa(ve);
                    //Guardar Detalle
                    int idv = Integer.parseInt(vdao.IdVentas());
                    for (int i = 0; i < lista.size(); i++) {
                        ve = new Venta();
                        ve.setId(idv);
                        ve.setIdproducto(lista.get(i).getIdproducto());
                        ve.setCantidad(lista.get(i).getCantidad());
                        ve.setPrecio(lista.get(i).getPrecio());
                        vdao.guardarDetalleventas(ve);
                        }
                        ve = new Venta();
                    request.setAttribute("nserie", numerserie);
                    break;
                default:
                    numerserie = vdao.GenerarSerie();
                    if (numerserie == null) {
                        numerserie = "00000001";
                        request.setAttribute("nserie", numerserie);
                    }else{
                        int incre = Integer.parseInt(numerserie);
                        GenerarSerie gs = new GenerarSerie();
                        numerserie = gs.NumeroSerie(incre);
                        request.setAttribute("nserie", numerserie);
                    }
                    break;
            }
            request.getRequestDispatcher("RealizarVenta.jsp").forward(request, response);

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
