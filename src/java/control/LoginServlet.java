/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CaronaDAO;
import model.CaronaDAOException;
import model.Usuario;

/**
 *
 * @author Fabio
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String contentTable = "";
        String senha = request.getParameter("senha");
        String usuario = request.getParameter("usuario");
        Usuario u = new Usuario();
        u.setUsuario(usuario);
        u.setSenha(senha);
        try {
            CaronaDAO dao = new CaronaDAO();
            dao.connect();
            u.setNome(dao.verificaUsuario(u));
            contentTable += "Entrou.";
            out.print(contentTable);
            HttpSession session = request.getSession();
            session.setAttribute("usuario", u);
            session.setMaxInactiveInterval(600);
            response.sendRedirect("index_logged.jsp");
        } catch (CaronaDAOException ex) {
            System.out.println(ex.info());
            Logger.getLogger(CadastroOfertaCaronaServlet.class.getName()).log(Level.SEVERE, null, ex);
            contentTable += "Erro.";
            out.print(contentTable);
            response.sendRedirect("erro_login.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
