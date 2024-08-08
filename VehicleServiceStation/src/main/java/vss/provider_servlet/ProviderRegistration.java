package vss.provider_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vss.beans.Provider;
import vss.dao.ProviderDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class ProviderRegistration
 */
@WebServlet("/ProviderRegistration")
public class ProviderRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProviderRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pid = request.getParameter("id");
		//System.out.println("id recieved from ajax code :" + pid);
		
		// it is used to get response from server
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// out.println("Response from the server");
		
	    //  creating dao class object
	    ProviderDao pdao = new ProviderDao();
	    boolean status = pdao.checkId(pid);
	    if(status == true)
	    	out.println("Id already exist.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("providerId");
		String pass = request.getParameter("providerPassword");
		String company = request.getParameter("providerCompany");
		String email = request.getParameter("providerEmail");
		String owner = request.getParameter("providerName");
		String phone = request.getParameter("providerPhone");
		String city = request.getParameter("providerCity");
		String plan_name = request.getParameter("plan_name");
		String address = request.getParameter("providerAddress");
		String about = request.getParameter("providerACompany");
		String reg = request.getParameter("reg_no");
		
		System.out.println("Provider name is : "+ owner);
		System.out.println("Provider id is : "+ id);
		System.out.println("Provider email is : "+ pass);
		System.out.println("Provider company is : "+ company);
		System.out.println("Provider email is : "+ email);
		System.out.println("Provider phone is : "+ phone);
		System.out.println("Provider city is : "+ city);
		System.out.println("Provider address is : "+ address);
		System.out.println("About provider company : "+ about);
		System.out.println("company cin no. : "+ reg);
		
		
		// creating object of bean class
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate = new java.sql.Date(d.getTime());
		Provider p = new Provider(id,pass,company,phone,owner,email,city,address,about,todayDate,reg,plan_name); // parameter should be pass the sequence in db table 
		
		//  creating dao class object
		ProviderDao pdao = new ProviderDao();
		
		
		// calling dao class method and passing bean class object
		int status = pdao.addProvider(p);
		if(status>0) {
		request.setAttribute("msg", userMessage.REGISTRATION_MESSSAGE);
		RequestDispatcher rd =request.getRequestDispatcher("/provider/provider_login.jsp"); //relative path
		rd.forward(request, response); // forward the request
		}
		
		else {
			request.setAttribute("msg", userMessage.USER_EXISTENCE);
			RequestDispatcher rd =request.getRequestDispatcher("/provider/provider_registration.jsp"); //relative path
			rd.forward(request, response); // forward the request
		}
	}

}
