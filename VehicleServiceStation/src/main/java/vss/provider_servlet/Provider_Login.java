package vss.provider_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.dao.ProviderDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Provider_Login
 */
@WebServlet("/Provider_Login")
public class Provider_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Provider_Login() {
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
		
		String id = request.getParameter("providerId"); // to fetch the value from userId input field
		
		String pass = request.getParameter("providerPass"); // to fetch the value from userPass input field
		
		
		System.out.println("Provider id is : "+id);
		System.out.println("Provider password is : "+pass);
		
		ProviderDao dao = new ProviderDao();
		boolean status = dao.login(id,pass);
		
		if(status==true)
		
		{
			
			HttpSession hs = request.getSession(); //creating new session
			hs.setAttribute("sessionKey", id); // binding client id in session
			hs.setAttribute("role", "Service Provider"); // binding client role in session
			response.sendRedirect("/VehicleServiceStation/provider/provider_home.jsp"); // it is used to navigate the browser on another URL page
		}
		else {
			
			request.setAttribute("msg", userMessage.LOGIN_ERROR);
			RequestDispatcher rd =request.getRequestDispatcher("/provider/provider_login.jsp"); //relative path
			rd.forward(request, response); // forward the request
		}
		
		}
}
