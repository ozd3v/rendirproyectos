/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.alltest;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

final class MailClient
{
    private class SMTPAuthenticator extends Authenticator
    {
        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password)
        {
             authentication = new PasswordAuthentication(login, password);
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication()
        {
             return authentication;
        }
    }

    public void mail()
    {

            String from = "oz.jedah@gmail.com";
            String to = "ophis.soft@gmail.com";
            String subject = "Your Subject.";
            String message = "Message Text.";
            String login = "oz.jedah@gmail.com";
            String password = "rastasatan666";

            Properties props = new Properties();
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");

            Authenticator auth = new SMTPAuthenticator(login, password);

            Session session = Session.getInstance(props, auth);

            MimeMessage msg = new MimeMessage(session);

           try
           {
                msg.setText(message);
                msg.setSubject(subject);
                msg.setFrom(new InternetAddress(from));
                msg.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
                Transport.send(msg);
           }
           catch (MessagingException ex)
           {
                Logger.getLogger(MailClient.class.getName()).
                log(Level.SEVERE, null, ex);
           }
        
    }
}

