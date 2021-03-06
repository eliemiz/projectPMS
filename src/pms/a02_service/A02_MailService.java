package pms.a02_service;

import java.util.Date;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_AccountDao;
import pms.z01_vo.Account;
import pms.z01_vo.Email;
import pms.z02_util.PasswordManager;

@Service
public class A02_MailService {
   // 메일 모듈 호출(컨테이너에 등록된 객체 로딩)
   @Autowired(required = false)
   private JavaMailSender sender;

   @Autowired(required = false)
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
      // dao.update_pw(upt);
   }

   public void signinIns(Account insert) {
      dao.signinIns(insert);
   }   
  
   public int sendMail(String name, Email email) throws MessagingException {

      /* 0. 해당하는 계정이 있는지 확인 */
      Account account = new Account();
      account.setName(name);
      account.setMail(email.getReceiver());
      Account find = dao.find_pw(account);
      if (find == null) {
         return -1; // 해당 계정 없음
      }
	  try {
	      /* 1.멀티미디어형 메일데이터 전송 */
	      MimeMessage msg = sender.createMimeMessage();
	
	      /* 2. 제목 설정 */
	      msg.setSubject("PMS 비밀번호 찾기 안내 메일입니다.");
	
	      /* 3. 수신자 설정 */
	      msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
	
	      /* 4. 내용 설정 */
	      // 임시 비밀번호 생성
	      String pass = PasswordManager.getInstance().createPassword();
	      StringBuilder sb = new StringBuilder();
	      sb.append("새로 생성된 비밀번호를 통해 접속 후 비밀번호를 변경해주세요.\n\n");
	      sb.append("새 비밀번호 : " + pass+ " 입니다.");
	      // 계정 비밀번호 변경
	      find.setPassword(pass);
	      dao.update_pw(find);
	
	      // 내용 설정
	      msg.setText(sb.toString());
	
	      // 5. 발송 처리
	      sender.send(msg);
	  }catch (MessagingException e) {
		  System.out.println("#에러발생#");
		  e.printStackTrace();
		  
		  return -2;
	  }   

      return 1;
   }
   
   public int sendIdMail(String name, Email email) throws MessagingException {

	      /* 0. 해당하는 계정이 있는지 확인 */
	      Account account = new Account();
	      account.setName(name);
	      account.setMail(email.getReceiver());
	      Account find = dao.find_id(account);
	      if (find == null) {
	         return -1; // 해당 계정 없음
	      }
		  try {
		      /* 1.멀티미디어형 메일데이터 전송 */
		      MimeMessage msg = sender.createMimeMessage();
		
		      /* 2. 제목 설정 */
		      msg.setSubject("PMS 아이디 찾기 안내 메일입니다.");
		
		      /* 3. 수신자 설정 */
		      msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
		
		      /* 4. 내용 설정 */
		      String id = find.getUser_id();
		      StringBuilder sb = new StringBuilder();
		      sb.append("해당 계정의 아이디는 : " + id + " 입니다.");
		
		      // 내용 설정
		      msg.setText(sb.toString());
		
		      // 5. 발송 처리
		      sender.send(msg);
		  }catch (MessagingException e) {
			  System.out.println("#에러발생#");
			  e.printStackTrace();
			  
			  return -2;
		  }   

	      return 1;
	   }
   
   public void sendMail2(Account account) throws MessagingException {
	    
	    Email email = new Email();
	    
	    email.setReceiver(account.getMail());
	    
	    int account_id = dao.sequence();
	    account.setId(account_id);
	    account.setUser_id("USER" + account_id);
	    
		MimeMessage msg = sender.createMimeMessage();
		
		msg.setSubject("PMS 새로운 계정 안내 메일입니다.");
		
		msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
		
		String id = account.getUser_id();
		String pass = PasswordManager.getInstance().createPassword();
		StringBuilder sb = new StringBuilder();
		sb.append("환영합니다!! :)\n\n");
		sb.append("새 계정 아이디는 : " + id + " 입니다.\n\n");
		sb.append("새 비밀번호는 : " + pass + " 입니다.\n\n");
		sb.append("새로 생성된 비밀번호를 통해 접속 후 비밀번호를 변경해주세요.");
		account.setPassword(pass);

		
		
		dao.signinIns(account);
		
		msg.setText(sb.toString());
		
		sender.send(msg);
		
		}
}

