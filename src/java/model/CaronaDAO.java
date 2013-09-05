package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public void cadastraUsuario(Usuario u) {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.CadastraUsuario(?, ?, ?, ?)}");
            cstmt.setString(1, u.getNome());
            cstmt.setString(2, u.getLink());
            cstmt.setString(3, u.getUsuario());
            cstmt.setString(4, "1234");
            cstmt.execute();
        } catch (SQLException sqle) {
            
        }
    }

    public List<Carona> cadastraCarona(Carona c) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            cadastraUsuario(c.getUsuario());
            CallableStatement cstmt = conn.prepareCall("{call dbo.CadastraCarona(?, ?, ?, ?, ?)}");
            cstmt.setString(1, c.getUsuario().getUsuario());
            cstmt.setString(2, c.getDestino());
            cstmt.setString(3, c.getOrigem());
            DateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");  
            java.sql.Date data = new java.sql.Date(fmt.parse(c.getData()).getTime());  
            cstmt.setDate(4, data);
            cstmt.setString(5, c.getHorario());
            cstmt.execute();
            return ultimasCaronas();
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } catch (ParseException ex) {
            Logger.getLogger(CaronaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
        return null;
    }
    
    public List<Usuario> buscaCarona(String origem, String destino, String stringData) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        List<Usuario> listaUsuario = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.buscaCarona(?, ?, ?)}");
            cstmt.setString(1, origem);
            cstmt.setString(2, destino);
            DateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");  
            java.sql.Date data = new java.sql.Date(fmt.parse(stringData).getTime());  
            cstmt.setDate(3, data);
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

    public void verificaFacebook(String link) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.verificaFacebook(?)}");
            cstmt.setString(1, link);
            cstmt.execute();
            rs = cstmt.getResultSet();
            if(rs.next()){
                throw new CaronaDAOException("Já existe usuário");
            }
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao selecionar dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
    }

    public String verificaUsuario(Usuario u) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.verificaUsuario(?, ?)}");
            cstmt.setString(1, u.getUsuario());
            cstmt.setString(2, u.getSenha());
            cstmt.execute();
            rs = cstmt.getResultSet();
            if(rs.next()){
                return rs.getString("nome");
            } else throw new CaronaDAOException("Dados incorretos.");
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
    }

    public void verificaUsuarioCad(Usuario u) throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.verificaUsuarioCadastro(?)}");
            cstmt.setString(1, u.getUsuario());
            cstmt.execute();
            rs = cstmt.getResultSet();
            if(rs.next()){
                throw new CaronaDAOException("Dados incorretos.");
            }
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
    }

    public String contaUsuario() throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            st = conn.createStatement();
            rs = st.executeQuery("select count(usuario) from usuario");
            if(rs.next()){
                return rs.getString(1);
            }
            return "";
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
    }

    public String contaCarona() throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
            conn = this.conn;
            st = conn.createStatement();
            rs = st.executeQuery("select count(*) from carona");
            if(rs.next()){
                return rs.getString(1);
            }
            return "";
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
        }
    }

    public List<Carona> ultimasCaronas() throws CaronaDAOException {
        Statement st = null;
        Connection conn = null;
        ResultSet rs = null;
        List<Carona> listaCarona = null;
        
        try {
            conn = this.conn;
            CallableStatement cstmt = conn.prepareCall("{call dbo.ultimasCaronas()}");
            cstmt.execute();
            rs = cstmt.getResultSet();
            if(rs.next()){
                listaCarona = new ArrayList<Carona>();
                Usuario u = new Usuario();
                u.setNome(rs.getString("nome"));
                u.setLink(rs.getString("link"));
                Carona c = new Carona();
                c.setData(rs.getString("data"));
                c.setDestino(rs.getString("destino"));
                c.setOrigem(rs.getString("origem"));
                c.setUsuario(u);
                c.setHorario(rs.getString("horario"));
                listaCarona.add(c);
                while(rs.next()){
                    u = new Usuario();
                    u.setNome(rs.getString("nome"));
                    u.setLink(rs.getString("link"));
                    c = new Carona();
                    c.setData(rs.getString("data"));
                    c.setDestino(rs.getString("destino"));
                    c.setOrigem(rs.getString("origem"));
                    c.setUsuario(u);
                    listaCarona.add(c);
                }
            }
        } catch (SQLException sqle) {
            throw new CaronaDAOException("Erro ao inserir dados " + sqle);
        } finally {
            ConnectionCaronaFactory.closeConnection(conn, st, rs);
            return listaCarona;
        }
    }
}
