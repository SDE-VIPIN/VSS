package vss.beans;

import java.sql.Date;

// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no, plan_name, payment_status

public class Provider {

	private String provider_id, provider_password, company_name, phone, owner, email, city, address, about,registration_no, plan_name, payment_status;

	private Date date;

	private Plan plan;
	
	public Provider(String provider_id, String provider_password, String company_name, String phone, String owner,
			String email, String city, String address, String about, Date date, String registration_no, String plan_name) {
		super();
		this.provider_id = provider_id;
		this.provider_password = provider_password;
		this.company_name = company_name;
		this.phone = phone;
		this.owner = owner;
		this.email = email;
		this.city = city;
		this.address = address;
		this.about = about;
		this.date = date;
		this.registration_no = registration_no;
		this.plan_name = plan_name;
	}

	public Provider() {
		// TODO Auto-generated constructor stub
	}

	public String getProvider_id() {
		return provider_id;
	}

	public void setProvider_id(String provider_id) {
		this.provider_id = provider_id;
	}

	public String getProvider_password() {
		return provider_password;
	}

	public void setProvider_password(String provider_password) {
		this.provider_password = provider_password;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}
	
	public String getRegistration_no() {
		return registration_no;
	}

	public void setRegistration_no(String registration_no) {
		this.registration_no = registration_no;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	
	

	
	
}
