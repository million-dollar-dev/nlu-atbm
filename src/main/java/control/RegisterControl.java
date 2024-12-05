package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import dao.UserDAO;
import entity.User;
@WebServlet("/register")
public class RegisterControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String role = "CUSTOMER";
		String mess = "";

		UserDAO dao = new UserDAO();
		
		if (!isValidPhoneNumber(phoneNumber)) {
			mess += "Số điện thoại không hợp lệ ";
		}
		
		if (dao.checkUserExist(username)) {
			mess += "Tên đăng nhập đã tồn tại ";
		}
		if (dao.checkEmailExist(email))
			mess += "Email đã tồn tại ";
		
		if (!mess.isEmpty()) {
			request.setAttribute("mess", mess);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else {
			dao.createUser(username, password, email, phoneNumber, address, role);
			User user = dao.login(username, password);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(60 * 60 * 24);
			response.sendRedirect("index");
		}		
	}
	
	private boolean isValidPhoneNumber(String phoneNumber) {
		String patternRegex = "^(\\+?84|0[1-9])+([0-9]{8})$";
		Pattern pattern = Pattern.compile(patternRegex);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
	}

}
