package egovframework.cbiz.util;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.*;
import javax.mail.Transport;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import egovframework.rte.fdl.property.EgovPropertyService;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class MailUtil {

	public static EgovPropertyService propertiesService;
	
	@Autowired
	public MailUtil(EgovPropertyService propertiesService) {
		MailUtil.propertiesService = propertiesService;
	}

	private static void sendMailToUser (EgovPropertyService propertiesService, String subject, String toEmail, String toName, String msgBody, String attachFilePath, String downFileNm) throws AddressException, MessagingException, UnsupportedEncodingException {
		String mailIp   = propertiesService.getString("smtp.ip");
		String mailPort = propertiesService.getString("smtp.port");
		String mailUser = propertiesService.getString("smtp.user");
		String mailPswd = propertiesService.getString("smtp.pswd");
		String mailLocal = propertiesService.getString("smtp.local");

		// Setup mail server
		Authenticator auth = new MailSvrAuthenticator(mailUser, mailPswd);

		// Create session
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "false");
		props.put("mail.smtp.starttls.enable", "false");
		props.put("mail.debug", "true"); 

		props.put("mail.smtp.host", mailIp);
		props.put("mail.smtp.port", mailPort);
		props.put("mail.smtp.localhost", mailLocal);
		
		Session mailSession = Session.getInstance(props, auth);
	 
		String fromEmail = mailUser;
		String fromName  = "시설물통합정보시스템";
		InternetAddress fromAddr = new InternetAddress(fromEmail, fromName, "euc-kr");
		InternetAddress toAddrs = new InternetAddress(toEmail, toName, "euc-kr");
	 
		// Create and initialize message
		Message message = new MimeMessage(mailSession);
		message.setFrom(fromAddr);
		message.setRecipient(Message.RecipientType.TO, toAddrs);
		message.setSubject(MimeUtility.encodeText(subject,"euc-kr","B") );
		message.setHeader("Content-Type","text/html; charset=euc-kr");
		Multipart mp = new MimeMultipart();	 
		MimeBodyPart mbp1 = new MimeBodyPart();
		mbp1.setText(msgBody, "euc-kr");
		mbp1.setHeader("Content-Type","text/html; charset=euc-kr");
		mp.addBodyPart(mbp1);
		if(!attachFilePath.equals("") && !downFileNm.equals("")) {
			MimeBodyPart mbp2 = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(attachFilePath);
			mbp2.setDataHandler(new DataHandler(fds));
			mbp2.setFileName(MimeUtility.encodeText(downFileNm,"UTF-8","B"));
			mp.addBodyPart(mbp2);
		}
		message.setContent(mp);
		
		// Send message
		try {
			Transport.send(message);
		}catch(Exception ex) {
			ex.printStackTrace();
			throw new MessagingException(ex.getMessage());
		}
	}

	static class MailSvrAuthenticator extends Authenticator {
		private String mSvrUserId = "";
		private String mSvrPassWd = "";
		public MailSvrAuthenticator(String mSvrUserId, String mSvrPassWd ) {
			this.mSvrPassWd = mSvrPassWd;
			this.mSvrUserId = mSvrUserId;
		}
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(this.mSvrUserId, this.mSvrPassWd);
		}
	}

	public static void sendMail(EgovPropertyService propertiesService, String subject, String receiver, String msgBody, String attachFilePath, String downFileNm) throws Exception {
		String webRoot = "http://www.fms.or.kr";
		StringBuffer body = new StringBuffer();
		body.append("<html>");	
		body.append("<head>");
		body.append("<link href='"+webRoot+"/com/include/css/style_x.css' rel='stylesheet' type='text/css'>");
		body.append("</head>");
		body.append("<body>");
		body.append("	<table width='509' border='0' cellspacing='0' cellpadding='0'>");
		body.append("		<tr>");
		body.append("			<td align='center'>");
		body.append("				<table width='509' border='0' cellspacing='0' cellpadding='0' align='center'>");
		body.append("					<tr>");
		body.append("						<td width='30'></td>");
		body.append("						<td style='word-break:break-all'><br>" + msgBody.replaceAll("\n", "<br>") + "<br><br></td>");
		body.append("						<td width='25'></td>");
		body.append("					</tr>");
		body.append("				</table>");
		body.append("			</td>");
		body.append("		</tr>");
		body.append("		<tr><td align='center' style='padding-top:50px'><img src='"+webRoot+"/com/img/logo_fms.png' border='0'></td></tr>");
		body.append("	</table>");
		body.append("</body>");
		body.append("</html>");
 
		try {
			String arr[] = StringUtil.split(receiver,"Ð",true);
			for(int i=0; i < arr.length; i++) {
				if(arr[i].equals("")) { break; }
				String toEmail = StringUtil.arrayCol(arr[i],1,"|");
				String toName  = StringUtil.arrayCol(arr[i],2,"|");
				System.out.println("["+String.valueOf(i+1)+"] sendMail ==> " + toEmail + "(" + toName + ")");
				MailUtil.sendMailToUser(propertiesService, subject, toEmail, toName, body.toString(), attachFilePath, downFileNm);
			}
		}catch (AddressException e) {
			e.printStackTrace();
		}catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
