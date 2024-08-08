package vss.provider_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vss.dao.ProviderDao;

/**
 * Servlet implementation class Delete_Offer
 */
@WebServlet("/Delete_Offer")
public class Delete_Offer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_Offer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String [] sid=request.getParameterValues("chkbkid");
		HttpSession hs = request.getSession(false);	
		String pid = (String)hs.getAttribute("sessionKey");

		
		for(int i= 0;i<sid.length;i++)
		{
			System.out.println("scheme id is :"+sid[i]+" "+pid);
		}
		
		
		ProviderDao dao = new ProviderDao();
		
		
		
		int status= dao.deleteOffer(sid,pid);
		
		if(status>0)
		{
			response.sendRedirect("/VehicleServiceStation/provider/view_offer.jsp");
		}
		
		else
		{
			response.sendRedirect("/VehicleServiceStation/provider/view_offer.jsp");
		}
		
	}

}
