package vss.common_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vss.beans.Contacts;
import vss.dao.UserDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class IndexContactus
 */
@WebServlet("/IndexContactus")
public class IndexContactus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexContactus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("userName");
		String email = request.getParameter("userMail");
		String query = request.getParameter("userQuery");
		String phone = request.getParameter("userPhone");
		
		System.out.println("User name is : "+ name);
		System.out.println("User email is : "+ email);
		System.out.println("User phone is : "+ phone);
		System.out.println("User query is : "+ query);
		
		// creating object of bean class
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate = new java.sql.Date(d.getTime());
		Contacts c = new Contacts(name, email, phone, query, todayDate);
		
		//  creating dao class object
		UserDao dao = new UserDao();
		
		
		// calling dao class method and passing bean class object
		int status = dao.addContact(c);
		if(status>0) {
		request.setAttribute("msg", userMessage.CONTACTUS_MESSSAGE);
		RequestDispatcher rd =request.getRequestDispatcher("/commonjsp/index.jsp"); //relative path
		rd.forward(request, response); // forward the request
		}
	}

}
