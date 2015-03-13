/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.dao;

import com.ozdev.actividades.dao.exception.ConnectionFactoryException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.slf4j.LoggerFactory;

/**
 *
 * @author rberrezueta
 */
public class ConnectionFactory {
    
    private String classforname = null;
    private String host = null;
    private String user = null;
    private String password = null;
    private String schema = null;
    private String puerto = null; 
    private String database = null;
    
private final org.slf4j.Logger logger = LoggerFactory.getLogger(ConnectionFactory.class);    

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
    

    public String getClassforname() {
        return classforname;
    }

    public void setClassforname(String classforname) {
        this.classforname = classforname;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public String getPuerto() {
        return puerto;
    }

    public void setPuerto(String puerto) {
        this.puerto = puerto;
    }
    
    public boolean checkData() throws ConnectionFactoryException {
        
        boolean resultado = true;
        
            if(this.getClassforname() == null)
            {
                resultado = false;
                throw new ConnectionFactoryException("No se entrego el parametro Class forName; ej: org.postgresql.Driver");              
            }
            
            if(this.getHost() == null)
            {
                resultado = false;
                throw new ConnectionFactoryException("No se entrego el parametro Host; ej: jira.idev.cl ");              
            }    
          
            if(this.getPassword() == null)
            {
                resultado = false;
                throw new ConnectionFactoryException("No se entrego el parametro password de la DB");              
            }  
            
            if(this.getPuerto() == null)
            {
                resultado = false;
                throw new ConnectionFactoryException("No se entrego el parametro puerto de la DB");              
            }               
              
            if(this.getSchema() == null)
            {
                resultado = false;
                throw new ConnectionFactoryException("No se entrego el parametro Schema de la DB");              
            }             
        
            if(this.getUser() == null)
            {
                resultado = false;
                throw new ConnectionFactoryException("No se entrego el parametro User de la DB");              
            }        
            
            if(this.getDatabase() == null)
            {
                resultado = false;
                throw new ConnectionFactoryException("No se entrego el parametro de tipo de la DB");              
            }                     
            
        return resultado;
        
    }
    
    public void setDataforConnection(String classforname, String database, String host,
                                     String puerto, String schema, String user, String password) {
        
        this.setClassforname(classforname);
        this.setDatabase(database);
        this.setHost(host);
        this.setPuerto(puerto);
        this.setSchema(schema);
        this.setUser(user);
        this.setPassword(password);
        
    }
    
    public Connection getconnection() {
        
        Connection connection = null;
        try {        
            this.checkData();
        } catch (ConnectionFactoryException ex) {
            logger.error("Datos incompletos para generar la conexion",ex);            
        }
        
		try {
                        
			Class.forName(this.getClassforname());
 
		} catch (ClassNotFoundException e) {
                        logger.error("Error en clas forname", e);
                       
		}
 		try {
 			connection = DriverManager.getConnection(
					"jdbc:"+this.getDatabase()+"://"+this.getHost()+":"+this.getPuerto()+"/"+this.getSchema(), this.getUser(),
					this.getPassword());
		} catch (SQLException e) {
                        logger.error("Error al obtener conexion", e);
			
		}        
        
        return connection;
        
    }
    
}
