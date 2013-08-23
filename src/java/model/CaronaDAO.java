package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class CaronaDAO {
    private Connection conn;
    
    /**
     *
     * @throws UsuarioDAOException
     */
    public boolean connect() throws CaronaDAOException {
        this.conn = ConnectionCaronaFactory.getConnection();
        return true;
    }
    
    public void cadastraUsuario(Usuario u) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
//            st = conn.createStatement();
//            st.executeQuery("SELECT \"cadastraUsuario\"('"+u.getIdUser()+"','"+u.getNome()+"','"+u.getLink()+"')");
            CallableStatement cstmt = conn.prepareCall("{call dbo.CadastraUsuario(?, ?, ?)}");
            cstmt.setString(1, u.getIdUser());
            cstmt.setString(2, u.getNome());
            cstmt.setString(3, u.getLink());
            cstmt.execute();
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
    }

    public void cadastraOfertaCarona(OfertaCarona c) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.CadastraOferta(?, ?, ?, ?)}");
            cstmt.setString(1, c.getIDUser());
            cstmt.setString(2, c.getDestino());
            cstmt.setString(3, c.getOrigem());
            cstmt.setString(4, c.getData());
            cstmt.execute();
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
    }
    
    public List<Usuario> buscaCarona(String origem, String destino, String data) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        List<Usuario> listaUsuario = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.buscaCarona(?, ?, ?)}");
            cstmt.setString(1, origem);
            cstmt.setString(2, destino);
            cstmt.setString(3, data);
            cstmt.execute();
            rs = cstmt.getResultSet();
            if(rs.next()){
                listaUsuario = new ArrayList<Usuario>();
                Usuario c = new Usuario();
                c.setNome(rs.getString("nome"));
                c.setLink(rs.getString("link"));
                listaUsuario.add(c);
                while(rs.next()){
                    c = new Usuario();
                    c.setNome(rs.getString("nome"));
                    c.setLink(rs.getString("link"));
                    listaUsuario.add(c);
                }
            }
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
            return listaUsuario;
        }
    }
}
