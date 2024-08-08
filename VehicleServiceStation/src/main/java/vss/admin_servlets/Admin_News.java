package vss.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vss.beans.News;
import vss.dao.AdminDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Admin_News
 */
@WebServlet("/Admin_News")
public class Admin_News extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_News() {
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
		
		//String header = request.getParameter("heading");
		String content = request.getParameter("content");
		
		News news = new News(content); // parameter should be pass as the sequence in db table 	
		
		//  creating dao class object
			AdminDao dao = new AdminDao();
			
			
			// calling dao class method and passing bean class object
			int status = dao.addnews(news);
			if(status>0) {
			request.setAttribute("msg", userMessage.NEWS_MESSSAGE);
			RequestDispatcher rd =request.getRequestDispatcher("/admin/add_news.jsp"); //relative path
			rd.forward(request, response); // forward the request
			}
		
	}

}
