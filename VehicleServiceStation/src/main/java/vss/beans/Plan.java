package vss.beans;

import java.sql.Date;

public class Plan {
	
	// plan_id, plan_name, duration, charge, date
	private int plan_id;
	private String plan_name, duration, charge;
	private Date date;

	public Plan(String plan_name, String duration, String charge, Date date) {
		super();
		this.plan_name = plan_name;
		this.duration = duration;
		this.charge = charge;
		this.date = date;
	}

	public Plan() {
		super();

	}
	
	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
