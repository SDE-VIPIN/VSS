package vss.client_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vss.beans.Client;
import vss.dao.ClientDao;
import vss.utils.userMessage;

/**
 * Servlet implementation class Client_EditProfile
 */
@WebServlet("/Client_EditProfile")
public class Client_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Client_EditProfile() {
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
		
		HttpSession hs = request.getSession(false);	// it will give existing session reference
		String client_id = (String)hs.getAttribute("sessionKey");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		
		Client a = new Client();
		a.setName(name);
		a.setEmail(email);
		a.setClient_pass(pass);
		a.setPhone(phone);
		a.setCity(city);
		a.setAddress(address);
		a.setClient_id(client_id);
		
		ClientDao dao = new ClientDao();
		int status = dao.editProfile(a); // passing Client object for updation on the basis of
		
		if(status>0) {
			request.setAttribute("msg", userMessage.PROFILE_EDIT_MESSSAGE);
			//response.sendRedirect("/VehicleServiceStation/client/client_home.jsp");
			RequestDispatcher rd =request.getRequestDispatcher("/client/client_home.jsp");
			rd.forward(request, response); 
		}
	}

}
