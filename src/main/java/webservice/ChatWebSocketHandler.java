package webservice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import model.Amessage;
import model.User;
import service.MybatisMessageDao;


public class ChatWebSocketHandler extends TextWebSocketHandler{

	@Autowired
	MybatisMessageDao msDao;
	
	private List<WebSocketSession> connectedUser = new ArrayList<WebSocketSession>();
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	
		
		log(session.getId()+"연결됨");
		users.put(session.getId(), session);
		connectedUser.add(session);
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId()+"연결종료");
		connectedUser.remove(session);
		users.remove(session.getId());
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
	
		 Map<String, Object> map = null;
		System.out.println("@@@@@@111@@@@@@@@@@@@");
		System.out.println(message.getPayload());
		Amessage amssage = Amessage.convertMessage(message.getPayload());
	
		Amessage ms = new Amessage();
		ms.setNum(amssage.getNum());
		ms.setSender(amssage.getSender());
		ms.setSendtime(amssage.getSendtime());
		ms.setReceiver(amssage.getReceiver());
		ms.setContent(amssage.getContent());
		System.out.println("@@@@@@@@@222@@@@@@@@@@@@@@");
		msDao.insertmessage(ms);
//		
//		log(session.getId()+"로부터 메시지수신"+message.getPayload());
		

		
		
	
	for(WebSocketSession s : users.values()){
		Gson gson = new Gson();
        String msgJson = gson.toJson(amssage);
        s.sendMessage(new TextMessage(msgJson));
		log(s.getId()+"에 메시지 발송"+message.getPayload());
		
	         }

		
		
	/*	System.out.println(s);
		Gson gson = new Gson();
        String msgJson = gson.toJson(amssage);
        s.sendMessage(new TextMessage(msgJson));
		log(s.getId()+"에 메시지 발송"+message.getPayload());
		*/
	}
	
	
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId()+"익셉션 발생"+exception.getMessage());
	}
	private void log(String logmsg) {
		System.out.println(new Date()+" : "+logmsg);
		
	}

	
}
