
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.bean.Cliente;
import modelo.dao.ClienteDAO;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin","/login","/cerrarSesion"})
public class ServletLogin extends HttpServlet {

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
            if (path.equals("/login")) {
                //capturar valotres del formulario
                String dni = request.getParameter("dni");
                String cont = request.getParameter("cl");

                //verificar is usuario esta en la base de datos
                Cliente cli = ClienteDAO.login(dni, cont);
                if (cli != null) {
                    //asignar usuario a un atributo usuario y la vez
                    //es una variable de sesion
                    //request.getSession().setAttribute("usuario", user);
                    request.getSession().setAttribute("cliente", ClienteDAO.buscarId(cli.getId()));
                    //ir a la pagina principal
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensaje", "Usuario y/o clave incorrecto...");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
            if(path.equals("/cerrarSesion")){
                //cerrar sesion
                request.getSession().invalidate();
                //ir al login
                request.getRequestDispatcher("login.jsp").forward(request, response);
            
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
