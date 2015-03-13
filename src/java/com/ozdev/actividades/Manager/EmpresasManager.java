/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.Manager;

import com.ozdev.actividades.dao.ProyectosDAO;
import com.ozdev.actividades.model.Empresa;
import com.ozdev.actividades.model.Proyecto;
import com.ozdev.comun.model.Persona;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author rberrezueta
 */
public class EmpresasManager {
    
    
    public static ArrayList listadoEmpresas()
    {
        ArrayList listado = new ArrayList();
        listado = listaDummy();
        return listado;        
    }
    
    public static ArrayList listadoProyectosxEmpresa(int idEmpresa)
    {
        ArrayList lista = new ArrayList();
        ProyectosDAO.getProyectosActivos(idEmpresa);
        return lista; 
    }
    
    public static Map listaProyectoToHashMap(int idEmpresa)
    {
        Map<String,String> options = new HashMap<>();
        
        ArrayList listaproyectos = new ArrayList();
        listaproyectos = ProyectosDAO.getProyectosActivos(idEmpresa);
        
        for(int i=0; i<listaproyectos.size();i++)
        {
           Proyecto proyecto = new Proyecto();
           proyecto = (Proyecto)listaproyectos.get(i);
           
           options.put(""+proyecto.getId(), proyecto.getCodigo()+"-"+proyecto.getNombre());
           
        }

        return options;
    }
    
    
    public static ArrayList listaDummy()
    {
        ArrayList listado = new ArrayList();
        
        Empresa empresa1 = new Empresa();
        empresa1.setIdEmpresa(1);
        empresa1.setNombre("Empresa 1");

        Persona persona1 = new Persona();
        persona1.setPrimernombre("Pedro");
        persona1.setPrimerapellido("Picapiedra");
        
        Proyecto proyecto1 = new Proyecto();
        proyecto1.setId(1);
        proyecto1.setCodigo("201100171-01");
        proyecto1.setNombre("Proyecto 1");
        proyecto1.setIdEmpresa(1);
        
        ArrayList listaproyectos1 = new ArrayList();
        listaproyectos1.add(proyecto1);
        empresa1.setProyectos(listaproyectos1);
        
        Empresa empresa2 = new Empresa();
        empresa2.setIdEmpresa(2);
        empresa2.setNombre("Empresa 2");

        Persona persona2 = new Persona();
        persona2.setPrimernombre("Pablo");
        persona2.setPrimerapellido("Marmol");
        
        Proyecto proyecto2 = new Proyecto();
        proyecto2.setId(2);
        proyecto2.setCodigo("201100172-01");
        proyecto2.setNombre("Proyecto 2");
        proyecto2.setIdEmpresa(2);
        
        Proyecto proyecto4 = new Proyecto();
        proyecto4.setId(4);
        proyecto4.setCodigo("201100172-01");
        proyecto4.setNombre("Proyecto 4");
        proyecto4.setIdEmpresa(2);        
        
        ArrayList listaproyectos2 = new ArrayList();
        listaproyectos2.add(proyecto2);
        listaproyectos2.add(proyecto4);
        empresa2.setProyectos(listaproyectos2);        
        
        Empresa empresa3 = new Empresa();
        empresa3.setIdEmpresa(3);
        empresa3.setNombre("Empresa 3");

        Persona persona3 = new Persona();
        persona3.setPrimernombre("Pablo");
        persona3.setPrimerapellido("Marmol");
        
        Proyecto proyecto3 = new Proyecto();
        proyecto3.setId(3);
        proyecto3.setCodigo("201100173-01");
        proyecto3.setNombre("Proyecto 3");
        proyecto3.setIdEmpresa(3);
        
        ArrayList listaproyectos3 = new ArrayList();
        listaproyectos3.add(proyecto3);
        empresa3.setProyectos(listaproyectos3);  
        
        
        listado.add(empresa1);
        listado.add(empresa2);
        listado.add(empresa3);
        
        return listado;
    }
    
}
