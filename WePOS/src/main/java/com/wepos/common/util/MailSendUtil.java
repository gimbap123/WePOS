package com.wepos.common.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.wepos.common.dto.UsersDto;

public class MailSendUtil {
	
	public void mailSender(UsersDto user) throws AddressException, MessagingException
	{
		// 네이버일 경우 smtp.naver.com, 구글일 경우 smtp.gmail.com
		String host = "smtp.gmail.com";
					
		final String MAILID = "weposproject";  // 보내는 사람의 메일 아이디
		final String MAILPW = "wepos123";  // 보내는 사람의 메일 비밀번호
		int port = 465;  // 포트 번호
					
		String recipient = user.getUserEmail();  // 받는 사람의 메일 주소
		String subject = "WePOS 임시 비밀번호";
		String body = user.getUserId() + "님 WePOS의 임시 비밀번호입니다. - " + user.getUserPassword();
					
		Properties props = System.getProperties();
					
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);			
					
		Session session = Session.getDefaultInstance(props, new Authenticator() {
		String mailId = MAILID;
		String mailPw = MAILPW;
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {					
			return new PasswordAuthentication(mailId, mailPw);
			}
		});
					
		session.setDebug(true);
					
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("weposproject@gmail.com"));  // 발신자 세팅
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));  // 수신자 세팅
					
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
	}

}
