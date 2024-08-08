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
 * Servlet implementation class Confirm_Booking
 */
@WebServlet("/Confirm_Booking")
public class Confirm_Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Confirm_Booking() {
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

		String [] bookingid = request.getParameterValues("bkid");
		for(int i=0;i<bookingid.length;i++)
		{
			System.out.println("booking id : "+bookingid[i]);
		}
		
		ProviderDao dao = new ProviderDao();
		int status = dao.confirmBooking(bookingid);
		if(status>0) {
			request.setAttribute("msg", userMessage.SERVICE_MESSSAGE);
			RequestDispatcher rd =request.getRequestDispatcher("/provider/picked_booking.jsp"); //relative path
			rd.forward(request, response); // forward the request
			}
		
	}

}
