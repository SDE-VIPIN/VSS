package vss.beans;

import java.sql.Date;

public class BookingService {

		// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response
	private String client_id, provider_id, booking_status, provider_response, pick_status, drop_status;
	private Date date;
	private int booking_id;
	String [] service_id;
	
	private Client client;
	private Services services;
	private Provider provider;
	private Employees employees;
	public BookingService(String client_id, String provider_id, Date date, String[] service_id) {
		super();
		this.client_id = client_id;
		this.provider_id = provider_id;
		this.date = date;
		this.service_id = service_id;
	}
	public BookingService() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Provider getProvider() {
		return provider;
	}
	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	public Employees getEmployees() {
		return employees;
	}
	public void setEmployees(Employees employees) {
		this.employees = employees;
	}
	
	
	public String getPick_status() {
		return pick_status;
	}
	public void setPick_status(String pick_status) {
		this.pick_status = pick_status;
	}
	public String getDrop_status() {
		return drop_status;
	}
	public void setDrop_status(String drop_status) {
		this.drop_status = drop_status;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	
	public Services getServices() {
		return services;
	}
	public void setServices(Services services) {
		this.services = services;
	}
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getProvider_id() {
		return provider_id;
	}
	public void setProvider_id(String provider_id) {
		this.provider_id = provider_id;
	}
	public String getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}
	public String getProvider_response() {
		return provider_response;
	}
	public void setProvider_response(String provider_response) {
		this.provider_response = provider_response;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String[] getService_id() {
		return service_id;
	}
	public void setService_id(String[] service_id) {
		this.service_id = service_id;
	}
	
	
}
