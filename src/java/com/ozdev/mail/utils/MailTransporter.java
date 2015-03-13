/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.mail.utils;

import com.ozdev.comun.alltest.App;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author rberrezueta
 */
public class MailTransporter {
    
    private String host;
    private String user;
    private String password;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    public MailTransporter(String host, String user, String password) {
        this.setHost(host);
        this.setPassword(password);
        this.setUser(user);
    }
    
    public void SendMail(MimeMessage msg, Session session){

        Transport t = null;
        try {
            t = session.getTransport("smtps");
        } catch (NoSuchProviderException ex) {
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            t.connect(this.getHost(), this.getUser(), this.getPassword());
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
    }

}
