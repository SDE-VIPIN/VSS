package vss.dao;
import java.sql.*;

import java.sql.Date;

import vss.beans.Admin;
import vss.beans.Client;
import vss.beans.Contacts;
import vss.beans.Feedbacks;
import vss.beans.News;
import vss.beans.Offer_scheme;
import vss.beans.Plan;
import vss.beans.Provider;
import vss.beans.Services;
import vss.dbinfo.DBConnection;
import java.util.*;


public class AdminDao {
	
	// confirm provider payment method starts
				public int ConfirmPayment(String []paymentIds) {
					
					Connection con = DBConnection.openConnection();
					PreparedStatement ps = null;
					int status =0;
					
					// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no, plan_name, payment_status
					String query = "update provider set payment_status='paid' where provider_id=?";

					try {
						
						ps = con.prepareStatement(query);
						for(int i=0; i<paymentIds.length;i++) {
							String pid = paymentIds[i];
							
						ps.setString(1, pid);
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

			// confirm provider payment method ends
	
	// delete offer method starts here
	
		public int deleteOffer(String[] sid, String aid) {
						
			Connection con = DBConnection.openConnection();
			PreparedStatement ps=  null;
			int status=0;
			String deleteQuery="delete from plan where plan_name=? and adminId=?";
						
			try {
				ps= con.prepareStatement(deleteQuery);
				
				for(int i=0;i<sid.length;i++){
					ps.setInt(1, Integer.parseInt(sid[i]));
					ps.setString(2, aid);
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
	
	//view offer method starts
	public ArrayList<Plan>viewPlan(){
	ArrayList<Plan>planList = new ArrayList<Plan>();
	
	Plan plan = null;
	
	Connection con = DBConnection.openConnection();
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// plan --> plan_name, duration, charge, date
	String select_svc_Query = "select * from plan order by date desc";
	
	try {
		ps = con.prepareStatement(select_svc_Query);
		//ps.setString(1, adminId);
		rs = ps.executeQuery();
		while(rs.next())
		{
			
			plan = new Plan();
			plan.setPlan_name(rs.getString("plan_name"));
			plan.setDuration(rs.getString("duration"));
			plan.setCharge(rs.getString("charge"));
			plan.setDate(rs.getDate("date"));
			planList.add(plan);      // adding object into ArrayList
		}
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	
	return planList;
}
// view offer method ends
	
	
	// add offer method starts
	public int addPlans(Plan p) {
						
		Connection con = DBConnection.openConnection(); // connection established with database
		PreparedStatement ps = null; // interface, it is used to execute parameterized query.
		int status =0;
		
		// plan_name, duration, charge, date
		String insertQuery = "insert into plan(plan_name, duration, charge, date)values(?,?,?,?)";
		try {
							
			ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 
			ps.setString(1, p.getPlan_name());
			ps.setString(2, p.getDuration());
			ps.setString(3, p.getCharge());
			ps.setDate(4, p.getDate());
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
	
	
	// View news Method starts
	
		public ArrayList<News>viewNews()
		{
			ArrayList<News>newsList = new ArrayList<News>();
			
			News n = null;
			
			Connection con =DBConnection.openConnection();
			String selectQuery = "select * from news";
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				// news_id, news_content
				ps = con.prepareStatement(selectQuery);
				rs = ps.executeQuery();
				while(rs.next())
				{
					// int id = rs.getInt("contact_id");
					String news =rs.getString("news_content");
					// Date d =rs.getDate("date");
					
					n = new News(news); //object creation using fetch record
					newsList.add(n); // adding object into ArrayList			
					}
				System.out.println(newsList.size());
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			
			return newsList;
		}
		
		// View news Method ends
	
	
	// news show method on index page starts
	public ArrayList<News>viewNotice()

	{

		ArrayList<News> newsList = new ArrayList<>();
		News n = null;

		Connection con = DBConnection.openConnection();

		String selectQuery = "select  * from news limit 1";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				// detail, date

				String detail = rs.getString("news_content");
				n = new News(detail); // object creation using fetched record
				newsList.add(n); // adding object into ArrayList

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return newsList;
	}
	// news show method ends
	
	//News add method ends
	public int addnews(News news) 
		
		{					
			// String content = news.getNews_content(); 			
			// news_id, news_content
			Connection con = DBConnection.openConnection(); // connection established with database
			String insertQuery = "insert into news(news_content)values(?)";
			int status =0;
			PreparedStatement ps = null; // interface, it is used to execute parameterized query.
			try {				
				ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 
				//MySQL-> compile the query and store the compiled query into buffer and give reference to ps				
				ps.setString(1, news.getNews_content());				
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
		} // method closed here

	
	
	// view profile method
	
	public Admin viewProfile(String id) {
		
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String selectQuery = "select * from admin where admin_id=?";
		Admin a = null;
		
		try {
			ps =con.prepareStatement(selectQuery);
			ps.setString(1,id);
			System.out.println(ps);
			
			rs = ps.executeQuery();
			
			rs.next(); // put the cursor on the specified row
			// admin_id, admin_pass, name, email, phone
			
			String name = rs.getString("name");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String pass = rs.getString("admin_pass");
			a = new Admin();	// Admin class object
			a.setEmail(email);	// setting values in Admin object
			a.setName(name);
			a.setPhone(phone);
			a.setAdmin_pass(pass);
			
			
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
		
		return a; 	//returning admin class object
	}
		
	
	// view profile method ends
	
	
	
	public boolean login(String id, String pass) {
		
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from admin where admin_id=? and admin_pass=?";
		
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
	
	
	//view offer method starts
	
	public ArrayList<Offer_scheme>viewOffer(){
	ArrayList<Offer_scheme>offerList = new ArrayList<Offer_scheme>();
	
	Offer_scheme os = null;
	
	Connection con = DBConnection.openConnection();
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// offer_scheme --> schemeId, providerId, serviceId, discount_offer, date
	// services --> service_id, provider_id, service_name, charge, description
	// provider --> provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no
	String select_svc_Query = "select p.owner,p.provider_id,os.discount_offer,os.date,sr.service_name,sr.charge from provider p,offer_scheme os,services sr where os.serviceId=sr.service_id and p.provider_id=os.providerId";
	
	try {
		ps = con.prepareStatement(select_svc_Query);
		rs = ps.executeQuery();
		while(rs.next())
		{
			
			String offer =rs.getString("discount_offer");  // fetching data from columns
			Date d =rs.getDate("date");
			
			Services s = new Services();
			s.setService_name(rs.getString("service_name"));  // fetching data from columns
			s.setCharge(rs.getFloat("charge"));
			
			Provider p = new Provider();
			p.setOwner(rs.getString("owner"));
			p.setProvider_id(rs.getString("provider_id"));
			
			
			
			os = new Offer_scheme();
			os.setDiscount_offer(offer);
			os.setDate(d);
			os.setSr(s);            // has a relationship
			os.setProvider(p);            // has a relationship
			offerList.add(os);      // adding object into ArrayList
		}
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	
	return offerList;
}


// view offer method ends

	
	
	
	// View Contact Method starts
	
	public ArrayList<Contacts> viewContacts()
	{
		ArrayList<Contacts>contactList = new ArrayList<Contacts>();
		
		Contacts contact = null;
		
		Connection con =DBConnection.openConnection();
		String selectQuery = "select * from contacts order by date desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//contact_id, user_name, user_email, user_phone, user_question, date
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while(rs.next())
			{
//				int id = rs.getInt("contact_id");
				String name =rs.getString("user_name"); // fetching data from columns
				String email =rs.getString("user_email");
				String phone =rs.getString("user_phone");
				String question =rs.getString("user_question");
				Date d =rs.getDate("date");
				
				contact = new Contacts(name,email,phone,question,d); //object creation using fetch record
				contactList.add(contact); // adding object into ArrayList			
				}
			System.out.println(contactList.size());
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		
		return contactList;
	}
	
	// View Contact Method ends
	
	
	// view Feedback Method starts
	
	public ArrayList<Feedbacks>viewFeedbacks(){
		ArrayList<Feedbacks>feedbackList = new ArrayList<Feedbacks>();
		
		Feedbacks feedback = new Feedbacks();
		
		Connection con = DBConnection.openConnection();
		String select_f_Query = "select * from feedbacks order by date desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// feedback_id, name, email, remarks, rating, date
			ps = con.prepareStatement(select_f_Query);
			rs = ps.executeQuery();
			while(rs.next())
			{
				
//				String id = rs.getString("feedback_id");
//				int id1 = Integer.parseInt(id);
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
	
	
	// view New Provider Method starts
	
		public ArrayList<Provider>viewProviderPayment(){
			ArrayList<Provider>providerList = new ArrayList<Provider>();
			
			Provider pro = new Provider();
			
			Connection con = DBConnection.openConnection();
			String select_f_Query = "select * from provider where payment_status is NULL";
			//String select_f_Query = "select p.provider_id,p.provider_password,p.company_name,p.phone,p.owner,p.email,p.city,p.address,p.about,p.date,p.registration_no,pln.plan_id from provider p,plan pln where p.plan_name=pln.plan_name";
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				
				// plan_id, plan_name, duration, charge, date
				// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no, plan_name
				
				ps = con.prepareStatement(select_f_Query);
				rs = ps.executeQuery();
				while(rs.next())
				{
					
					String id = rs.getString("provider_id");  // fetching data from columns
					String pass = rs.getString("provider_password");
					String company =rs.getString("company_name"); 
					String phone =rs.getString("phone"); 
					String name =rs.getString("owner"); 
					String email =rs.getString("email");
					String city =rs.getString("city"); 
					String address =rs.getString("address"); 
					String about =rs.getString("about"); 
					Date d =rs.getDate("date");
					String reg =rs.getString("registration_no");
					String plan_name =rs.getString("plan_name");
					String payment_status =rs.getString("payment_status");
					System.out.println("reg no."+ reg);
					
					pro.setPayment_status(payment_status);
					pro = new Provider(id,pass,company,phone,name,email,city,address, about,d,reg,plan_name);
					providerList.add(pro);
				}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			
			return providerList;
		}
		
		// view New Provider Method ends
	
	
	// view Provider Method starts
	
	public ArrayList<Provider>viewProvider(){
		ArrayList<Provider>feedbackList = new ArrayList<Provider>();
		
		Provider pro = new Provider();
		// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no, plan_name, payment_status
		Connection con = DBConnection.openConnection();
		String select_f_Query = "SELECT * FROM provider WHERE payment_status = 'paid'";
		//String select_f_Query = "select p.provider_id,p.provider_password,p.company_name,p.phone,p.owner,p.email,p.city,p.address,p.about,p.date,p.registration_no,pln.plan_id from provider p,plan pln where p.plan_name=pln.plan_name";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement(select_f_Query);
			rs = ps.executeQuery();
			while(rs.next())
			{
				
				String id = rs.getString("provider_id");  // fetching data from columns
				String pass = rs.getString("provider_password");
				String company =rs.getString("company_name"); 
				String phone =rs.getString("phone"); 
				String name =rs.getString("owner"); 
				String email =rs.getString("email");
				String city =rs.getString("city"); 
				String address =rs.getString("address"); 
				String about =rs.getString("about"); 
				Date d =rs.getDate("date");
				String reg =rs.getString("registration_no");
				String plan_name =rs.getString("plan_name");
				String payment_status =rs.getString("payment_status");
				System.out.println("reg no."+ reg);
				
				pro = new Provider(id,pass,company,phone,name,email,city,address, about,d,reg,plan_name);
				pro.setPayment_status(payment_status);
				feedbackList.add(pro);
			}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		
		return feedbackList;
	}
	
	
	
	
	// view Provider Method ends
	
	
	// view User Method starts
	
		public ArrayList<Client>viewClients(){
			ArrayList<Client>clientList = new ArrayList<Client>();
			
			Client client = new Client();
			
			Connection con = DBConnection.openConnection();
			String select_c_Query = "select * from client order by date desc";
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				// client_id, client_pass, name, email, phone, city, address, date
				ps = con.prepareStatement(select_c_Query);
				rs = ps.executeQuery();
				while(rs.next())
				{
					String id = rs.getString("client_id");
					String pass = rs.getString("client_pass");					
					String name =rs.getString("name"); // fetching data from columns
					String email =rs.getString("email");
					String phone =rs.getString("phone");
					String city =rs.getString("city");
					String address =rs.getString("address");
					
					Date d =rs.getDate("date");
					
					client = new Client(id,pass,name,email,phone,city,address,d);
					clientList.add(client);
				}
			}
			catch(SQLException se) {
				se.setStackTrace(null);
			}
			
			return clientList;
		}
		
		// view UserMethod ends
		
		
		
		// Admin's edit profile method
		
			public int editProfile(Admin a) {
			
				//admin_id, admin_pass, name, email, phone
				
				Connection con = DBConnection.openConnection();
				PreparedStatement ps = null;
				String updateQuery = "update admin set name=?,email=?,phone=? where admin_id=?";
				int status = 0;
				
				try {
					
					ps = con.prepareStatement(updateQuery);
					ps.setString(1, a.getName());
					ps.setString(2, a.getEmail());
					ps.setString(3, a.getPhone());
					ps.setString(4, a.getAdmin_id());
					
					System.out.print(ps);
					status = ps.executeUpdate();
					
				}
				
				catch(SQLException se) {
					se.printStackTrace();
				}
				
				return status;
			}
			
			// Admin's edit profile method ends 

}
