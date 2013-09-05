/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Fabio
 */
public class Carona {
    private Usuario usuario;
    private String destino;
    private String origem;
    private String data;
    private String horario;

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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
