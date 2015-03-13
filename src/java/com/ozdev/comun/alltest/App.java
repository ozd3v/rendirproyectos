/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.alltest;

import com.ozdev.actividades.model.CustomerService;
import java.text.DecimalFormat;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author rberrezueta
 */
public class App {
     public static void main( String[] args ) throws MessagingException
    {
    	/*ApplicationContext context = 
    	   new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
 
    	CustomerService cust = (CustomerService)context.getBean("customerService");
    	System.out.println(cust);
 */
        
        String host = "smtp.gmail.com";
        String username = "sistemas@ophis.cl";
        String password = "goumao01xps23";
        Properties props = new Properties();
        // set any needed mail.smtps.* properties here
        Session session = Session.getInstance(props);
        MimeMessage msg = new MimeMessage(session);
        // set the message content here
            String from = "sistemas@ophis.cl";
            String to = "ophis.soft@gmail.com";
            String subject = "Your Subject.";
            String message = "Message Text.";
                msg.setText(message);
                msg.setSubject(subject);
                msg.setFrom(new InternetAddress(from));
                msg.addRecipient(Message.RecipientType.TO,new InternetAddress(to));            
            
        Transport t = null;
         try {
             t = session.getTransport("smtps");
         } catch (NoSuchProviderException ex) {
             Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
         }
        try {
            t.connect(host, username, password);
            t.sendMessage(msg, msg.getAllRecipients());
        } catch (MessagingException ex) {
             Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
         } finally {
            try {
                t.close();
            } catch (MessagingException ex) {
                Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        Long l = new Long(99000000L);
        double d = l.doubleValue();
        DecimalFormat df = new DecimalFormat("#.##");
        System.out.println(df.format(d));
        System.out.println(d);
    }   
}
