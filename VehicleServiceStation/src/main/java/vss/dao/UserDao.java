package vss.dao;
import vss.beans.BookingService;
import vss.beans.Client;
import vss.beans.Contacts;
import vss.beans.Employees;
import vss.beans.Feedbacks;
import vss.beans.Offer_scheme;
import vss.beans.Provider;
import vss.beans.Services;
import vss.dbinfo.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class UserDao {
	
	

	
	
	//search method starts
	
	public ArrayList<Provider>searchProvider(String cname){
	ArrayList<Provider>searchList = new ArrayList<Provider>();
	
	Provider pdr = null;
	
	Connection con = DBConnection.openConnection();
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String select_svc_Query = "select * from provider where city =?";
	
	try {
		ps = con.prepareStatement(select_svc_Query);
		ps.setString(1, cname);
		System.out.println(ps);
		rs = ps.executeQuery();
		
		while(rs.next())
		{
			
			// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no
			String name = rs.getString("owner");
			String companyname = rs.getString("company_name"); // fetching data from columns
			String phone =rs.getString("phone");
			String email =rs.getString("email");
			String city =rs.getString("city");
			String address =rs.getString("address");
			String about =rs.getString("about");
			System.out.println("provider id is"+rs.getString("provider_id"));
			pdr=new Provider();
			pdr.setOwner(name);
			pdr.setCompany_name(companyname);
			pdr.setPhone(phone);
			pdr.setEmail(email);
			pdr.setCity(city);
			pdr.setAddress(address);
			pdr.setAbout(about);
			pdr.setProvider_id(rs.getString("provider_id"));
			searchList.add(pdr);      // adding object into ArrayList
		}
		
		System.out.println(searchList.size());
		
	}
	catch(SQLException se) {
		//se.printStackTrace();
		System.out.println(se);
		
	}
	
	return searchList;
}


// search method ends
	
	
	
	
	
	
	
	
	
	 //view offer method starts
	
		public ArrayList<Offer_scheme>viewOffer(String serviceId){
		ArrayList<Offer_scheme>offerList = new ArrayList<Offer_scheme>();
		
		Offer_scheme os = null;
		
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String select_svc_Query = "select os.providerId,os.serviceId,os.discount_offer,os.date,sr.service_name,sr.charge from offer_scheme os,services sr where os.serviceId=sr.service_id and os.serviceId=?";
		
		try {
			ps = con.prepareStatement(select_svc_Query);
			ps.setString(1, serviceId);
			rs = ps.executeQuery();
			while(rs.next())
			{
				String pid = rs.getString("providerId");
				int sid = rs.getInt("serviceId"); // fetching data from columns
				String offer =rs.getString("discount_offer");
				Date d =rs.getDate("date");
				
				Services s = new Services();
				s.setService_name(rs.getString("service_name"));
				s.setCharge(rs.getFloat("charge"));
				
				os = new Offer_scheme();
				os.setProviderId(pid);
				os.setServiceId(sid);
				os.setDiscount_offer(offer);
				os.setDate(d);
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
	
	
	
	
	// view Services Method starts
	
				public ArrayList<Services>viewServices(String provider_id){
					ArrayList<Services> serviceList = new ArrayList<Services>();
					
					Services services = null;
					
					Connection con = DBConnection.openConnection();
					PreparedStatement ps = null;
					ResultSet rs = null;
					
					String select_svc_Query = "select * from services where provider_id=?";
					
					try {
						
						//service_id, provider_id, service_name, charge, description
						ps = con.prepareStatement(select_svc_Query);
						ps.setString(1, provider_id);
						rs = ps.executeQuery();
						while(rs.next())
						{
							
							String sname =rs.getString("service_name"); // fetching data from columns
							String c =rs.getString("charge");
							float cost = Float.parseFloat(c);
							String desc =rs.getString("description");
							String pid = rs.getString("provider_id");
							
							services = new Services(pid,sname,cost,desc);
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
	
				
	
	// view Provider Method starts
	
			public ArrayList<Provider>viewProvider(){
				ArrayList<Provider>providerList = new ArrayList<Provider>();
				
				Provider provider = null;
				
				Connection con = DBConnection.openConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				String select_f_Query = "select * from provider where payment_status='paid'";
				
				try {
					// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date
					ps = con.prepareStatement(select_f_Query);
					rs = ps.executeQuery();
					while(rs.next())
					{
						String providerid=rs.getString("provider_id");
						System.out.println("Provider id is "+providerid);
						String cName =rs.getString("company_name"); // fetching data from columns
						String pName =rs.getString("owner");
						String phone =rs.getString("phone");
						String email =rs.getString("email");
						String city =rs.getString("city");
						String add =rs.getString("address");
						String abt =rs.getString("about");
						
						
						
						System.out.println("Provider id is "+providerid);
						provider = new Provider();
						
						provider.setCompany_name(cName);
						provider.setOwner(pName);
						provider.setPhone(phone);
						provider.setEmail(email);
						provider.setCity(city);
						provider.setAddress(add);
						provider.setAbout(abt);
						provider.setProvider_id(providerid);
						
						
						
						providerList.add(provider);
					}
				}
				catch(SQLException se) {
					se.printStackTrace();
				}
				
				return providerList;
			}
			
			// view Providers Method ends
	
	
	// view Feedback Method starts
	
		public ArrayList<Feedbacks>viewFeedbacks(){
			ArrayList<Feedbacks>feedbackList = new ArrayList<Feedbacks>();
			
			Feedbacks feedback = new Feedbacks();
			
			Connection con = DBConnection.openConnection();
			String select_f_Query = "select * from feedbacks where rating=5 or rating=4 order by date desc limit 12"; // if rating is of varchar data type the we write 5 or 4 in '' i.e. '5'
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				// feedback_id, name, email, remarks, rating, date
				ps = con.prepareStatement(select_f_Query);
				rs = ps.executeQuery();
				while(rs.next())
				{
					
//					String id = rs.getString("feedback_id");
//					int id1 = Integer.parseInt(id);
					String name =rs.getString("name"); // fetching data from columns
					String email =rs.getString("email");
					String remark =rs.getString("remarks");
					String r =rs.getString("rating");
					int rating = Integer.parseInt(r);
					Date d =rs.getDate("date");
					
					feedback = new Feedbacks(name,email,remark,rating,d);
					feedbackList.add(feedback);
				}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			
			return feedbackList;
		}
		
		// view Feedback Method ends

	public int addContact(Contacts c) 
	
	{		
		String name =c.getUser_name();
		String email =c.getUser_email();
		String phone =c.getUser_phone();
		String query =c.getUser_question();
		
//		System.out.println("From dao class output");
//		System.out.println(name+ " " +email +" " +phone+ " " +query);
		
		Connection con = DBConnection.openConnection(); // connection established with database
		String insertQuery = "insert into contacts(user_name, user_email, user_phone, user_question, date)values(?,?,?,?,?)";
		int status =0;
		PreparedStatement ps = null; // interface, it is used to execute parameterized query.
		try {
			
			ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 
			//MySQL-> compile the query and store the compiled query into buffer and give reference to ps
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, query);
			ps.setDate(5, c.getDate());
			
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
			}
		}
		
		
		
		return status;
	} // method closed here

	
	// addFeedback method starts here
	public int addFeedback(Feedbacks f) {	
//		String name =f.getName();
//		String email =f.getEmail();
//		String remark =f.getRemarks();
//		int rating =f.getRating();				
		
//		System.out.println("From dao class output");
//		System.out.println(name+ " " +email +" " +remark+ " " +rating);
		
		// establishing connection with database
		Connection conn = DBConnection.openConnection();
		String insertFQuery = "insert into feedbacks(name, email, remarks, rating, date)values(?,?,?,?,?)";
		int status = 0;
		PreparedStatement pstmnt = null;
		
		try {
			pstmnt =conn.prepareStatement(insertFQuery);
			
			pstmnt.setString(1, f.getName());
			pstmnt.setString(2, f.getEmail());
			pstmnt.setString(3, f.getRemarks());
			pstmnt.setInt(4, f.getRating());
			pstmnt.setDate(5, f.getDate());
			
			System.out.println(pstmnt);
			status = pstmnt.executeUpdate();
		}
		catch(SQLException se) {
			
			se.printStackTrace();
			
		}
		
		finally {
			try {
				if(pstmnt!=null)
					pstmnt.close();
				if(conn !=null)
					conn.close();
			}
			
			catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return status;
	}
	
	
	
}
