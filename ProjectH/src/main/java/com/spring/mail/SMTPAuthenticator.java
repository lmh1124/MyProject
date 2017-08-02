package com.spring.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SMTPAuthenticator extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication("projecth1234","qwe123!@#");
	}
}
