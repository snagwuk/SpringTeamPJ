package model;

import java.util.Date;

public class Cash {
	
	private String id;
	private Date cashdate;
	private int cash;
	private String reason;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getCashdate() {
		return cashdate;
	}
	public void setCashdate(Date cashdate) {
		this.cashdate = cashdate;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	

}
