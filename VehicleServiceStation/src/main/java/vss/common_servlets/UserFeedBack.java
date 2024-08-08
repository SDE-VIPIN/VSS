package vss.common_servlets;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vss.beans.Feedbacks;
import vss.dao.UserDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class UserFeedBack
 */
@WebServlet("/UserFeedBack")
public class UserFeedBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFeedBack() {
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
		
//		String id = request.getParameter("userName");
//		int id1 = Integer.parseInt(id);
		String name = request.getParameter("userName");
		String email = request.getParameter("userMail");
		String remark = request.getParameter("userRemark");
		String r = request.getParameter("userRating");
		
		int rating = Integer.parseInt(r);
		
		System.out.println("User name is : "+ name);
		System.out.println("User email is : "+ email);
		System.out.println("User query is : "+ remark);
		System.out.println("User rating is : "+ rating); 
		
		// creating object of bean class
				java.util.Date d= new java.util.Date();
				java.sql.Date todayDate = new java.sql.Date(d.getTime());
				Feedbacks f = new Feedbacks(name, email, remark, rating, todayDate);
				
				//  creating dao class object
				UserDao dao = new UserDao();
				
				
				// calling dao class method and passing bean class object
				int status = dao.addFeedback(f);
				
				if(status>0)
		
		request.setAttribute("msg", userMessage.FEEDBACK_MESSAGE);
		RequestDispatcher rd =request.getRequestDispatcher("/commonjsp/feedback.jsp"); //relative path
		rd.forward(request, response); // forward the request
	}

}
