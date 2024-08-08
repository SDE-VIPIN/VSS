package vss.provider_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.beans.Employees;
import vss.dao.ProviderDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Provider_Employee
 */
@WebServlet("/Provider_Employee")
public class Provider_Employee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Provider_Employee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eid = request.getParameter("id");
		//System.out.println("id recieved from ajax code :" + pid);
		
		// it is used to get response from server
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// out.println("Response from the server");
		
	    //  creating dao class object
	    ProviderDao pdao = new ProviderDao();
	    boolean status = pdao.checkEmpId(eid);
	    if(status == true)
	    	out.println("Id already exist.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs = request.getSession(false);	
		String pid = (String)hs.getAttribute("sessionKey");
		String eid = request.getParameter("empId");
		String name = request.getParameter("empName");
		String email = request.getParameter("empEmail");
		String phone = request.getParameter("empPhone");
		
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate = new java.sql.Date(d.getTime());
		
		// creating object of bean class
		Employees emp = new Employees(pid, eid, name, email, phone, todayDate); // parameter should be pass the sequence in db table 
		
		//  creating dao class object
		ProviderDao pdao = new ProviderDao();
		
		
		// calling dao class method and passing bean class object
		int status = pdao.addEmpoyee(emp);
		if(status>0) {
		request.setAttribute("msg", userMessage.Employee_MESSSAGE);
		RequestDispatcher rd =request.getRequestDispatcher("/provider/view_employee.jsp"); //relative path
		rd.forward(request, response); // forward the request
		}
		
		else {
			request.setAttribute("msg", userMessage.Error_MESSSAGE);
			RequestDispatcher rd =request.getRequestDispatcher("/provider/employee.jsp"); //relative path
			rd.forward(request, response); // forward the request
		
	}

	}

}
