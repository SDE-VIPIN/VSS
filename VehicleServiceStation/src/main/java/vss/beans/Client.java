package vss.beans;

import java.sql.Date;

// client_id, client_pass, name, email, phone, city, address, date

public class Client {
	
	private String client_id, client_pass, name, email, phone, city, address;
	private Date date;
	
	public Client(String client_id, String client_pass, String name, String email, String phone, String city,
			String address, Date date) {
		super();
		this.client_id = client_id;
		this.client_pass = client_pass;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.city = city;
		this.address = address;
		this.date = date;
	}

	public Client() {
		// TODO Auto-generated constructor stub
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getClient_pass() {
		return client_pass;
	}

	public void setClient_pass(String client_pass) {
		this.client_pass = client_pass;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	

}
