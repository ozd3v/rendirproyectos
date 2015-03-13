/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.dao.exception;

/**
 *
 * @author rberrezueta
 */
public class ConnectionFactoryException extends Exception {
    
    public ConnectionFactoryException() {
        
    }
    
    public ConnectionFactoryException(String msg)
    {
        super(msg);
    }
    
}
