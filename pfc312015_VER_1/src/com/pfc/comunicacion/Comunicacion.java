package com.pfc.comunicacion;



import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Comunicacion
{


	
	
	
	
	static public boolean enviarCorreos(List<String> dest,String subject,String txt)

	{
		boolean ok=false;
		
		Properties props = new Properties();
		Session sesion = Session.getDefaultInstance(props, null);

		

		
		    Message msg = new MimeMessage(sesion);
		    try 
		    {
				msg.setFrom(new InternetAddress("ocuevas31@gmail.com", "root de pfc"));
			
		    } catch (UnsupportedEncodingException | MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try {
		    	
		    	InternetAddress[] recipientAddress = new InternetAddress[dest.size()];
		    			
		    	int i=0;
		    	for (String x : dest) 
		    	{
		    		 recipientAddress[i] = new InternetAddress(x);
		    	
		    	i++;
		    	}

		    	msg.setRecipients(Message.RecipientType.TO, recipientAddress);
			
		    
		    
		    
		    } catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try 
		    {
			
		    	msg.setSubject(subject);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try
		    {
				msg.setText(txt);
			
		    } catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try 
		    {
			
		    	Transport.send(msg);
			
		    } catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
		    ok=true;
		
		
		
		
		
		return ok;
		
	}
	
	
	
	
	
	static public boolean enviarCorreo(String dest,String subject,String txt)

	{
		boolean ok=false;
		
		Properties props = new Properties();
		Session sesion = Session.getDefaultInstance(props, null);

		

		
		    Message msg = new MimeMessage(sesion);
		    try 
		    {
				msg.setFrom(new InternetAddress("ocuevas31@gmail.com", "root de pfc"));
			
		    } catch (UnsupportedEncodingException | MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try {
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(dest, "Tu_nombre"));
			
		    } catch (UnsupportedEncodingException | MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try 
		    {
			
		    	msg.setSubject(subject);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try
		    {
				msg.setText(txt);
			
		    } catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try 
		    {
			
		    	Transport.send(msg);
			
		    } catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
		    ok=true;
		
		
		
		
		
		return ok;
		
	}
	
	
	
	
	

}
