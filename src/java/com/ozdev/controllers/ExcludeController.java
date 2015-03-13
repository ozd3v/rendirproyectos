/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.controllers;

import com.ozdev.actividades.model.Proyecto;
import java.security.Principal;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author rberrezueta
 */
@Controller
public class ExcludeController {

 @RequestMapping(value="/exclude")
 public String listarProyectos(ModelMap model, Principal principal, HttpServletRequest request )
 {
     return "exclude/exclude";
 }
 @RequestMapping(value="/exclude2")
 public String exclude2(ModelMap model, Principal principal, HttpServletRequest request )
 {
     return "exclude/exclude2";
 } 
}
