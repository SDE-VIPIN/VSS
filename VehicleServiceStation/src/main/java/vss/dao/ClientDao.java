package vss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vss.beans.BookingService;
import vss.beans.Client;
import vss.beans.Employees;
import vss.beans.Provider;
import vss.beans.Services;
import vss.dbinfo.DBConnection;

public class ClientDao {
	
	
	// view profile method
	
			public Client viewProfile(String id) {
				
				Connection con = DBConnection.openConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				String selectQuery = "select * from client where client_id=?";
				Client clt = null;
				
				try {
					ps =con.prepareStatement(selectQuery);
					ps.setString(1,id);
					System.out.println(ps);
					
					rs = ps.executeQuery();
					
					rs.next(); // put the cursor on the specified row
					// admin_id, admin_pass, name, email, phone
					// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date
					// client_id, client_pass, name, email, phone, city, address, date
					
					String name = rs.getString("name");
					String email = rs.getString("email");
					String phone = rs.getString("phone");
					String city = rs.getString("city");
					String add = rs.getString("address");
					String pass = rs.getString("client_pass");
					
					clt = new Client();	// Client class object
					clt.setEmail(email);	// setting values in Client object
					clt.setName(name);
					clt.setPhone(phone);
					clt.setClient_pass(pass);
					clt.setCity(city);
					clt.setAddress(add);
					
					
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
				
				return clt; 	//returning Client class object
			}
				
			
			// view profile method ends
	
	
	
	
	
	public boolean login(String id, String pass) {
		
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from client where client_id=? and client_pass=?";
		
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
	
public int addClient(Client ct) 
	
	{		
		
		Connection con = DBConnection.openConnection(); // connection established with database
		String insertQuery = "insert into client(client_id, client_pass, name, email, phone, city, address, date)values(?,?,?,?,?,?,?,?)";
		int status =0;
		PreparedStatement ps = null; // interface, it is used to execute parameterized query.
		try {
			
			ps=con.prepareStatement(insertQuery); // method of PreparedStatement interface it passes the query to MySQL. 
			//MySQL-> compile the query and store the compiled query into buffer and give reference to ps
			ps.setString(1, ct.getClient_id());
			ps.setString(2, ct.getClient_pass());
			ps.setString(3, ct.getName());
			ps.setString(4, ct.getEmail());
			ps.setString(5, ct.getPhone());
			ps.setString(6, ct.getCity());
			ps.setString(7, ct.getAddress());
			ps.setDate(8, ct.getDate());
			
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


				// Client's edit profile method

				public int editProfile(Client a) {
	
				
					// client_id, client_pass, name, email, phone, city, address, date
					Connection con = DBConnection.openConnection();
					PreparedStatement ps = null;
					String updateQuery = "update client set name=?,email=?,client_pass=?,phone=?,city=?,address=? where client_id=?";
					int status = 0;
					
					try {
						
						ps = con.prepareStatement(updateQuery);
						ps.setString(1, a.getName());
						ps.setString(2, a.getEmail());
						ps.setString(3, a.getClient_pass());
						ps.setString(4, a.getPhone());
						ps.setString(5, a.getCity());
						ps.setString(6, a.getAddress());
						ps.setString(7, a.getClient_id());
						
						
						
						System.out.print(ps);
						status = ps.executeUpdate();
						
					}
					
					catch(SQLException se) {
						se.printStackTrace();
					}
					
					return status;
				}
				
				// Admin's edit profile method ends
				
				
				//  service booking method
				public int bookService(BookingService bs) {
					
					Connection con = DBConnection.openConnection(); // connection established with database
					String insertQuery = "insert into servicebooking(client_id, service_id, provider_id, date)values(?,?,?,?)";
					int status =0;
					PreparedStatement ps = null; // interface, it is used to execute parameterized query.
					try {
						ps= con.prepareStatement(insertQuery);
						for(int i=0; i<bs.getService_id().length; i++) 
						{ 
							String s_id=bs.getService_id()[i];
							int service_id=Integer.parseInt(s_id);
							ps.setString(1, bs.getClient_id());
							ps.setInt(2, service_id);
							ps.setString(3, bs.getProvider_id());
							ps.setDate(4, bs.getDate());
							
							System.out.println(ps);
							ps.addBatch();
						}
					
						int [] arr=ps.executeBatch();
						for(int i=0; i<arr.length;i++)
						{
							if(arr[i]>0)
							status=1;
							else
								break;
						}
					
					} 
					catch (SQLException e) {
						e.printStackTrace();
						status=0;
					}
					finally {
						try
						{
							if(ps!=null)
								ps.close();
							if(con!=null)
								con.close();
						}
						catch (SQLException e) {
							e.printStackTrace();
						}
					}
						
						return status;
					}
				
				
				//view confirm bookings method starts
				
				public ArrayList<BookingService>viewConfirmBooking(String clientId){
				ArrayList<BookingService>requestList = new ArrayList<BookingService>();
				
				Employees e = null;
				Services s = null;
				Client c =null;
				BookingService bs = null;
				
				Connection con = DBConnection.openConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response, employee_id
				// client_id, client_pass, name, email, phone, city, address, date
				// serial_number, provider_id, emp_id, emp_name, email, phone, date
				// service_id, provider_id, service_name, charge, description
				String select_svc_Query = "select b.booking_status,b.provider_response,s.service_name,s.charge,e.emp_name,e.phone from employee e,servicebooking b,services s,client c where b.service_id=s.service_id AND b.employee_id=e.emp_id AND b.client_id=c.client_id AND c.client_id=? AND b.booking_status='true'";
				
				try {
					ps = con.prepareStatement(select_svc_Query);
					ps.setString(1, clientId);
					rs = ps.executeQuery();
					while(rs.next())
					{
						
						String name =rs.getString("emp_name");
						String phone =rs.getString("phone");			
						
						e = new Employees();
						e.setEmp_name(name);
						e.setPhone(phone);
						          
						
						s = new Services();
						String servicename = rs.getString("service_name");
						String price =rs.getString("charge");
						float charge = Float.parseFloat(price);
						s.setService_name(servicename);
						s.setCharge(charge);
						
						bs = new BookingService();
						bs.setBooking_status(rs.getString("booking_status"));
						bs.setProvider_response(rs.getString("provider_response"));
						System.out.println(name+" "+phone+" "+charge+" "+servicename);
						bs.setEmployees(e); // has a relationship
						bs.setServices(s); // has a relationship
						bs.setClient(c); // has a relationship
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
				
				
				
				
				
				//view  pending bookings method starts
				
				public ArrayList<BookingService>viewPendingBooking(String clientId){
				ArrayList<BookingService>pendingBookingList = new ArrayList<BookingService>();
				
				Provider p = null;
				Services s = null;
				// Client c = null;
				BookingService bs = null;
				
				Connection con = DBConnection.openConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				// booking_id, client_id, service_id, provider_id, date, booking_status, provider_response
				// provider_id, provider_password, company_name, phone, owner, email, city, address, about, date, registration_no
				// service_id, provider_id, service_name, charge, description
				String query = "select p.company_name,p.owner,p.phone,p.address,s.service_name,s.charge,b.date from provider p,servicebooking b,services s,client c where b.provider_id=p.provider_id AND b.service_id=s.service_id AND b.client_id=c.client_id AND c.client_id=? AND b.booking_status='false' order by date desc";
				
				try {
					ps = con.prepareStatement(query);
					ps.setString(1, clientId);
					rs = ps.executeQuery();
					while(rs.next())
					{
						
						
						p = new Provider();
						p.setCompany_name(rs.getString("company_name"));
						p.setOwner(rs.getString("owner"));
						p.setPhone(rs.getString("phone"));
						p.setAddress(rs.getString("address"));           
						
						s = new Services();
						s.setService_name(rs.getString("service_name"));
						s.setCharge(rs.getFloat("charge"));
						
						
						bs = new BookingService();
						bs.setDate(rs.getDate("date"));
						bs.setProvider(p); // has a relationship
						bs.setServices(s); // has a relationship
						pendingBookingList.add(bs);      // adding object into ArrayList
					}
					System.out.println(pendingBookingList.size());
				}
				catch(SQLException se) {
					se.printStackTrace();
				}
				
				return pendingBookingList;
			}
						
			// view booking method ends
				
				public boolean checkId(String cid) {
					
					Connection con = DBConnection.openConnection();
					PreparedStatement ps = null;
					ResultSet rs = null;
					
					try {
						String query = "select * from client where client_id=?";
						ps = con.prepareStatement(query);
						ps.setString(1, cid);
						
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
