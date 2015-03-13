/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.actividades.model;

import com.ozdev.actividades.dao.CustomerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author rberrezueta
 */
@Component("componente")
public class CustomerService 
{
	@Autowired
	CustomerDAO customerDAO;
 
	@Override
	public String toString() {
		return "CustomerService [customerDAO=" + customerDAO + "]";
	}
}