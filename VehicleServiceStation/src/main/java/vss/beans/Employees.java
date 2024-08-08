package vss.beans;

import java.sql.Date;

public class Employees {
	
	// serial_number, provider_id, emp_id, emp_name, email, phone, date
	private  String provider_id, emp_id, emp_name, email, phone;
	private int serial_number;
	private Date date;

	public Employees(String provider_id, String emp_id, String emp_name, String email, String phone, Date date) {
		super();

		this.emp_id = emp_id;
		this.provider_id = provider_id;
		this.emp_name = emp_name;
		this.email = email;
		this.phone = phone;
		this.date = date;
	}

	public Employees() {
		super();
		
	}
	
	
	
	public int getSerial_number() {
		return serial_number;
	}

	public void setSerial_number(int serial_number) {
		this.serial_number = serial_number;
	}

	public String getProvider_id() {
		return provider_id;
	}

	public void setProvider_id(String provider_id) {
		this.provider_id = provider_id;
	}
	
	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	
	
	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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
	
	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}
	
	

}
