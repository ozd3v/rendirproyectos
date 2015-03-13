/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.dao;

import com.ozdev.actividades.model.Usuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author rberrezueta
 */
public class UsuarioDAO {

    Statement st = null;
    ResultSet rs = null;

    private final org.slf4j.Logger logger = LoggerFactory.getLogger(ConnectionFactory.class); 
    
    public int insertarUser(Connection connection, Usuario usuario) {
        int resultado = -1;
        try {


            //sec_users_ins(username character, password character, enabled boolean, email character)
            CallableStatement insertar = connection.prepareCall("SELECT * from sec_users_ins(?,?,?,?)");
            //username
            insertar.setString(1, usuario.getNombre());
            //password                        
            insertar.setString(2, usuario.getPassword());
            //System.out.println("pass encode: " + usuario.getPassword());
            insertar.setBoolean(3, usuario.isEnabled());
            insertar.setString(4, usuario.getEmail());
            rs = insertar.executeQuery();
            while (rs.next()) {
                resultado = rs.getInt(1);
            }
            //System.out.println("Resultado sec_users_ins = " + resultado);
            insertar.close();
            rs.close();


        } catch (SQLException ex) {
            logger.error("Error al insertar usuario",ex);   
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return resultado;

    }

    public boolean insertRoles(Connection connection, Usuario user, String role) {
        boolean resultado = false;
        try {

            //insertar roles                
            CallableStatement insertar = connection.prepareCall("SELECT * from sec_authorities_ins(?,?)");
            insertar.setString(1, user.getNombre());
            insertar.setString(2, role);
            rs = insertar.executeQuery();
            while (rs.next()) {
                resultado = rs.getBoolean(1);
            }
            //System.out.println("Resultado sec_authorities = " + resultado);
            insertar.close();
            rs.close();


        } catch (SQLException ex) {
            logger.error("Error al insertar roles",ex); 
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            
        }
        return resultado;
    }
    
    public boolean updatePassByEmail(Connection connection, String email, int id, String pass) {
        
        boolean resultado = false;
        CallableStatement update = null;
       
        try {
            //sec_users_upd_passwordBymail(par_id bigint, par_email character, pass character)
            update = connection.prepareCall("SELECT * from sec_users_upd_passwordBymail(?,?,?)");
            update.setInt(1, id);
            update.setString(2, email);
            update.setString(3, pass);
            rs = update.executeQuery();
            while (rs.next()) {
                resultado = rs.getBoolean(1);
            }          
            
        }
        catch(SQLException ex)
        {
            logger.error("No se pudo actualizar correo", ex);
        }
        finally {
            try {
                if(update != null ) update.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return resultado; 
        
    }
    
    public Usuario getUserByMail(Connection connection, String email)
    {
        Usuario user = new Usuario();
        user.setId(-1);
        user.setNombre("");
        user.setEnabled(false);
        CallableStatement query = null;
       
        try {
            //sec_users_get_bymail(email character);
            query = connection.prepareCall("SELECT * from sec_users_get_bymail(?)");
            query.setString(1, email);
            rs = query.executeQuery();
            while (rs.next()) {
                user.setId(rs.getInt(1));
                user.setNombre(rs.getString(2));
                user.setEnabled(rs.getBoolean(3));
                user.setEmail(rs.getString(4));
            }          
            
        }
        catch(SQLException ex)
        {
            logger.error("No se pudo actualizar correo", ex);
        }
        finally {
            try {
                if(query != null ) query.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return user;
    }
}
