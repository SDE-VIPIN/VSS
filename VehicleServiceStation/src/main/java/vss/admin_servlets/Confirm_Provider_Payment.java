package vss.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.dao.AdminDao;
import vss.dao.ProviderDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Confirm_Provider_Payment
 */
@WebServlet("/Confirm_Provider_Payment")
public class Confirm_Provider_Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Confirm_Provider_Payment() {
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
	    String pid = (String) hs.getAttribute("sessionKey");

	    String[] paymentIds = request.getParameterValues("paymentid");
	    if (paymentIds != null && paymentIds.length > 0) {
	        AdminDao dao = new AdminDao();
	        int updatedRows = dao.ConfirmPayment(paymentIds);
			if(updatedRows>0) {
			request.setAttribute("msg", userMessage.REGISTRATION_MESSSAGE);
			RequestDispatcher rd =request.getRequestDispatcher("/admin/view_provider.jsp"); //relative path
			rd.forward(request, response); // forward the request
			}
	        System.out.println("Total rows updated: " + updatedRows);
	    } else {
	        System.out.println("No payment IDs selected.");
	        
	        
	    
	}

	}}
