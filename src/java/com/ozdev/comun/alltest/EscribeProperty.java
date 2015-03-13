/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.alltest;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rberrezueta
 */
public class EscribeProperty {

    public static void main(String[] args) throws URISyntaxException {
        try {
            Properties p = new Properties();
            p.setProperty("1", "one");
            p.setProperty("2", "two");
            p.setProperty("3", "three");

            File file = new File("task.properties");
            
            try (FileOutputStream fOut = new FileOutputStream(file)) {
                p.store(fOut, "Favorite Things");
            } catch (IOException ex) {
                Logger.getLogger(EscribeProperty.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            Properties prop = new Properties();
            prop.load(EscribeProperty.class.getClassLoader().getResourceAsStream("logbackpropiedades.properties"));
            String rutaArchivo = prop.getProperty("USER_HOME");
            
            final URL resource = EscribeProperty.class.getClassLoader().getResource("logbackpropiedades.properties");
            String rutafull = resource.toURI().getPath();
            String cadena = "logbackpropiedades.properties";
            int pos = rutafull.indexOf(cadena);
            rutafull = rutafull.substring(0, pos);
            
            File filex = new File(rutafull+"task.properties");
            FileOutputStream foux = new FileOutputStream(filex);
            p.store(foux, cadena);
            
            System.out.println("Variable logback: "+rutaArchivo);
            
            prop.load(EscribeProperty.class.getClassLoader().getResourceAsStream("task.properties"));
            System.out.println("Variable task: "+prop.getProperty("3"));
     
            
        } catch (IOException ex) {
            Logger.getLogger(EscribeProperty.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        //Test.class.getResource("Test.class")
        //System.out.println(EscribeProperty.class.getResource("EscribeProperty.class"));

    }
}
