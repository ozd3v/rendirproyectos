/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.model;

/**
 *
 * @author rberrezueta
 */
public class Usuario {
    
    private int id;
    private String nombre;
    private String password;
    private String email;
    private boolean enabled;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public Usuario()
    {
        
    }
    
    public Usuario(String nombre, String password, String email, boolean enabled)
    {
        this.setNombre(nombre);
        this.setPassword(password);
        this.setEmail(email);
        this.setEnabled(enabled);
    }    
    
}
