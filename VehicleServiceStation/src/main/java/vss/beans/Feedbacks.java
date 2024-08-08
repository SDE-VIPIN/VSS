package vss.beans;

import java.sql.Date;

// feedback_id, name, email, remarks, rating, date
public class Feedbacks {
	
	private int feedback_id, rating;
	private String name, email, remarks;
	private Date date;
	
	
	public Feedbacks(String name, String email, String remarks, int rating, Date date) {
		super();
//		this.feedback_id = feedback_id;
		this.name = name;
		this.email = email;
		this.remarks = remarks;
		this.rating = rating;
		this.date = date;
	}


	public Feedbacks() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getFeedback_id() {
		return feedback_id;
	}


	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
	
	
	
}
