/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Fabio
 */
public class OfertaCarona {
    private String IDUser;
    private String destino;
    private String origem;
    private String data;

    public String getIDUser() {
        return this.IDUser;
    }

    public String getDestino() {
        return this.destino;
    }

    public String getOrigem() {
        return this.origem;
    }
    
    public String getData() {
        return this.data;
    }

    public void setIDUser(String IDUser) {
        this.IDUser = IDUser;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setOrigem(String origem) {
        this.origem = origem;
    }

    public void setData(String dataString) {
        this.data = dataString;
    }
    
    
    
}
