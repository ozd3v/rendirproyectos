/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.model;

import com.ozdev.comun.model.Persona;
import java.util.ArrayList;

/**
 *
 * @author rberrezueta
 */
public class Empresa {
    private int idEmpresa;
    private String nombre;
    private ArrayList proyectos;
    private Persona contacto;

    public Empresa() {
    }
  
    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ArrayList getProyectos() {
        return proyectos;
    }

    public void setProyectos(ArrayList proyectos) {
        this.proyectos = proyectos;
    }

    public Persona getContacto() {
        return contacto;
    }

    public void setContacto(Persona contacto) {
        this.contacto = contacto;
    }
    
    
}
