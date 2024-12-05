package javaMail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService implements IJavaMail {

	@Override
	public boolean send(String to, String subject, String messageContent) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", EmailProperties.HOST_NAME);
		props.put("mail.smtp.socketFactory.port", EmailProperties.SSL_PORT);
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.port", EmailProperties.SSL_PORT);

		// get Session
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(EmailProperties.APP_EMAIL, EmailProperties.APP_PASSWORD);
			}
		});

		// compose message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			
			message.setSubject(subject);
			String htmlContent = messageContent;
			message.setContent(messageContent, "text/html; charset=utf-8");
			message.setContent(htmlContent, "text/html");
			message.setContent(htmlContent, "text/html; charset=utf-8");

			// send message
			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	public static void main(String[] args) {
		IJavaMail emailService = new EmailService();	
		emailService.send("hoangtunqs134@gmail.com", "SAPO - Cảm ơn vì đã đặt hàng tại SAPO STORE", EmailTemplate.getForgotPasswordTemplate("123", "123"));
	}

}
