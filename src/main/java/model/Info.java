package model;

public class Info {
	private String id;
	private String gender;
	private String howToKnow;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHowToKnow() {
		return howToKnow;
	}
	public void setHowToKnow(String howToKnow) {
		this.howToKnow = howToKnow;
	}
	@Override
	public String toString() {
		return "Info [id=" + id + ", gender=" + gender + ", howToKnow=" + howToKnow + "]";
	}
	

	

}
