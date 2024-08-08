package vss.provider_servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vss.beans.Services;
import vss.dao.ProviderDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Provider_Services
 */
@WebServlet("/Provider_Services")
public class Provider_Services extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Provider_Services() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs = request.getSession(false);	
		String pid = (String)hs.getAttribute("sessionKey");
		
		String service = request.getParameter("sname");
		float cost = Float.parseFloat(request.getParameter("price"));
		String desc = request.getParameter("description");
		
		
//		System.out.println("Service is : "+ service);
//		System.out.println("Service charge : "+ cost);
//		System.out.println("About service : "+ desc);
		
		
		// creating object of bean class
//		java.util.Date d= new java.util.Date();
//		java.sql.Date todayDate = new java.sql.Date(d.getTime());
		Services s = new Services(pid,service,cost,desc); // parameter should be pass as the sequence in db table 
		
		//  creating dao class object
		ProviderDao pdao = new ProviderDao();
		
		
		// calling dao class method and passing bean class object
		int status = pdao.addServices(s);
		if(status>0) {
		request.setAttribute("msg", userMessage.SERVICE_MESSSAGE);
		RequestDispatcher rd =request.getRequestDispatcher("/provider/view_services.jsp"); //relative path
		rd.forward(request, response); // forward the request
		}
	}
	

}

