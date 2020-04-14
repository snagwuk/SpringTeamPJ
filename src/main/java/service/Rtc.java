package service;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/wsServer")
public class Rtc {
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<Session>());

	@OnOpen
	public void OnOpen(Session session) {

		clients.add(session);
		System.out.println(session.toString());
	}

	@OnMessage
	public void onMessage(Session ss, byte[] img) {
		ByteBuffer buf = ByteBuffer.wrap(img);

		try {
			for (Session client : clients) {

			//	if (!client.equals(ss)) {
					client.getBasicRemote().sendBinary(buf);

			//	}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// �ڱ� �ڽ����״� ������ ����
	}

	@OnClose
	public void onClose(Session ss) {
		try {
			ss.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
