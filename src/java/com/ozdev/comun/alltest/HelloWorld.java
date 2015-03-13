/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.alltest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author rberrezueta
 */
public class HelloWorld {
  public static void main(String[] args) {
    Logger logger = LoggerFactory.getLogger(HelloWorld.class);
    //System.setProperty(org.slf4j.impl.simpleLogger.DEFAULT_LOG_LEVEL_KEY, "TRACE");
        logger.trace("trace");
        logger.debug("debug");
        logger.info("info");
        logger.warn("warning");
        logger.error("error");    
        System.out.println("lalala");
        
  }
}