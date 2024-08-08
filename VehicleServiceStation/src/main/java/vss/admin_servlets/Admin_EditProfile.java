package vss.admin_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vss.beans.Admin;
import vss.dao.AdminDao;

/**
 * Servlet implementation class Admin_EditProfile
 */
@WebServlet("/Admin_EditProfile")
public class Admin_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_EditProfile() {
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
		String admin_id = (String)hs.getAttribute("sessionKey");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Admin a = new Admin();
		a.setName(name);
		a.setEmail(email);
		a.setPhone(phone);
		a.setAdmin_id(admin_id);
		
		AdminDao dao = new AdminDao();
		int status = dao.editProfile(a); // passing Admin object for updation on the basis of
		
		if(status>0) {
			response.sendRedirect("/VehicleServiceStation/admin/admin_profile.jsp");
		}
	}

}
