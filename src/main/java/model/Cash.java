package model;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class Cash implements Serializable {
    
        private int cnum;
	private String id;
	private int cash;
	private String reason;
	@DateTimeFormat(pattern = "yyyy-MM-dd_HH:mm:ss")
	private LocalDateTime  cashdate;
	private int cstatus;

    	public int getCnum()
        {
            return cnum;
        }
        public void setCnum(int cnum)
        {
            this.cnum = cnum;
        }
        public int getCstatus()
        {
            return cstatus;
        }
        public void setCstatus(int cstatus)
        {
            this.cstatus = cstatus;
        }
        public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public LocalDateTime getCashdate() {
		return cashdate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd_HH:mm:ss")
	public void setCashdate(LocalDateTime cashdate) {
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
    @Override
    public String toString()
    {
        return "Cash [id=" + id + ", cash=" + cash + ", reason=" + reason + ", cashdate=" + cashdate + "]";
    }
	
	
	

}
