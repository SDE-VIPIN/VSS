package vss.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vss.beans.Plan;
import vss.dao.AdminDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Add_Plan
 */
@WebServlet("/Add_Plan")
public class Add_Plan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Plan() {
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
		
		// HttpSession hs = request.getSession(false);	
		// String adminid = (String)hs.getAttribute("sessionKey");
		
		String plan = request.getParameter("plan_name");
		String cost = request.getParameter("charge");
		String desc = request.getParameter("description");
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate = new java.sql.Date(d.getTime());
		
		Plan p = new Plan(plan,desc,cost,todayDate);
		
		AdminDao dao = new AdminDao();
		
		int status = dao.addPlans(p);
		if(status>0) {
		request.setAttribute("msg", userMessage.PLAN_MESSSAGE);
		RequestDispatcher rd =request.getRequestDispatcher("/admin/view_plan.jsp"); //relative path
		rd.forward(request, response); // forward the request
	}
		
	}

}
