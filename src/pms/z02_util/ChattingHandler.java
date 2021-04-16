package pms.z02_util;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("chatHandler")
public class ChattingHandler extends TextWebSocketHandler {

	/* 접속한 사용자들에 대한 정보를 저장하는 전역변수 */
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	/* 접속 시 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		log(session.getId() + "님 접속합니다.");

		/* 접속한 id와 session을 누적처리 */
		users.put(session.getId(), session);
	}

	/* 메시지 전송 시 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
		log(session.getId() + "가 보낸 메시지 : " + message.getPayload());

		/* 각 접속자에게 메시지 전송 */
		for (WebSocketSession ws : users.values()) {
			ws.sendMessage(message);
			log(ws.getId() + "에게 메시지 전달");
		}
	}

	/* 접속 종료 시 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		log(session.getId() + " 접속을 종료합니다.");

		/* 접속한 사용자 목록에서 제외 처리 */
		users.remove(session.getId()); // 접속한 사용자에서 제외 처리
	}

	/* 예외 발생 시 */
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
		log(session.getId() + " 사용자 에러 발생 " + exception.getMessage());
	}

	/* 시간 표시 로그 처리 */
	private void log(String message) {
		System.out.println(new Date() + " : " + message);
	}
}
