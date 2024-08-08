package vss.beans;

import java.sql.Date;

public class Offer_scheme {
	
	
	private Services sr;
	private Provider provider;
	// schemeId, providerId, serviceId, service, discount_offer, date
	private String providerId, discount_offer;
	private int schemeId, serviceId;
	private Date date;
	public Offer_scheme(String providerId, int serviceId, String discount_offer, Date date) {
		super();
		this.providerId = providerId;
		this.serviceId = serviceId;
		this.discount_offer = discount_offer;
		this.date = date;
	}
	
	public Offer_scheme() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public int getSchemeId() {
		return schemeId;
	}
	public void setSchemeId(int schemeId) {
		this.schemeId = schemeId;
	}
	public String getProviderId() {
		return providerId;
	}
	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}
	public String getDiscount_offer() {
		return discount_offer;
	}
	public void setDiscount_offer(String discount_offer) {
		this.discount_offer = discount_offer;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public Services getSr() {
		return sr;
	}

	public void setSr(Services sr) {
		this.sr = sr;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}
		
}
