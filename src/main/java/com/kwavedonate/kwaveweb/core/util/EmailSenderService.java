package com.kwavedonate.kwaveweb.core.util;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class EmailSenderService {
	
	private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(String userEmail) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject("[KWAVEDONATE] ");
		message.setFrom("vvshinevv@kwavedonate.com");
		message.setText("����");
		message.setTo(userEmail);
		try {
			mailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
		}
	}
	
}
