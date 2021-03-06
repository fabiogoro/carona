/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CaronaDAOException;
import model.Carona;
import model.CaronaDAO;
import model.Usuario;

/**
 *
 * @author Fabio
 */
public class CadastroOfertaCaronaServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String nome = request.getParameter("nome");
        String link = request.getParameter("link");
        String origem = request.getParameter("origem");
        String destino = request.getParameter("destino");
        String dataString = request.getParameter("data");
        String horario = request.getParameter("horario");
        Carona c = new Carona();
        Usuario u = new Usuario();
        u.setUsuario(link);
        u.setLink(link);
        u.setNome(nome);
        c.setUsuario(u);
        c.setOrigem(origem);
        c.setDestino(destino);
        c.setData(dataString);
        c.setHorario(horario);
        try {
            CaronaDAO dao = new CaronaDAO();
            dao.connect();
            List<Carona> lista = dao.cadastraCarona(c);
            ServletContext context= getServletContext();
            RequestDispatcher rd= context.getRequestDispatcher("/cadastro_ok.jsp");
            request.setAttribute("carona", c);
            request.setAttribute("caronas", lista);
            rd.forward(request, response);
        } catch (CaronaDAOException ex) {
            System.out.println(ex.info());
            Logger.getLogger(CadastroOfertaCaronaServlet.class.getName()).log(Level.SEVERE, null, ex);
            CaronaDAO dao = new CaronaDAO();
            try {
                dao.connect();
                List<Carona> listaCarona;
                listaCarona = dao.ultimasCaronas();
                ServletContext context= getServletContext();
                RequestDispatcher rd= context.getRequestDispatcher("/erro_carona.jsp");
                request.setAttribute("caronas", listaCarona);
                rd.forward(request, response);
            } catch (CaronaDAOException ex1) {
                Logger.getLogger(CadastroOfertaCaronaServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
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
