/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.controllers;

import com.ozdev.clientepgr.cmd.RecargaCmd;
import com.ozdev.clientepgr.model.R001TO;
import com.ozdev.clientepgr.model.RemoteHostTO;
import com.ozdev.utils.DateUtilities;
import java.io.FileInputStream;
import java.security.Principal;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
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
public class ClientePGR {
    
    private final Logger logger = LoggerFactory.getLogger(ClientePGR.class);
    private static long idOperacion = 1;
    private static int secuencia = 1;
    private final static String  DIR_PROPERTIES = "/PGR/conf/server.properties";
    private final static String  DIR_RAIZ = "OZDIR";
    
 @Secured("ROLE_USER")
	@RequestMapping(value="/clientepgr")
	public String clientepgr(ModelMap model, Principal principal, HttpServletRequest request ) {
                
		return "clientepgr";
 
	}    
  @Secured("ROLE_USER")
	@RequestMapping(value="/clientepgrsubmit")
	public String clientepgrsubmit(ModelMap model, Principal principal, HttpServletRequest request ) {
                
                
                String rp_mnt = request.getParameter("rp_mnt").trim();
                String rp_ids = request.getParameter("rp_ids").trim();
                String iddis = request.getParameter("iddis").trim();
                String idsdi = request.getParameter("idsdi").trim();
                String idcan = request.getParameter("idcan").trim();
                String idter = request.getParameter("idter").trim();
                String version = request.getParameter("version").trim();
                String cdp = request.getParameter("cdp").trim();
                String host = request.getParameter("host").trim();
                String puerto = request.getParameter("puerto").trim();
                String timeout = request.getParameter("timeout").trim();
                String iteraciones = request.getParameter("iteraciones").trim();
                
             
                
                RemoteHostTO remoteto = new RemoteHostTO(host,host,Integer.parseInt(puerto),Integer.parseInt(timeout));  
                RecargaCmd recarga = new RecargaCmd();
                recarga.setRemoteto(remoteto);
                recarga.setIdOperacion(idOperacion);
                
                R001TO r001 = new R001TO();
                r001.setRp_mnt(rp_mnt);
                r001.setRp_ids(rp_ids);
                r001.setPv_iddis(iddis);
                r001.setPv_idsdi(idsdi);
                r001.setPv_idcan(idcan);
                r001.setPv_idter(idter);
                r001.setPv_sectr(""+secuencia);
                r001.setPv_feven(DateUtilities.getString(DateUtilities.now(), "yyyyMMddHHmmss"));
                r001.setRp_cdp(cdp);
                r001.setVersion(version);
                              
                boolean cando =true;
                recarga.setR001to(r001);
                try {
                    recarga.execute(); 
                }catch(Exception e)
                {
                    logger.error(e.getMessage());
                    cando = false;                    
                }
                
                               
                
                idOperacion++;
                if(secuencia == 6000) { secuencia = 1; }
                secuencia++;
                
                int numiteraciones = Integer.parseInt(iteraciones);
                if(numiteraciones > 1) 
                {
                    int monto = 0;
                    monto = Integer.parseInt(rp_mnt);
                    for(int i=1;i<=numiteraciones;i++)
                    {
                        
                        monto = monto + 1;
                        recarga.setIdOperacion(idOperacion);
                        r001.setRp_mnt(""+monto);
                        r001.setRp_ids(rp_ids);
                        r001.setPv_iddis(iddis);
                        r001.setPv_idsdi(idsdi);
                        r001.setPv_idcan(idcan);
                        r001.setPv_idter(idter);
                        r001.setPv_sectr(""+secuencia);
                        r001.setPv_feven(DateUtilities.getString(DateUtilities.now(), "yyyyMMddHHmmss"));
                        r001.setRp_cdp(cdp);
                        r001.setVersion(version);   
                        
                        recarga.setR001to(r001);
                        recarga.execute(); 
                        
                        idOperacion++;
                        if(secuencia == 6000) { secuencia = 1; }
                        secuencia++;                        
                    }
                }
      
      Map<String, String> envMap = System.getenv();
      String ozdir = envMap.get(DIR_RAIZ);
      //logger.info("VARAIBLE ENTORNO OZDIR: "+ozdir);
      /*
        Iterator<String> iterator = envMap.keySet().iterator();
        while (iterator.hasNext()) {
            String iteratorKey = iterator.next();
            logger.info(iteratorKey + " : " + envMap.get(iteratorKey));
        }
       */
      
      String confdir = ozdir + DIR_PROPERTIES;
      Properties prop = new Properties();
      FileInputStream in = null;
      try {
      
          in = new FileInputStream(confdir);
          prop.load(in);
      }
      catch(Exception e){
          logger.error("No se pudo encontrar la ruta a "+confdir+" "+e.getMessage()+" debe setear OZDIR en /etc/init.d/glassfish y reiniciar glassfish");
      }
        String mensajeRetorno = "";
      if(cando){
          mensajeRetorno = prop.getProperty(recarga.getA002to().getSi_cre());
      }
      else {
          mensajeRetorno = "No se pudo realizar recarga";
          logger.equals("No se pudo realizar recarga");
      }
      
         

           
                model.put("submit", "submit");
                model.put("si_cre", ""+recarga.getA002to().getSi_cre());
                model.put("si_cau", ""+recarga.getA002to().getSi_cau());
                model.put("rp_men", ""+recarga.getA002to().getRp_men());
                model.put("mensajeRetorno", ""+mensajeRetorno);
                   
                //Logger analytics = LoggerFactory.getLogger("analytics");
                //analytics.info("TEST!!!");
                
		return "clientepgr";
 
	}  
    
}
