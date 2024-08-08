package vss.client_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vss.beans.Client;
import vss.dao.ClientDao;
import vss.dao.ProviderDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Client_Registration
 */
@WebServlet("/Client_Registration")
public class Client_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Client_Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("id");
		//System.out.println("id recieved from ajax code :" + pid);
		
		// it is used to get response from server
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// out.println("Response from the server");
		
	    //  creating dao class object
	    ClientDao cdao = new ClientDao();
	    boolean status = cdao.checkId(cid);
	    if(status == true)
	    	out.println("Id already exist.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("clientName");
		String pass = request.getParameter("clientPass");
		String email = request.getParameter("clientMail");
		String id = request.getParameter("clientId");
		String phone = request.getParameter("clientPhone");
		String city = request.getParameter("clientCity");
		String address = request.getParameter("clientAddress");
		
		System.out.println("client name is : "+ name);
		System.out.println("client id is : "+ id);
		System.out.println("client password is : "+ pass);
		System.out.println("client email is : "+ email);
		System.out.println("client phone is : "+ phone);
		System.out.println("client city is : "+ city);
		System.out.println("client address is : "+ address);
		
		
		
		
		// client_id, client_pass, name, email, phone, city, address, date
		// creating object of bean class
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate = new java.sql.Date(d.getTime());
		Client ct = new Client(id,pass,name,email,phone,city,address,todayDate); // parameter should be pass the sequence in db table 
		
		//  creating dao class object
		ClientDao cdao = new ClientDao();
		
		
		// calling dao class method and passing bean class object
		int status = cdao.addClient(ct);
		if(status>0) {
		request.setAttribute("msg", userMessage.REGISTRATION_MESSSAGE);
		RequestDispatcher rd =request.getRequestDispatcher("/client/client_login.jsp"); //relative path
		rd.forward(request, response); // forward the request
		}
	}

}
