package model;

import java.io.Serializable;
public class Auction implements Serializable
{
    
    private int num;
    private String category;
    private String seller;
    private String pname;
    private String pdetail;
    private int immediateprice;
    private int bidunit;
    private int beginsprice;
    private String startdate;
    private String enddate; 
    private int deliverypay;
    private String winid;
    private String filename;
    private int filesize;
    
    
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdetail() {
		return pdetail;
	}
	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}
	public int getImmediateprice() {
		return immediateprice;
	}
	public void setImmediateprice(int immediateprice) {
		this.immediateprice = immediateprice;
	}
	public int getBidunit() {
		return bidunit;
	}
	public void setBidunit(int bidunit) {
		this.bidunit = bidunit;
	}
	public int getBeginsprice() {
		return beginsprice;
	}
	public void setBeginsprice(int beginsprice) {
		this.beginsprice = beginsprice;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getDeliverypay() {
		return deliverypay;
	}
	public void setDeliverypay(int deliverypay) {
		this.deliverypay = deliverypay;
	}
	public String getWinid() {
		return winid;
	}
	public void setWinid(String winid) {
		this.winid = winid;
	}
    
    

    
    
    
    
    
}
