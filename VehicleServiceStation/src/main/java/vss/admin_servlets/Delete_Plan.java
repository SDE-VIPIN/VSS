package vss.admin_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.dao.AdminDao;
/**
 * Servlet implementation class Delete_Plan
 */
@WebServlet("/Delete_Plan")
public class Delete_Plan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_Plan() {
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
		
		String [] sid=request.getParameterValues("chkbkid");
		HttpSession hs = request.getSession(false);	
		String aid = (String)hs.getAttribute("sessionKey");

		
		for(int i= 0;i<sid.length;i++)
		{
			System.out.println("scheme id is :"+sid[i]+" "+aid);
		}
		
		
		AdminDao dao = new AdminDao();
		
		
		
		int status= dao.deleteOffer(sid,aid);
		
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
