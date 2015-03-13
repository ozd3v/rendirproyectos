/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.controllers;

import com.ozdev.clientepgr.cmd.LogViewerCmd;
import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
 
/**
 *
 * @author rberrezueta
 */
@Controller
public class Logviewer {
    
     private final Logger logger = LoggerFactory.getLogger(Logviewer.class);
     
 @Secured("ROLE_ADMIN")
	@RequestMapping(value="/logviewer")
	public String clientepgr(ModelMap model, Principal principal, HttpServletRequest request ) {
                
		return "logviewer";
 
	} 
 
  @Secured("ROLE_ADMIN")
	@RequestMapping(value="/logviewersubmit")
	public String clientepgrsubmit(ModelMap model, Principal principal, HttpServletRequest request ) {
                
            
            String username = request.getParameter("username").trim();
            String hostname = request.getParameter("hostname").trim();
            String password = request.getParameter("password").trim();
            String comando1 = request.getParameter("comando1").trim();
            String log = request.getParameter("log").trim();
            
            String comando = comando1+log;
            
      
            String resultado = ""; 
            LogViewerCmd logview = new LogViewerCmd();
            resultado = logview.exeComando(username, hostname, password, comando, resultado);
      
            resultado = resultado.replaceAll("(\r\n|\n)", "<br />");
      
            model.put("submit", "submit");
            model.put("resultado", resultado);
            return "logviewer";
 
	}  
 
    
}
