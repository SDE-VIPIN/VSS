package vss.dao;
import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vss.beans.BookingService;
import vss.beans.Client;
import vss.beans.Employees;
import vss.beans.Offer_scheme;
import vss.beans.Provider;
import vss.beans.Services;
import vss.dbinfo.DBConnection;

public class ProviderDao {
		
	// add employee method starts here		
	public int addEmpoyee(Employees emp) {		
						
	    Connection con = DBConnection.openConnection(); // connection established with database
		PreparedStatement ps = null; // interface, it is used to execute parameterized query.
		int status =0;
						
		// serial_number, provider_id, emp_id, emp_name, email, phone, date
		String insertQuery = "insert into employee(provider_id, emp_id, emp_name, email, phone, date)values(?,?,?,?,?,?)";
						
		try {
							
			ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 				
//MySQL-> compile the query and store the compiled query into buffer and give reference to ps
			ps.setString(1, emp.getProvider_id());
			ps.setString(2, emp.getEmp_id());
			ps.setString(3, emp.getEmp_name());
			ps.setString(4, emp.getEmail());
			ps.setString(5, emp.getPhone());
			ps.setDate(6, emp.getDate());
											
			System.out.println(ps);
			status = ps.executeUpdate(); // insert/update/delete same for all of these
			}
			catch(SQLException se){
				se.printStackTrace(); // it is used to print the exception when any raise.
			}
			finally {
					try {
						if(ps!=null) 
							ps.close();
						if(con!=null)
							con.close();					
						}
					catch(SQLException se) {										
						se.printStackTrace();
						status = 0; // if id is duplicate during registration
						}
					}			
					return status;
				}			

	// add employee method ends here
	
