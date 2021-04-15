package pms.a02_service;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
// org.springframework.mail.javamail.JavaMailSenderImpl
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_AccountDao;
import pms.z01_vo.Account;
import pms.z01_vo.Email;
import pms.z01_vo.EmailSender;

@Service
public class A02_MailService {
	// 메일 모듈 호출(컨테이너에 등록된 객체 로딩)
		@Autowired(required=false)
		private JavaMailSender sender;
		private A00_AccountDao dao;
		
		public String update_pw(Account upt) {
			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
	                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	        String str = "";

	        int idx = 0;
	        for (int i = 0; i < 10; i++) {
	            idx = (int) (charSet.length * Math.random());
	            str += charSet[idx];
	        }
	        return str;
		//	dao.update_pw(upt);
		}
		
		public void find_pw(Account find) {
			dao.find_pw(find);
		}
		
		/*
		 if(password!=null) {
			
			email.setContent("비밀번호는 "+password+" 입니다."); // 이메일로 보낼 메시지
			email.setReceiver(mail); // 받는이의 이메일 주소
			email.setSubject(name+"님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목 
		 */
		
		public void sendMail(Email email) throws MessagingException{
			//1.멀티미디어형 메일데이터 전송
			MimeMessage msg = sender.createMimeMessage();
			//2. 제목 설정
			msg.setSubject("PMS 비밀번호 찾기 안내 메일입니다.");
		    //3. 수신자 설정.
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
			// 4. 내용 설정
			msg.setText(email.getContent());
			// 5. 발송 처리
			sender.send(msg);
		}

		

		
		

}
