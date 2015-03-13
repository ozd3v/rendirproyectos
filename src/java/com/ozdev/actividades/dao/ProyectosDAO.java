/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.dao;

import com.ozdev.actividades.model.Proyecto;
import java.util.ArrayList;

/**
 *
 * @author rberrezueta
 */
public class ProyectosDAO {
    
    
    static public ArrayList getProyectosActivos(int idEmpresa)
    {
        ArrayList lista = new ArrayList();
        
        Proyecto proyecto1 = new Proyecto();
        proyecto1.setActivo(true);
        proyecto1.setIdEmpresa(idEmpresa);
        proyecto1.setCodigo("201306070001");
        proyecto1.setNombre("Sistema de Registro de Horas");
        proyecto1.setId(1);

        Proyecto proyecto2 = new Proyecto();
        proyecto2.setActivo(true);
        proyecto2.setIdEmpresa(idEmpresa);
        proyecto2.setCodigo("201306070002");
        proyecto2.setNombre("Nextel modificacion logica de recargas");
        proyecto2.setId(2);
        
        Proyecto proyecto3 = new Proyecto();
        proyecto3.setActivo(true);
        proyecto3.setIdEmpresa(idEmpresa);
        proyecto3.setCodigo("201306070003");
        proyecto3.setNombre("VTR Bolsas y promociones");  
        proyecto3.setId(3);
        
        lista.add(proyecto1);
        lista.add(proyecto2);
        lista.add(proyecto3);
        
        return lista; 
    }
    
    
    public static Proyecto getproyecto(int idProyecto)
    {
        Proyecto proyecto1 = new Proyecto();
        
        proyecto1.setActivo(true);
        //proyecto1.setIdEmpresa(idEmpresa);
        proyecto1.setCodigo("201306070001");
        proyecto1.setNombre("Sistema de Registro de Horas");
        proyecto1.setId(1);        
        
        return proyecto1;
    }
    
}
