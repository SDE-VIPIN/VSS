package vss.client_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.beans.BookingService;
import vss.dao.ClientDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class BookServices
 */
@WebServlet("/BookServices")
public class BookServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServices() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.sendRedirect("/VehicleServiceStation/client/pending_booking.jsp");	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String [] service = request.getParameterValues("services");
		String pid = request.getParameter("pid");
		HttpSession hs = request.getSession();
		String id = (String)hs.getAttribute("sessionKey");
		java.util.Date d = new java.util.Date();
		java.sql.Date date = new java.sql.Date(d.getTime());
		for(int i=0;i<service.length;i++)
		{
			System.out.println("service : "+service[i]);
		}
		
		ClientDao dao = new ClientDao();
		
		BookingService bs = new BookingService(id,pid,date,service);
		
		int status = dao.bookService(bs);
		if(status>0) {
			//request.setAttribute("msg", userMessage.BOOKING_MESSSAGE);
			//RequestDispatcher rd =request.getRequestDispatcher("/client/pending_booking.jsp"); //relative path
			//rd.forward(request, response); // forward the request
			
			
			response.sendRedirect("/VehicleServiceStation/client/pending_booking.jsp");
			}
		
	}
}
