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
 * Servlet implementation class Booking_Request
 */
@WebServlet("/Booking_Request")
public class Booking_Request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Booking_Request() {
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
		
		HttpSession hs = request.getSession(false);	
		String pid = (String)hs.getAttribute("sessionKey");
		
		String eid = request.getParameter("empid");
		String message = request.getParameter("msg");
		String [] bookingid = request.getParameterValues("chkbkid");
		for(int i=0;i<bookingid.length;i++)
		{
			System.out.println("service : "+bookingid[i]);
		}
		
		System.out.println(pid+" "+eid+" "+bookingid+" "+message);
		
		ProviderDao dao = new ProviderDao();
		int status = dao.bookingRequest(pid,eid,message,bookingid);
		if(status>0) {
			request.setAttribute("msg", userMessage.SERVICE_MESSSAGE);
			RequestDispatcher rd =request.getRequestDispatcher("/provider/confirm_booking.jsp"); //relative path
			rd.forward(request, response); // forward the request
			}
	}

}
