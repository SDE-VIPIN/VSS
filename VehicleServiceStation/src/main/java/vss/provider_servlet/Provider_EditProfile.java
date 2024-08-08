package vss.provider_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vss.beans.Provider;
import vss.dao.ProviderDao;

/**
 * Servlet implementation class Provider_EditProfile
 */
@WebServlet("/Provider_EditProfile")
public class Provider_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Provider_EditProfile() {
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
		String provider_id = (String)hs.getAttribute("sessionKey");
		String name = request.getParameter("name");
		
		String email = request.getParameter("email");
		
		String pass = request.getParameter("password");
		
		String phone = request.getParameter("phone");
		
		String company = request.getParameter("company");
		System.out.println("company :"+ company);
		
		String city = request.getParameter("city");
		System.out.println("city :"+ city);
		
		String address = request.getParameter("address");
		
		String about = request.getParameter("about");
		
		
		Provider a = new Provider();
		a.setOwner(name);
		a.setEmail(email);
		a.setProvider_password(pass);
		a.setPhone(phone);
		a.setCompany_name(company);
		a.setCity(city);
		a.setAddress(address);
		a.setAbout(about);
		a.setProvider_id(provider_id);
		
		ProviderDao dao = new ProviderDao();
		int status = dao.editProfile(a); // passing Client object for updation on the basis of
		
		if(status>0) {
			response.sendRedirect("/VehicleServiceStation/provider/provider_home.jsp");
		}
	
	}

}
