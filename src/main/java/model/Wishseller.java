package model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class Wishseller implements Serializable{

private String seller;
private String id;
private Date registtime;
public String getSeller() {
	return seller;
}
public String getId() {
	return id;
}
public Date getRegisttime() {
	return registtime;
}
public void setSeller(String seller) {
	this.seller = seller;
}
public void setId(String id) {
	this.id = id;
}
public void setRegisttime(Date registtime) {
	this.registtime = registtime;
} 
	
}
