package vss.provider_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.beans.Offer_scheme;
import vss.dao.ProviderDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Provider_offer
 */
@WebServlet("/Provider_offer")
public class Provider_offer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Provider_offer() {
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
		
		HttpSession hs =request.getSession(false);
		String provider_id = (String)hs.getAttribute("sessionKey");
		
		int serviceid = Integer.parseInt(request.getParameter("Service_id"));
		String offer = request.getParameter("offer");
		System.out.println(provider_id);
		System.out.println(serviceid);
		System.out.println(offer);
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate = new java.sql.Date(d.getTime());
		
		Offer_scheme os = new Offer_scheme(provider_id,serviceid,offer,todayDate);
		ProviderDao dao = new ProviderDao();
		int status = dao.addoffer(os);		
		if(status>0) {
			
			request.setAttribute("msg", userMessage.OFFER_MESSSAGE);
			RequestDispatcher rd =request.getRequestDispatcher("/provider/view_offer.jsp"); //relative path
			rd.forward(request, response); // forward the request
			}
	}

}
