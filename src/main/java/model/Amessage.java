package model;

import java.io.Serializable;
import java.util.Date;


import org.springframework.stereotype.Component;

import com.google.gson.Gson;


@Component
public class Amessage  implements Serializable{

	private int num;
	private String sender;
	private String receiver;
	private String content;
	private Date sendtime;
	private Date readtime;
	private int readcount;
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendtime() {
		return sendtime;
	}
	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}
	public Date getReadtime() {
		return readtime;
	}
	public void setReadtime(Date readtime) {
		this.readtime = readtime;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public static Amessage convertMessage(String source) {
		Amessage message = new Amessage();
		Gson gson = new Gson();
		message = gson.fromJson(source,  Amessage.class);
		return message;
	}
	@Override
	public String toString() {
		return "Amessage [sender=" + sender + ", receiver=" + receiver + ", content=" + content + ", sendtime="
				+ sendtime + ", readtime=" + readtime + ", readcount=" + readcount + "]";
	}
	
}
