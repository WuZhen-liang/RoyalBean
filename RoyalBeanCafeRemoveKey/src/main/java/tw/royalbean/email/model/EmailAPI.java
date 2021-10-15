package tw.royalbean.email.model;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

@Repository("emailAPI")
public class EmailAPI {
				
		public void SendEmail(String emailLocation,String title,String index) {			
//		Create a mail sender
		JavaMailSenderImpl mailSender =new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("EEIT12902@gmail.com");
		mailSender.setPassword("EEIT12902EEIT12902");
		mailSender.setDefaultEncoding("UTF-8");
		
		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,"utf-8");

		try {		
			helper.setFrom("EEIT12902@gmail.com");
			helper.setTo(emailLocation);
			helper.setSubject(title);
			String text = makeEmailModel(index);
			helper.setText(text,true);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
//		// Create an email instance		
//		SimpleMailMessage mailMessage =new SimpleMailMessage();
//		mailMessage.setFrom("EEIT12902@gmail.com");
//		mailMessage.setTo(emailLocation);
//		mailMessage.setSubject(title);
//		mailMessage.setText(index);				
//		//Send mail
//		mailSender.send(mailMessage);
		
	}
	
//		------------------------------- email model ---------------------------------

		public String makeEmailModel(String text) {

			StringBuffer aStringBuffer = new StringBuffer();
			
			aStringBuffer.append(
					"<!DOCTYPE html><html><head><title></title>"
					+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>"
					+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
					+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />"
					+ "<style type=\"text/css\">"
					+ "body,table,td,a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }"
					+ "table,td { mso-table-lspace: 0pt;mso-table-rspace: 0pt;}"
					+ "img { -ms-interpolation-mode: bicubic; }"
					+ "img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }"
					+ "table { border-collapse: collapse !important; }"
					+ "body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}"
					+ "a[x-apple-data-detectors] { color: inherit !important; text-decoration: none !important; font-size: inherit !important; font-family: inherit !important; font-weight: inherit !important; line-height: inherit !important;}"
					+ "@media screen and (max-width: 480px) {.mobile-hide { display: none !important;} .mobile-center { text-align: center !important;}} div[style*=\"margin: 16px 0;\"] {margin: 0 !important;}"
					+ "</style></head>");

			aStringBuffer.append(
					"<body style=\"margin: 0 !important; padding: 0 !important; background-color: #eeeeee;\" bgcolor=\"#eeeeee\">    "
					+ "<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>"
					+ "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tr><td align=\"center\" style=\"background-color: #eeeeee;\" bgcolor=\"#eeeeee\">"
					+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\"><tr>"
					+ "<td align=\"center\" valign=\"top\" style=\"font-size:0; padding: 35px;\" bgcolor=\"#D2691E\">"
					+ "<div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\">"
					+ "<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">"
					+ "<tr><td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;\" class=\"mobile-center\">"
					+ "<h1 style=\"font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;\">RealBeanCafe</h1></td></tr>"
					+ "</table></div><div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\" class=\"mobile-hide\">"
					+ "<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">"
					+ "<tr><td align=\"right\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\">"
					+ "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"right\">"
					+ "<tr><td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400;\">"
					+ "<p style=\"font-size: 18px; font-weight: 400; margin: 0; color: #ffffff;\"><a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;font-size: 18px;\">會員資訊 &nbsp;</a></p></td>"
					+ "<td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 24px;\"> <a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\">"
					+ "</a> </td></tr></table></td></tr></table></div></td></tr><tr>");

			aStringBuffer.append(
					"<td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">"
					+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">"
					+ "<tr><td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\"> "
					+ "<img src=\"https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" /><br>"
					+ "<h2 style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\"> "+text+"<br></h2></td></tr>"
					+ "<tr><td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;\">"
					+ "<p style=\"font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;\"></p>"
					+ "</td></tr>"
					+ "<tr><td align=\"left\" style=\"padding-top: 20px;\">"+ "</td>"
					+ "</tr>" + "</table>");

			
			aStringBuffer.append(
					"</tr><tr><td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;\">"
					+ "<p style=\"font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;\">此為測試郵件<a href=\"#\" target=\"_blank\" style=\"color: #777777;\">取消訂閱</a>.</p>"
					+ "</td></tr></table></td></tr></table></td></tr></table></body></html>");

			String view = aStringBuffer.toString();

			return view;
		}	
		
}
