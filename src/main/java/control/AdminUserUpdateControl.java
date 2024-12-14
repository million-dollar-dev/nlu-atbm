package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Helpers;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import dao.UserDAO;

@WebServlet("/updateUserDone")
public class AdminUserUpdateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUserUpdateControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String role = request.getParameter("role");
		String mess = "";
		UserDAO dao = new UserDAO();
		if (!Helpers.isValidPhoneNumber(phoneNumber)) {
			mess += "Số điện thoại không hợp lệ ";
		}

		request.setAttribute("mess", mess);
		dao.updateUserById(id, username, email, phoneNumber, address, role);
		response.sendRedirect("readUser");
	
	}

	
}
