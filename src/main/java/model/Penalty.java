package model;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class Penalty {
	
	private String id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDateTime penaltyDate;
	private String penaltyReason;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDateTime penaltyEndDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public LocalDateTime getPenaltyDate() {
		return penaltyDate;
	}
	public void setPenaltyDate(LocalDateTime penaltyDate) {
		this.penaltyDate = penaltyDate;
	}
	public String getPenaltyReason() {
		return penaltyReason;
	}
	public void setPenaltyReason(String penaltyReason) {
		this.penaltyReason = penaltyReason;
	}
	public LocalDateTime getPenaltyEndDate() {
		return penaltyEndDate;
	}
	public void setPenaltyEndDate(LocalDateTime penaltyEndDate) {
		this.penaltyEndDate = penaltyEndDate;
	}
	@Override
	public String toString() {
		return "Penalty [id=" + id + ", penaltyDate=" + penaltyDate + ", penaltyReason=" + penaltyReason
				+ ", penaltyEndDate=" + penaltyEndDate + "]";
	}
	
	

}
