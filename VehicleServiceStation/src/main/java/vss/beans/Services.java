package vss.beans;

public class Services {

		// service_id, provider_id, service_name, charge, description
		private String provider_id, service_name, description;
		private Float charge;
		private int service_id;
		
		public int getService_id() {
			return service_id;
		}

		public void setService_id(int service_id) {
			this.service_id = service_id;
		}

		public Services(String provider_id, String service_name, float charge, String description) {
			super();
			this.provider_id = provider_id;
			this.service_name = service_name;
			this.charge = charge;
			this.description = description;
			
		}

		public Services() {
			super();
			// TODO Auto-generated constructor stub
		}

		public String getProvider_id() {
			return provider_id;
		}

		public void setProvider_id(String provider_id) {
			this.provider_id = provider_id;
		}

		public String getService_name() {
			return service_name;
		}

		public void setService_name(String service_name) {
			this.service_name = service_name;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Float getCharge() {
			return charge;
		}

		public void setCharge(Float charge) {
			this.charge = charge;
		}
		
		
		
		
}
