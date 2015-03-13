/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.controllers;

import com.ozdev.actividades.dao.ConnectionFactory;
import com.ozdev.actividades.dao.UsuarioDAO;
import com.ozdev.actividades.dao.exception.ConnectionFactoryException;
import com.ozdev.actividades.model.Usuario;
import com.ozdev.mail.utils.MailTransporter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author rberrezueta
 */

import org.apache.commons.lang3.RandomStringUtils;
@Controller
public class UsuarioController {
    
private final org.slf4j.Logger logger = LoggerFactory.getLogger(UsuarioController.class);    
    
	@RequestMapping(value="/registrarusuario", method = RequestMethod.GET)
	public String registarnuevo(ModelMap model) {
 
		model.addAttribute("message", "Web Demo");
		return "registrar/newuser";
 
	} 
        
    @RequestMapping(value = "/recuperarpass", method = {RequestMethod.POST, RequestMethod.GET})
    public String recuperarpass(ModelMap model, HttpServletRequest request) {

        String email = request.getParameter("email");
        if (email != null) {

            email = email.trim();

            String codigo = RandomStringUtils.randomAlphanumeric(6).toUpperCase();
            //System.out.println(codigo);
            //System.out.println();

            MailTransporter mt = new MailTransporter("smtp.gmail.com", "sistemas@ophis.cl", "goumao01xps23");

            Properties props = new Properties();
            // set any needed mail.smtps.* properties here
            Session session = Session.getInstance(props);
            MimeMessage msg = new MimeMessage(session);

            // set the message content here
            String from = "sistemas@ophis.cl";
            String to = email;
            String subject = "Reseteo de Password";
            String message = "Nueva password: " + codigo;
            try {

                msg.setText(message);
                msg.setSubject(subject);
                msg.setFrom(new InternetAddress(from));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            } catch (MessagingException ex) {
                logger.error("No se pudo generar mensaje para correo");
            }


            ConnectionFactory confac = new ConnectionFactory();
            confac.setDataforConnection("org.postgresql.Driver", "postgresql", "jira.idev.cl",
                    "5432", "secframework", "secuser", "secuser");
            Connection connection = null;

            try {
                if (confac.checkData()) {
                    connection = confac.getconnection();
                }
            } catch (ConnectionFactoryException ex) {
                logger.error("Error al generar la coneccion hacia base de datos: " + ex.getMessage());
            }
            boolean resultado = false;
            boolean existe = false;
            if (connection != null) {
                
                UsuarioDAO userdao = new UsuarioDAO();
                Usuario user = new Usuario();
                user = userdao.getUserByMail(connection, email);
                if(user.getId()>0) { existe = true; } 
                if(existe)
                {
                    resultado = userdao.updatePassByEmail(connection, email, 0, UsuarioController.getSecurePassword(codigo));
                }
                
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (resultado) {
                model.addAttribute("mensaje", "Enviado correo a " + email);
                mt.SendMail(msg, session);
            }
            else {              
               model.addAttribute("mensaje", "No existe usuario con ese correo");                
            }




        }
        return "registrar/recuperar";

    }
        
	@RequestMapping(value="/formregistrarusuario", method = RequestMethod.POST)
	public String registarusuario(ModelMap model,  HttpServletRequest request) {

        //model.addAttribute("message", "Web Demo");
        String nombre = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String email = request.getParameter("email").trim();

        System.out.println("nombre:" + nombre);
        System.out.println("password:" + password);
        System.out.println("email:" + email);       

        ConnectionFactory confac = new ConnectionFactory();
        confac.setDataforConnection("org.postgresql.Driver", "postgresql", "jira.idev.cl",
                "5432", "secframework", "secuser", "secuser");
        Connection connection = null;
        try {
            if (confac.checkData()) {
                connection = confac.getconnection();
            }
        } catch (ConnectionFactoryException ex) {
            logger.error("Error al generar la coneccion hacia base de datos: "+  ex.getMessage());           
        }


        if (connection != null) {

            Usuario usuario = new Usuario(nombre, UsuarioController.getSecurePassword(password), email, true);
            UsuarioDAO userdao = new UsuarioDAO();
            int resultado = userdao.insertarUser(connection, usuario);
            if (resultado > 0) {
                userdao.insertRoles(connection, usuario, "ROLE_USER");
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                logger.error("No se pudo insertar usuario: "+ex.getMessage());
                //Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            System.out.println("Failed to make connection!");
        }



        return "registrar/registrado";

    }

    private static String getSecurePassword(String passwordToHash)
    {
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            //md.update(salt.getBytes());
            //Get the hash's bytes 
            byte[] bytes = md.digest(passwordToHash.getBytes());
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        } 
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }
     
    //Add salt
    private static String getSalt() throws NoSuchAlgorithmException, NoSuchProviderException
    {
        //Always use a SecureRandom generator
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG", "LAYCO");
        //Create array for salt
        byte[] salt = new byte[16];
        //Get a random salt
        sr.nextBytes(salt);
        //return salt
        return salt.toString();
    }        
    
}
