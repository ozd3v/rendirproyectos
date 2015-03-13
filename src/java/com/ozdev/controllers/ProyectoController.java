/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.controllers;

import com.google.gson.Gson;
import com.ozdev.actividades.Manager.EmpresasManager;
import com.ozdev.actividades.dao.ProyectosDAO;
import com.ozdev.actividades.model.Proyecto;
import com.ozdev.comun.model.Persona;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author rberrezueta
 */
@Controller
public class ProyectoController {
    
    private final Logger logger = LoggerFactory.getLogger(ProyectoController.class);
    
 @Secured("ROLE_USER")
	@RequestMapping(value="/demoproyecto")
	public String printProyecto(ModelMap model, Principal principal, HttpServletRequest request ) {
                
                String nombreproyecto = request.getParameter("nomproyecto").trim();
                Proyecto proyecto = new Proyecto();
                proyecto.setNombre(nombreproyecto);
                proyecto.setCodigo("2000312343040-1");
                proyecto.setIdEmpresa(1);
                proyecto.setId(1);
                model.put("proyectoObj", proyecto);
		return "demoproyecto";
 
	}
 @Secured("ROLE_USER")
 @RequestMapping(value="/listproyecto", method = { RequestMethod.POST, RequestMethod.GET})
 public String listarProyectos(ModelMap model, Principal principal, HttpServletRequest request )
 {
     ArrayList listado = new ArrayList();
            listado = EmpresasManager.listadoEmpresas();
            model.put("listadoProyectos", listado);
     return "proyectos";
 }
 
 @Secured("ROLE_USER")
 @RequestMapping(value="/dataselector", method = { RequestMethod.POST, RequestMethod.GET})
 public String dataselector(ModelMap model, Principal principal, HttpServletRequest request, HttpServletResponse response ) throws IOException
 {
    String opcion = request.getParameter("s").trim();
    String selectedValue = request.getParameter("selval");  
    if(selectedValue == null) selectedValue = "0";
    if(selectedValue.equalsIgnoreCase("none")) selectedValue = "0";

    logger.info("valor seleccionado: "+selectedValue);
    logger.info("opcion seleccionada: "+opcion);
    //logger.trace("trace");
    //logger.debug("debug");
    //logger.info("info");
    //logger.warn("warning");
    //logger.error("error");      
    
    
    if(opcion == null) { opcion = ""; }
    
    switch(opcion) {
        case "datoproyecto":
            model.put("seleccion", "datoproyecto");   
            Proyecto proyecto = ProyectosDAO.getproyecto(Integer.parseInt(selectedValue));
            model.put("proyecto",proyecto);
            break;
        case "dato":
            model.put("seleccion", "dato");  
            model.put("mensaje", "este es un mensaje!");  
            break;
            
    }
     
     
     return "exclude/dataselector";
 }
 
    @RequestMapping(value="/excludetestjson", method = { RequestMethod.POST, RequestMethod.GET}) 
    public @ResponseBody Object getUserInJSON(Principal principal, HttpServletRequest request, HttpServletResponse response ) { 
               
        Map<String,String> options = new HashMap<>();
        
        boolean internalmasterflag = false;
        String opcion = request.getParameter("s").trim();
        
        if(!opcion.equalsIgnoreCase("") && opcion != null)
        {
            internalmasterflag = true;
        }
        
        if(internalmasterflag && opcion.equalsIgnoreCase("selproyectos"))
        {
            String selectedValue = request.getParameter("selval").trim();  
            if(selectedValue.equalsIgnoreCase("none")) selectedValue = "0";
            //System.out.println("data: "+ selectedValue + "  -  "+opcion);
            //options.put("1", "prueba");
            //options.put("sada", "asdasdprueba");
            int idEmpresa = Integer.parseInt(selectedValue);
            options = EmpresasManager.listaProyectoToHashMap(idEmpresa);
            
        }
    
        return options; 
    }
    
 @Secured("ROLE_USER")
	@RequestMapping(value="/formproyecto", method = RequestMethod.GET)
	public String printWelcome(ModelMap model, Principal principal ) {
 
		String name = principal.getName();
		model.addAttribute("username", name);
		model.addAttribute("message", "Spring Security Custom Form example");
		return "formProyecto";
 
	}    
}
