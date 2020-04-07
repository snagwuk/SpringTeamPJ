package model;

import java.io.Serializable;
import java.util.Date;

public class Member implements Serializable{
	
	private String id;
	private String password;
	private String name;
	private Date registdate;
	private String phone;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private int position;
	private int status;
	private String account;
	private String bank;
	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", registdate=" + registdate
				+ ", phone=" + phone + ", postcode=" + postcode + ", address=" + address + ", detailAddress="
				+ detailAddress + ", extraAddress=" + extraAddress + ", position=" + position + ", status=" + status
				+ ", account=" + account + ", bank=" + bank + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public boolean matchPassword(String inputPassword){
		return password.equals(inputPassword);
	}
	
}
