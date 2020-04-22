package model;

import java.io.Serializable;

public class Category implements Serializable {

	private int num;
	private String name;
	private int refnum;
	private int total;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRefnum() {
		return refnum;
	}
	public void setRefnum(int refnum) {
		this.refnum = refnum;
	}
	@Override
	public String toString() {
		return "Category [num=" + num + ", name=" + name + ", refnum=" + refnum + "]";
	}
	
	
}
