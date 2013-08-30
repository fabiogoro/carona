package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 */
public class ConnectionCaronaFactory {

    public static Connection getConnection() throws CaronaDAOException {
            String usuario = "fabio", senha = "317357";
            return getConnection(usuario, senha);
    }
    
    public static Connection getConnection(String usuario, String senha) throws CaronaDAOException {
        try {
//            Class.forName("org.postgresql.Driver");
//            String url = "jdbc:postgresql://localhost:5432/postgres";
//            String username = "webadmin";
//            String password = "317357";
//            Connection conn = DriverManager.getConnection(url, username, password);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
//            String conexao = "jdbc:sqlserver://shelton.sor.ufscar.br;database=labbd02";
            String conexao = "jdbc:sqlserver://localhost;database=carona";
//            String conexao = "jdbc:sqlserver://b7n4ps4aa0.database.windows.net;database=carona";
            Connection conn = DriverManager.getConnection(conexao, usuario, senha);
            return conn;
        } catch (Exception e) {
            throw new CaronaDAOException(e.getMessage());
        }
    }

    public static void closeConnection(Connection conn, Statement stmt, ResultSet rs) throws CaronaDAOException {
        close(conn, stmt, rs);
    }

    public static void closeConnection(Connection conn, Statement stmt)
            throws CaronaDAOException {
        close(conn, stmt, null);
    }

    public static void closeConnection(Connection conn)
            throws CaronaDAOException {
        close(conn, null, null);
    }

    private static void close(Connection conn, Statement stmt, ResultSet rs)
            throws CaronaDAOException {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            throw new CaronaDAOException(e.getMessage());
        }
    }
}
