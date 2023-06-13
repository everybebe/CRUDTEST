package kr.or.ddit;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class AlarmHandler extends TextWebSocketHandler{
	// 로그인한 전체 세션 리스트
		private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
		
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("afterConnectionEstablished : " + session);
		// 세션 리스트에 로그인한 세션 담기
		sessionList.add(session); 
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload() ;
		TextMessage textMessage = new TextMessage(msg);
		// 로그인한 모든 사용자에게 접속 메시지 전달
		for(WebSocketSession sess : sessionList){
           sess.sendMessage(textMessage);
	    }
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed : " + session);
		sessionList.remove(session);
		
	}

	
}
