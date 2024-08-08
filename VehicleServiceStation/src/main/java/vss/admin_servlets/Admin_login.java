package vss.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.dao.AdminDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Admin_login
 */
@WebServlet("/Admin_login")
public class Admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_login() {
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
		
		String id = request.getParameter("userId"); // to fetch the value from userId input field
		
		String pass = request.getParameter("userPass"); // to fetch the value from userPass input field
		
		
		System.out.println("User id is : "+id);
		System.out.println("User password is : "+pass);
		
		AdminDao dao = new AdminDao();
		boolean status = dao.login(id,pass);
		
		if(status==true)
		
		{
			HttpSession hs = request.getSession(); //creating new session
			//	String sessionId = hs.getId();
			//	System.out.println("Session id is : " + sessionId);
			hs.setAttribute("sessionKey", id); // binding client id in session
			hs.setAttribute("role", "admin"); // binding client role in session
			
			
			
			response.sendRedirect("/VehicleServiceStation/admin/admin_home.jsp");
			// it is used to navigate the browser on another URL page
		}
		else {
			
			
			  request.setAttribute("msg", userMessage.LOGIN_ERROR); 
			  RequestDispatcher rd=request.getRequestDispatcher("/admin/admin_login.jsp"); //relative path
			  rd.forward(request, response); // forward the request
			 			
			/*
			 * HttpSession session = request.getSession(); session.setAttribute("msg",
			 * userMessage.LOGIN_ERROR);
			 * response.sendRedirect("/VehicleServiceStation/admin/admin_login.jsp");
			 */
		}
		
		
		
	}

}
