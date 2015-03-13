/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.ozdev.comun.form.FileUploadForm;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

/**
 *
 * @author rberrezueta
 */
@Controller
public class FileUploaderController {
    
private final Logger logger = LoggerFactory.getLogger(FileUploaderController.class);    
    
 @Secured("ROLE_ADMIN")
 @RequestMapping(value="/subirarchivo", method = { RequestMethod.POST, RequestMethod.GET})
 public String muestrapaginaUpload(ModelMap model, Principal principal, HttpServletRequest request )
 {

     return "fileuploader";
 }
 
 @Secured("ROLE_ADMIN")
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String save(
            @ModelAttribute("uploadForm") FileUploadForm uploadForm,
                    Model map) {
         
        List<MultipartFile> files = uploadForm.getFiles();        
        List<String> fileNames = new ArrayList<>();
        
    	Properties prop = new Properties();
        String rutaArchivo = "";
    	try {
               //load a properties file
    		prop.load(FileUploaderController.class.getClassLoader().getResourceAsStream("logbackpropiedades.properties"));
 
               //get the property value and print it out
                //System.out.println(prop.getProperty("USER_HOME"));
                rutaArchivo = prop.getProperty("FILE_UPLOAD");
 
    	} catch (IOException ex) {
    		ex.printStackTrace();
        }
         
         
        if(null != files && files.size() > 0) {
            for (MultipartFile multipartFile : files) {
                String fileName = multipartFile.getOriginalFilename();
                logger.info("Archivo Encontrado: "+fileName);                  
                logger.info("Tamaño:  "+humanReadableByteCount(multipartFile.getSize(),true));                
                fileNames.add(fileName);
                String filePath = rutaArchivo + "/" + fileName;
                File dest = new File(filePath);
                
                try {
                    multipartFile.transferTo(dest);
                    logger.info("Archivo almacenado en:"+filePath);
                } catch (        IllegalStateException | IOException e) {
                    return "File uploaded failed:" + fileName;
                }
                
            }
        }
         
        map.addAttribute("files", fileNames);
        return "fileuploader";
    } 
 
 public static String humanReadableByteCount(long bytes, boolean si) {
    int unit = si ? 1000 : 1024;
    if (bytes < unit) return bytes + " B";
    int exp = (int) (Math.log(bytes) / Math.log(unit));
    String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp-1) + (si ? "" : "i");
    return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
}
 
    @Secured("ROLE_USER")
    @RequestMapping(value="/filedownload", method = { RequestMethod.POST, RequestMethod.GET})
    public void serveResource(ModelMap model, Principal principal, HttpServletRequest request, HttpServletResponse response ) throws IOException {
        
        String fileName = request.getParameter("s").trim();
        String userIpAddress = request.getHeader("X-FORWARDED-FOR");
        if (userIpAddress == null) {
            userIpAddress = request.getRemoteAddr();
        }
        
        logger.info("============================================================");
        logger.info("Solicitud para bajar archivo desde "+userIpAddress+" -- usuario:"+principal.getName());
        logger.info("Archivo Solicitado: "+ fileName);
        Properties prop = new Properties();
        String rutaArchivo = "";
        boolean error = false;
        String msgerror = "noerror";
        try
        {
            prop.load(FileUploaderController.class.getClassLoader().getResourceAsStream("logbackpropiedades.properties"));
            rutaArchivo = prop.getProperty("FILE_UPLOAD");
        }catch (Exception e){
            logger.error("No se pudo abrir el archivo de propiedades "+e.getMessage());
            msgerror = e.getMessage();
            error = true;
        } finally {            
            model.put("error", error);
            model.put("msgerror", msgerror);            
        }
 
        String filePath = rutaArchivo + "/" + fileName;
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition",
                "attachment;filename=" + fileName);
        try {
            File dest = new File(filePath);
            FileInputStream fileIn = new FileInputStream(dest);
            ServletOutputStream out = response.getOutputStream();
            byte[] outputByte = new byte[4096];
            //copy binary contect to output stream
            while (fileIn.read(outputByte, 0, 4096) != -1) {
                out.write(outputByte, 0, 4096);
            }
            fileIn.close();            
            out.flush();
            out.close();
        } catch (Exception e) {
            logger.error("No se pudo Descargar el archivo de " + e.getMessage());
            msgerror = e.getMessage();
            error = true;
        } finally {
            model.put("error", error);
            model.put("msgerror", msgerror);              
        }
        logger.info("============================================================");

    }
    
}
