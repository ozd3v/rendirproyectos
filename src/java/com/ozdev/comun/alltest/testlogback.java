/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.alltest;

import com.ozdev.actividades.dao.ConnectionFactory;
import org.slf4j.LoggerFactory;

/**
 *
 * @author rberrezueta
 */
public class testlogback {
    
    private final org.slf4j.Logger logger = LoggerFactory.getLogger(ConnectionFactory.class); 
    
    public void holalog()
    {
        logger.info("hola");
    }
    
    public static void main(String[] args) {
        
   
    }
}
