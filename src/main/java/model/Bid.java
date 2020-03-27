package model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
public class Bid {

public Bid(int num, String id, Date biddate, int bidprice) {
	
		this.num = num;
		this.id = id;
		this.biddate = biddate;
		this.bidprice = bidprice;
	}
public Bid() {

}

private int num;
private String id;
@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
private Date biddate;
private int bidprice;
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public Date getBiddate() {
	return biddate;
}
public void setBiddate(Date biddate) {
	this.biddate = biddate;
}
public int getBidprice() {
	return bidprice;
}
public void setBidprice(int bidprice) {
	this.bidprice = bidprice;
}
@Override
public String toString() {
	return "Bid [num=" + num + ", id=" + id + ", biddate=" + biddate + ", bidprice=" + bidprice + "]";
}


}
