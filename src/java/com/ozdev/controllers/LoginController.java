/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.controllers;

import com.ozdev.actividades.model.CustomerService;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class LoginController {
 @Secured("ROLE_USER")
 @Qualifier("componente")
	@RequestMapping(value="/welcome", method = RequestMethod.GET)
	public String printWelcome(ModelMap model, Principal principal ) {
 
		String name = principal.getName();
		model.addAttribute("username", name);
		model.addAttribute("message", "Web Demo");
                //CustomerService cust = new CustomerService();
                //System.out.println(cust.toString());
		return "inicio";
 
	}
 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "login";
 
	}
        
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String loginRaiz(ModelMap model) {
 
		return "login";
 
	} 
        
 
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "login";
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
 
		return "login";               
	}
        
                
 	@RequestMapping(value="/accessdenied")
	public String accessdenied(ModelMap model) {
 
		return "accessdenied";        
        }
        
 	@RequestMapping(value="/excludenotsupported")
	public String excludenotsupported(ModelMap model) {
 
		return "exclude/excludenotsupported";        
        }        
 
}