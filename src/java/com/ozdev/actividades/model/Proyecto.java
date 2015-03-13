/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.model;

/**
 *
 * @author rberrezueta
 */
public class Proyecto {
    
    private int id;
    private int idEmpresa;
    private String nombre;
    private String codigo;
    private boolean activo;

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    public int getId() {
        return id;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public String getNombre() {
        return nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    
}