	// view employee method starts
			public ArrayList<Employees>viewEmployee(String providerId){
			ArrayList<Employees>empList = new ArrayList<Employees>();
			
			Employees emp =null;
			
			Connection con = DBConnection.openConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String select_Query = "select * from employee where provider_id=?";
		
			try {
			ps = con.prepareStatement(select_Query);
			ps.setString(1, providerId);
			rs = ps.executeQuery();
			while(rs.next())
			{	
				// serial_number, provider_id,emp_id, emp_name, email, phone, date
				String name =rs.getString("emp_name"); // fetching data from columns
				String email =rs.getString("email");
				String phone =rs.getString("phone");
				String eid =rs.getString("emp_id");
				String pid = rs.getString("provider_id");
				Date d =rs.getDate("date");
				
				System.out.println(ps);
				emp = new Employees(pid,eid,name,email,phone,d);	
				empList.add(emp);
			}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			return empList;
		}
				
	// view employee method ends
	
	// checking existing employee id starts here
	
			public boolean checkEmpId(String eid) {
				
				Connection con = DBConnection.openConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				try {
					String query = "select * from employee where emp_id=?";
					ps = con.prepareStatement(query);
					ps.setString(1, eid);
					
					rs = ps.executeQuery();
					
					if(rs.next())
						return true;
					
				}
				catch(SQLException se)
				{
					se.printStackTrace();
				}
				finally {
					
					try {
						if(rs!=null) 
							rs.close();
						if(ps!=null) 
							ps.close();
						if(con!=null)
							con.close();
						
					}
					catch(SQLException se) {				
						
						se.printStackTrace();
					}
				}
				
				return false;
			}		
			
    // checking existing employee id ends here
			
	// add offer method starts
			public int addoffer(Offer_scheme os) {
						
					String pid =os.getProviderId();
					int sid =os.getServiceId();
					String offer =os.getDiscount_offer();
					Date date = os.getDate();
					
					Connection con = DBConnection.openConnection(); // connection established with database
					PreparedStatement ps = null; // interface, it is used to execute parameterized query.
					int status =0;
					String insertQuery = "insert into offer_scheme(providerId, serviceId, discount_offer, date)values(?,?,?,?)";
					try {
						
						ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 
						ps.setString(1, os.getProviderId());
						ps.setInt(2, os.getServiceId());
						ps.setString(3, os.getDiscount_offer());
						ps.setDate(4, os.getDate());
						status = ps.executeUpdate(); // insert/update/delete same for all of these
					}
					catch(SQLException se){
						se.printStackTrace(); // it is used to print the exception when any raise.
					}
					finally {
						try {
							if(ps!=null) 
								ps.close();
							if(con!=null)
								con.close();	
						}
						catch(SQLException se) {					
							se.printStackTrace();
							status = 0; // if id is duplicate during registration
						}
					}
				return status;
			}	
	// add offer method ends
					
	//view offer method starts
	
			public ArrayList<Offer_scheme>viewOffer(String providerId){
			ArrayList<Offer_scheme>offerList = new ArrayList<Offer_scheme>();
			
			Offer_scheme os = null;
			
			Connection con = DBConnection.openConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			// offer_scheme --> schemeId, providerId, serviceId, discount_offer, date
			// services --> service_id, provider_id, service_name, charge, description
			String select_svc_Query = "select os.schemeId,os.providerId,os.serviceId,os.discount_offer,os.date,sr.service_name,sr.charge from offer_scheme os,services sr where os.serviceId=sr.service_id and providerId=?";
			
			try {
				ps = con.prepareStatement(select_svc_Query);
				ps.setString(1, providerId);
				rs = ps.executeQuery();
				while(rs.next())
				{
					
					int sid = rs.getInt("serviceId"); // fetching data from columns
					String offer =rs.getString("discount_offer");
					Date d =rs.getDate("date");
					
					Services s = new Services();
					s.setService_name(rs.getString("service_name"));
					s.setCharge(rs.getFloat("charge"));
					
					os = new Offer_scheme();
					os.setServiceId(sid);
					os.setDiscount_offer(offer);
					os.setDate(d);
					os.setSchemeId(rs.getInt("schemeId"));
					os.setSr(s);            // has a relationship
					offerList.add(os);      // adding object into ArrayList
				}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			
			return offerList;
		}
    // view offer method ends
	
	// delete offer method starts here
				
	public int deleteOffer(String[] sid, String pid) {
					
		Connection con = DBConnection.openConnection();
		PreparedStatement ps=  null;
		int status=0;
		String deleteQuery="delete from offer_scheme where schemeId=? and providerId=?";
					
		try {
			ps= con.prepareStatement(deleteQuery);
			
			for(int i=0;i<sid.length;i++){
				ps.setInt(1, Integer.parseInt(sid[i]));
				ps.setString(2, pid);
				ps.addBatch();
			}
						
			int[] arr=ps.executeBatch();
			for(int i=0;i<arr.length;i++){
				if(arr[i]>0)
				    status=1;
				else
					break;		
				}		
			} catch (SQLException e) {
						e.printStackTrace();		
			}
			return status;
	}
				
	// delete offer method ends here
	
	// confirmbooking method starts
		public int confirmBooking(String []bookingid) {
			
			Connection con = DBConnection.openConnection();
			PreparedStatement ps = null;
			int status =0;
			
			// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response, employee_id
			//String query = "update servicebooking set provider_response=?, employee_id=?, booking_status='true' where booking_id=?";
			
			
			//String query = "update servicebooking set provider_response=?, employee_id=?,pick_status='picked' where booking_id=?";
			String query = "update servicebooking set pick_status='picked' where booking_id=?";

			try {
				
				ps = con.prepareStatement(query);
				for(int i=0; i<bookingid.length;i++) {
					int bid = Integer.parseInt(bookingid[i]);
					
				ps.setInt(1, bid);
				ps.addBatch();	
			}
				status = ps.executeUpdate();
				int [] arr = ps.executeBatch();
				for(int i=0; i<arr.length; i++) {
					if(arr[i]>0)
						status =1;
					else
						 break;
			}
			}
			catch(SQLException se){
				se.printStackTrace(); // it is used to print the exception when any raise.
				status = 0;		
			}
			finally {	
				try {
					if(ps!=null) 
						ps.close();
					if(con!=null)
						con.close();					
				}
				catch(SQLException se) {										
					se.printStackTrace();
					status = 0; // if id is duplicate during registration
				}
			}			
			return status;
		}

	// confirmbooking method ends
		
	// booking request method starts
				public int bookingRequest(String pid, String eid, String message, String []bookingid) {
					
					Connection con = DBConnection.openConnection();
					PreparedStatement ps = null;
					int status =0;
					
					// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response, employee_id
					String query = "update servicebooking set provider_response=?, employee_id=?, booking_status='true' where booking_id=?";
					
					
					//String query = "update servicebooking set provider_response=?, employee_id=?, booking_status='true',pick_status='picked' where booking_id=?";

					try {
						
						ps = con.prepareStatement(query);
						for(int i=0; i<bookingid.length;i++) {
							int bid = Integer.parseInt(bookingid[i]);
							
						ps.setString(1, message);
						ps.setString(2, eid);
						ps.setInt(3, bid);
						ps.addBatch();	
					}
						status = ps.executeUpdate();
						int [] arr = ps.executeBatch();
						for(int i=0; i<arr.length; i++) {
							if(arr[i]>0)
								status =1;
							else
								 break;
					}
					}
					catch(SQLException se){
						se.printStackTrace(); // it is used to print the exception when any raise.
						status = 0;		
					}
					finally {	
						try {
							if(ps!=null) 
								ps.close();
							if(con!=null)
								con.close();					
						}
						catch(SQLException se) {										
							se.printStackTrace();
							status = 0; // if id is duplicate during registration
						}
					}			
					return status;
				}

			// booking request method ends
	
	// view confirm booking method ends
		
	public ArrayList<BookingService>viewConfirmedBooking(String provider_Id){
			ArrayList<BookingService>confirmedList = new ArrayList<BookingService>();
			
			Client c = null;
			Services s = null;
			Employees e = null;
			BookingService bs = null;
			
			Connection con = DBConnection.openConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response
			// client_id, client_pass, name, email, phone, city, address, date
			// service_id, provider_id, service_name, charge, description
			// serial_number, provider_id, emp_id, emp_name, email, phone, date
			String query = "select e.emp_name,c.name,c.phone,c.email,c.address,c.city,b.booking_status,b.booking_id,b.date,s.service_name,s.charge from client c,servicebooking b,employee e,services s where b.client_id=c.client_id and b.provider_id=e.provider_id and b.service_id=s.service_id and  b.provider_id=? and b.booking_status='true'";
			
			try {
				ps = con.prepareStatement(query);
				ps.setString(1, provider_Id);
				rs = ps.executeQuery();
				while(rs.next())
				{
					String name =rs.getString("name");
					String email =rs.getString("email");
					String phone =rs.getString("phone");
					String address = rs.getString("address");
					String city = rs.getString("city");
					
					
					c = new Client();
					c.setName(name);
					c.setEmail(email);
					c.setPhone(phone);
					c.setAddress(address);
					c.setCity(city);           
					
					s = new Services();
					String servicename = rs.getString("service_name");
					String price =rs.getString("charge");
					float charge = Float.parseFloat(price);
					s.setService_name(servicename);
					s.setCharge(charge);
					
					e = new Employees();
					String ename = rs.getString("emp_name");
					e.setEmp_name(ename);
					
					bs = new BookingService();
					Date date = rs.getDate("date");
					bs.setBooking_id(rs.getInt("booking_id"));
					bs.setDate(date);
					bs.setClient(c);           // has a relationship
					bs.setServices(s);         // has a relationship
					bs.setEmployees(e);        // has a relationship
					confirmedList.add(bs);     // adding object into ArrayList
				}
				System.out.println(confirmedList.size());
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			return confirmedList;
		}
	// view confirm booking method ends

	
	// view dropped booking method starts
		public ArrayList<BookingService>viewDroppededBooking(String provider_Id){
			ArrayList<BookingService>confirmedList = new ArrayList<BookingService>();
			
			Client c = null;
			Services s = null;
			Employees e = null;
			BookingService bs = null;
			
			Connection con = DBConnection.openConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response, employee_id, pick_status, drop_status
			// client_id, client_pass, name, email, phone, city, address, date
			// service_id, provider_id, service_name, charge, description
			// serial_number, provider_id, emp_id, emp_name, email, phone, date
			String query = "select b.booking_id,b.pick_status,b.drop_status,e.emp_name,c.name,c.phone,c.email,c.address,c.city,b.booking_status,b.date,s.service_name,s.charge from client c,servicebooking b,employee e,services s where b.client_id=c.client_id and b.provider_id=e.provider_id and b.service_id=s.service_id and  b.provider_id=? and b.drop_status='dropped'";
			
			try {
				ps = con.prepareStatement(query);
				ps.setString(1, provider_Id);
				rs = ps.executeQuery();
				while(rs.next())
				{
					String name =rs.getString("name");
					String email =rs.getString("email");
					String phone =rs.getString("phone");
					String address = rs.getString("address");
					String city = rs.getString("city");
					
					
					c = new Client();
					c.setName(name);
					c.setEmail(email);
					c.setPhone(phone);
					c.setAddress(address);
					c.setCity(city);           
					
					s = new Services();
					String servicename = rs.getString("service_name");
					String price =rs.getString("charge");
					float charge = Float.parseFloat(price);
					s.setService_name(servicename);
					s.setCharge(charge);
					
					e = new Employees();
					String ename = rs.getString("emp_name");
					e.setEmp_name(ename);
					
					bs = new BookingService();
					bs.setPick_status(rs.getString("drop_status"));
					bs.setDrop_status(rs.getString("drop_status"));
					bs.setBooking_id(rs.getInt("booking_id"));
					Date date = rs.getDate("date");
					bs.setDate(date);
					bs.setClient(c);           // has a relationship
					bs.setServices(s);         // has a relationship
					bs.setEmployees(e);        // has a relationship
					confirmedList.add(bs);     // adding object into ArrayList
				}
				System.out.println(confirmedList.size());
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			return confirmedList;
		}
		
		// view dropped booking method starts
	
	// view picked booking method starts
	public ArrayList<BookingService>viewPickedBooking(String provider_Id){
		ArrayList<BookingService>confirmedList = new ArrayList<BookingService>();
		
		Client c = null;
		Services s = null;
		Employees e = null;
		BookingService bs = null;
		
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response
		// client_id, client_pass, name, email, phone, city, address, date
		// service_id, provider_id, service_name, charge, description
		// serial_number, provider_id, emp_id, emp_name, email, phone, date
		String query = "select b.booking_id,b.pick_status,e.emp_name,c.name,c.phone,c.email,c.address,c.city,b.booking_status,b.date,s.service_name,s.charge from client c,servicebooking b,employee e,services s where b.client_id=c.client_id and b.provider_id=e.provider_id and b.service_id=s.service_id and  b.provider_id=? and b.pick_status='picked'";
		
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, provider_Id);
			rs = ps.executeQuery();
			while(rs.next())
			{
				String name =rs.getString("name");
				String email =rs.getString("email");
				String phone =rs.getString("phone");
				String address = rs.getString("address");
				String city = rs.getString("city");
				
				
				c = new Client();
				c.setName(name);
				c.setEmail(email);
				c.setPhone(phone);
				c.setAddress(address);
				c.setCity(city);           
				
				s = new Services();
				String servicename = rs.getString("service_name");
				String price =rs.getString("charge");
				float charge = Float.parseFloat(price);
				s.setService_name(servicename);
				s.setCharge(charge);
				
				e = new Employees();
				String ename = rs.getString("emp_name");
				e.setEmp_name(ename);
				
				bs = new BookingService();
				bs.setPick_status(rs.getString("pick_status"));
				bs.setBooking_id(rs.getInt("booking_id"));
				Date date = rs.getDate("date");
				bs.setDate(date);
				bs.setClient(c);           // has a relationship
				bs.setServices(s);         // has a relationship
				bs.setEmployees(e);        // has a relationship
				confirmedList.add(bs);     // adding object into ArrayList
			}
			System.out.println(confirmedList.size());
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return confirmedList;
	}
	
	// view picked booking method starts

	// picked booking method starts
			public int PickedBooking(String []bookingid) {
				
				Connection con = DBConnection.openConnection();
				PreparedStatement ps = null;
				int status =0;
				
				// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response, employee_id
				//String query = "update servicebooking set provider_response=?, employee_id=?, booking_status='true' where booking_id=?";
				
				
				//String query = "update servicebooking set provider_response=?, employee_id=?,pick_status='picked' where booking_id=?";
				String query = "update servicebooking set drop_status='dropped' where booking_id=?";

				try {
					
					ps = con.prepareStatement(query);
					for(int i=0; i<bookingid.length;i++) {
						int bid = Integer.parseInt(bookingid[i]);
						
					ps.setInt(1, bid);
					ps.addBatch();	
				}
					status = ps.executeUpdate();
					int [] arr = ps.executeBatch();
					for(int i=0; i<arr.length; i++) {
						if(arr[i]>0)
							status =1;
						else
							 break;
				}
				}
				catch(SQLException se){
					se.printStackTrace(); // it is used to print the exception when any raise.
					status = 0;		
				}
				finally {	
					try {
						if(ps!=null) 
							ps.close();
						if(con!=null)
							con.close();					
					}
					catch(SQLException se) {										
						se.printStackTrace();
						status = 0; // if id is duplicate during registration
					}
				}			
				return status;
			}

		// picked booking method ends
	
	//view bookings method starts
	
			public ArrayList<BookingService>viewBooking(String provider_Id){
			ArrayList<BookingService>requestList = new ArrayList<BookingService>();
			
			Client c = null;
			Services s = null;
			BookingService bs = null;
			
			Connection con = DBConnection.openConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response
			// client_id, client_pass, name, email, phone, city, address, date
			// service_id, provider_id, service_name, charge, description
			String select_svc_Query = "select c.client_id,c.name,c.phone,c.email,c.address,c.city,b.booking_id,b.provider_id,b.booking_status,b.date,s.service_id,s.service_name,s.charge from client c,servicebooking b,services s where b.client_id=c.client_id and b.provider_id=? and b.booking_status='false' and b.service_id=s.service_id";
			
			try {
				ps = con.prepareStatement(select_svc_Query);
				ps.setString(1, provider_Id);
				rs = ps.executeQuery();
				while(rs.next())
				{
					String cid= rs.getString("client_id");
					String name =rs.getString("name");
					String email =rs.getString("email");
					String phone =rs.getString("phone");
					String address = rs.getString("address");
					String city = rs.getString("city");
					
					
					c = new Client();
					c.setClient_id(cid);
					c.setName(name);
					c.setEmail(email);
					c.setPhone(phone);
					c.setAddress(address);
					c.setCity(city);           
					
					s = new Services();
					String sid= rs.getString("service_id");
					int id = Integer.parseInt(sid);
					String servicename = rs.getString("service_name");
					String price =rs.getString("charge");
					float charge = Float.parseFloat(price);
					s.setService_id(id);
					s.setService_id(0);
					s.setService_name(servicename);
					s.setCharge(charge);
					
					bs = new BookingService();
					Date date = rs.getDate("date");
					bs.setDate(date);
					bs.setBooking_id(rs.getInt("booking_id"));
					System.out.println(address+" "+servicename+" "+charge+" "+date);
					bs.setClient(c); // has a relationship
					bs.setServices(s); // has a relationship
					requestList.add(bs);      // adding object into ArrayList
				}
				System.out.println(requestList.size());
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			return requestList;
		}	
	// view booking method ends
	
	//Services add method start
	public int addServices(Services s) {	
		    	
				String id =s.getProvider_id();
				String service =s.getService_name();
				float cost =s.getCharge();
				String desc =s.getDescription();
				
				System.out.println("From dao class output");
				System.out.println(id+ " " +service +" " +cost+ " "+desc);
				
				Connection con = DBConnection.openConnection(); // connection established with database
				String insertQuery = "insert into services(provider_id, service_name, charge, description)values(?,?,?,?)";
				int status =0;
				PreparedStatement ps = null; // interface, it is used to execute parameterized query.
				try {
					
					ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 
					//MySQL-> compile the query and store the compiled query into buffer and give reference to ps
					ps.setString(1, s.getProvider_id());
					ps.setString(2, s.getService_name());
					ps.setFloat(3, s.getCharge());
					ps.setString(4, s.getDescription());
					
					// ps.setDate(10, p.getDate());
					
					System.out.println(ps);
					status = ps.executeUpdate(); // insert/update/delete same for all of these
				}
				
				catch(SQLException se){
					se.printStackTrace(); // it is used to print the exception when any raise.
				}
				
				finally {
					
					try {
						if(ps!=null) 
							ps.close();
						if(con!=null)
							con.close();
						
					}
					catch(SQLException se) {				
						
						se.printStackTrace();
						status = 0; // if id is duplicate during registration
					}
				}
				
				
				
				return status;
			} 
	// service add method closed here
			
	// view Services Method starts
	public ArrayList<Services>viewServices(String providerId){
		ArrayList<Services>serviceList = new ArrayList<Services>();
		
		Services services = null;
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String select_svc_Query = "select * from services where provider_id=?";
		
		try {
			
			//service_id, provider_id, service_name, charge, description
			ps = con.prepareStatement(select_svc_Query);
			ps.setString(1, providerId);
			rs = ps.executeQuery();
			while(rs.next())
			{
				// service_id, provider_id, service_name, charge, description
				String sid = rs.getString("service_id");
				String sname =rs.getString("service_name"); // fetching data from columns
				String c =rs.getString("charge");
				float cost = Float.parseFloat(c);
				String desc =rs.getString("description");
				
				services = new Services(sid,sname,cost,desc);
				services.setService_id(rs.getInt("service_id"));
				serviceList.add(services);
			}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return serviceList;
	}
	
	// view Services Method ends
	
	// view profile method
	
		public Provider viewProfile(String id) {
			
			Connection con = DBConnection.openConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String selectQuery = "select * from provider where provider_id=?";
			Provider pdr = null;
			
			try {
				ps =con.prepareStatement(selectQuery);
				ps.setString(1,id);
				System.out.println(ps);
				
				rs = ps.executeQuery();
				
				rs.next(); // put the cursor on the specified row
				// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no
				
				String name = rs.getString("owner");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String pass = rs.getString("provider_password");
				String cname = rs.getString("company_name");
				String city = rs.getString("city");
				String add = rs.getString("address");
				String abt = rs.getString("about");
				String registration_no = rs.getString("registration_no");
				
				pdr = new Provider();	// Provider class object
				pdr.setEmail(email);	// setting values in Provider object
				pdr.setOwner(name);
				pdr.setPhone(phone);
				pdr.setProvider_password(pass);
				pdr.setCompany_name(cname);
				pdr.setCity(city);
				pdr.setAbout(abt);
				pdr.setAddress(add);
				pdr.setRegistration_no(registration_no);
				
				System.out.println("registration no in bean class"+pdr.getRegistration_no());
			}
			
			catch(SQLException se) {
				se.printStackTrace();
			}
			
			finally {
				
				try {
					if(ps!=null) 
						ps.close();
					if(con!=null)
						con.close();
					
				}
				catch(SQLException se) {				
					
					se.printStackTrace();
				}
				
				
			}
			
			return pdr; 	//returning Provider class object
		}
	// view profile method ends
	
	// provider presence checking method in database starts
	public boolean login(String id, String pass) {

		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from provider where provider_id=? and provider_password=? and payment_status='paid'";
		
		PreparedStatement ps = null;
		ResultSet rs = null; // if we want to return rows
		try {
			ps =con.prepareStatement(selectQuery);
			ps.setString(1,id);
			ps.setString(2,pass);
			
			System.out.println(ps); // to test the query
			
			rs = ps.executeQuery();
			if(rs.next()== true) // it will put the cursor on the row and check whether there is data or not
				return true; // if there is data it will return true
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return false;
	}
	// provider presence checking method in database ends
	
	// provider registration method starts
public int addProvider(Provider p) 
	
	{		
		String name =p.getProvider_id();
		String pass =p.getProvider_password();
		String com =p.getCompany_name();
		String ph =p.getPhone();
		String ow =p.getOwner();
		String em =p.getEmail();
		String cty =p.getCity();
		String add =p.getAddress();
		String abt =p.getAbout();
		Date date = p.getDate();
		String reg = p.getRegistration_no();
		
		System.out.println("From dao class output");
		System.out.println(name+ " " +pass +" " +com+ " "+ph+" "+ow+" "+em+" "+cty+" "+add+" "+abt+" "+date+" "+reg);
		
		Connection con = DBConnection.openConnection(); // connection established with database
		String insertQuery = "insert into provider(provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no, plan_name)values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int status =0;
		PreparedStatement ps = null; // interface, it is used to execute parameterized query.
		try {
			
			ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 
			//MySQL-> compile the query and store the compiled query into buffer and give reference to ps
			ps.setString(1, p.getProvider_id());
			ps.setString(2, p.getProvider_password());
			ps.setString(3, p.getCompany_name());
			ps.setString(4, p.getPhone());
			ps.setString(5, p.getOwner());
			ps.setString(6, p.getEmail());
			ps.setString(7, p.getCity().toLowerCase());
			ps.setString(8, p.getAddress());
			ps.setString(9, p.getAbout());
			ps.setDate(10, p.getDate());
			ps.setString(11, p.getRegistration_no());
			ps.setString(12, p.getPlan_name());
			
			System.out.println(ps);
			status = ps.executeUpdate(); // insert/update/delete same for all of these
		}
		
		catch(SQLException se){
			se.printStackTrace(); // it is used to print the exception when any raise.
		}
		
		finally {
			
			try {
				if(ps!=null) 
					ps.close();
				if(con!=null)
					con.close();
				
			}
			catch(SQLException se) {				
				
				se.printStackTrace();
				status = 0; // if id is duplicate during registration
			}
		}
		return status;
	} 
  //provider registration method ends

  //Provider's edit profile method

  public int editProfile(Provider a) {

	// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date
	Connection con = DBConnection.openConnection();
	PreparedStatement ps = null;
	String updateQuery = "update provider set owner=?,email=?,provider_password=?,phone=?,company_name=?,city=?,address=?,about=? where provider_id=?";
	int status = 0;
	
	try {
		ps = con.prepareStatement(updateQuery);
		ps.setString(1, a.getOwner());
		ps.setString(2, a.getEmail());
		ps.setString(3, a.getProvider_password());
		ps.setString(4, a.getPhone());
		ps.setString(5, a.getCompany_name());
		ps.setString(6, a.getCity());
		ps.setString(7, a.getAddress());
		ps.setString(8, a.getAbout());
		ps.setString(9, a.getProvider_id());
		
		status = ps.executeUpdate();	
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	return status;
}

public boolean checkId(String pid) {
	
	Connection con = DBConnection.openConnection();
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		String query = "select * from provider where provider_id=?";
		ps = con.prepareStatement(query);
		ps.setString(1, pid);
		
		rs = ps.executeQuery();
		
		if(rs.next())
			return true;
		
	}
	catch(SQLException se)
	{
		se.printStackTrace();
	}
	finally {
		
		try {
			if(rs!=null) 
				rs.close();
			if(ps!=null) 
				ps.close();
			if(con!=null)
				con.close();
			
		}
		catch(SQLException se) {				
			
			se.printStackTrace();
		}
	}
	
	return false;
}
}
