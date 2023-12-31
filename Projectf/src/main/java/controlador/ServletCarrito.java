/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.bean.Carrito;
import modelo.bean.Cliente;
import modelo.bean.Compra;
import modelo.bean.Detalle;
import modelo.bean.Producto;
import modelo.dao.CompraDAO;
import modelo.dao.ProductoDAO;

/**
 *
 * @author gabri
 */
@WebServlet(name = "ServletCarrito", urlPatterns = {"/ServletCarrito","/Controlador",
    "/AgregarCarrito","/carrito","/comprar","/eliminarProd","/GenerarCompra"})
public class ServletCarrito extends HttpServlet {
    Producto p=new Producto();
     ArrayList<Producto> producto =new ArrayList<>();
     ArrayList<Carrito> listaCarrito=new ArrayList<>();
     ProductoDAO prd=new ProductoDAO();
     int item;
     double totalPagar=0.0;
     int cantidad=1;
     Carrito car;
     int idp;
     int idcompra;
     //productos=prd.listar();

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
        try (PrintWriter out = response.getWriter()) {
             String path = request.getServletPath();
             if(path.equals("/Controlador")){
                 
                 int pos=0;
                 cantidad=1;
                 int idp=Integer.parseInt(request.getParameter("id"));
                 p= prd.listarId(idp);
                 if(listaCarrito.size() > 0){
                     for (int i = 0; i < listaCarrito.size(); i++) {
                         if(idp==listaCarrito.get(i).getIdproducto()){
                           pos=i;  
                         }
                     }
                     if(idp==listaCarrito.get(pos).getIdproducto()){
                         cantidad=listaCarrito.get(pos).getCantidad()+cantidad;
                         double subtotal=listaCarrito.get(pos).getPrecioCompra()*cantidad;
                         listaCarrito.get(pos).setCantidad(cantidad);
                         listaCarrito.get(pos).setSubtotal(subtotal);
                     }else{
                         item=item+1;
                 Carrito car=new Carrito();
                 car.setItem(item);
                 car.setIdproducto(p.getIdpro());
                 car.setNombres(p.getNombres());
                 car.setDescripcion(p.getDescripcion());
                 car.setPrecioCompra(p.getPrecio());
                 car.setCantidad(cantidad);
                 car.setSubtotal(cantidad*p.getPrecio());
                 listaCarrito.add(car);
                     }
                     
                 }else{
                     item=item+1;
                 Carrito car=new Carrito();
                 car.setItem(item);
                 car.setIdproducto(p.getIdpro());
                 car.setNombres(p.getNombres());
                 car.setDescripcion(p.getDescripcion());
                 car.setPrecioCompra(p.getPrecio());
                 car.setCantidad(cantidad);
                 car.setSubtotal(cantidad*p.getPrecio());
                 listaCarrito.add(car);
                 }
                 request.setAttribute("contador", listaCarrito.size());
                 request.setAttribute("combo", ProductoDAO.listar());  
                 request.getRequestDispatcher("promociones.jsp").forward(request, response);
   
             }
             if(path.equals("/carrito")){
                 totalPagar=0.0;
                 request.setAttribute("carrito",listaCarrito);
                 for(int i=0; i <listaCarrito.size();i++){
                     totalPagar=totalPagar+listaCarrito.get(i).getSubtotal();
                 }
             request.setAttribute("totalPagar",totalPagar);
             request.getRequestDispatcher("carrito.jsp").forward(request, response);
             }
             
             if(path.equals("/comprar")){
                 totalPagar=0.0;
             int idp=Integer.parseInt(request.getParameter("id"));
                 p= prd.listarId(idp);
                 item=item+1;
                 Carrito car=new Carrito();
                 car.setItem(item);
                 car.setIdproducto(p.getIdpro());
                 car.setNombres(p.getNombres());
                 car.setDescripcion(p.getDescripcion());
                 car.setPrecioCompra(p.getPrecio());
                 car.setCantidad(cantidad);
                 car.setSubtotal(cantidad*p.getPrecio());
                 listaCarrito.add(car);
                 
                 for(int i=0; i <listaCarrito.size();i++){
                     totalPagar=totalPagar+listaCarrito.get(i).getSubtotal();
                 }
                 request.setAttribute("carrito", listaCarrito);
                 request.setAttribute("totalPagar", totalPagar);
                 request.setAttribute("contador", listaCarrito.size());
                 request.setAttribute("combo", ProductoDAO.listar()); 
             request.getRequestDispatcher("carrito.jsp").forward(request, response);
             }
             if(path.equals("/eliminarProd")){
                 int idpr=Integer.parseInt(request.getParameter("id"));
                 for(int i=0; i<listaCarrito.size();i++){
                 if(listaCarrito.get(i).getIdproducto()==idpr){
                     listaCarrito.remove(i);
                     request.setAttribute("carrito", listaCarrito);
                     response.sendRedirect("carrito");
    
                 }
                 }
             }
             if(path.equals("/GenerarCompra")){
                 int idc=Integer.parseInt(request.getParameter("id"));
                 CompraDAO dao=new CompraDAO();
                 Cliente cliente=new Cliente();
                 cliente.setId(idc);
                 
                 Compra compra=new Compra();
                 compra.setCliente(cliente);
                 compra.setIdpago(1);
                 compra.setFecha("29-12-2022");
                 compra.setMonto(totalPagar);
                 compra.setEstado("cancelado");
                 dao.agregarCompras(compra);
                 
                 idcompra = dao.IdCompra();
                 for (int i = 0; i < listaCarrito.size(); i++) {
                 
                 Detalle detalle=new Detalle();
                 detalle.setIdproducto(listaCarrito.get(i).getIdproducto());  
                 detalle.setIdcompra(idcompra);
                 detalle.setCantidad(listaCarrito.get(i).getCantidad());
                 detalle.setPrecioCompra(listaCarrito.get(i).getPrecioCompra());
                 dao.agregarDetalle(detalle);
                 }
                 listaCarrito.clear();
                  request.getRequestDispatcher("index.jsp").forward(request, response);
                 
             }
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
