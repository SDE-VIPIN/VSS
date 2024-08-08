package vss.dbinfo;
import java.sql.*;
public class DBConnection 
{

private static Connection con; // Connection holds the address the address of the database
		
public static Connection openConnection() {
			
try {
				
	Class.forName("com.mysql.cj.jdbc.Driver"); //factory method is used to create object
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vss_db","root","root");
				
	}

	// protocol
	// localhost-> this is the address of the machine where db is used to create object
	// database name
	// database user id
	// database user Password
catch(SQLException|ClassNotFoundException se){
	se.printStackTrace();
	}

	return con;

	}

// method close

//	public static void main(String[] args) {
//		
//		Connection c = DBConnection.openConnection();
//		System.out.println(c);
//	}

	
}
