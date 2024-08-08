package vss.beans;


//  admin_id, admin_pass, name, email, phone
public class Admin {
	
	private String admin_id, admin_pass, name, email, phone;

	public Admin(String admin_pass, String name, String email, String phone) {
		super();
		this.admin_pass = admin_pass;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pass() {
		return admin_pass;
	}

	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
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
	
	

}
