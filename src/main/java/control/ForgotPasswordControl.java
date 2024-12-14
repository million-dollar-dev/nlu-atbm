package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javaMail.EmailService;
import javaMail.EmailTemplate;
import javaMail.IJavaMail;

import java.io.IOException;

import dao.UserDAO;

@WebServlet("/forgotPassword")
public class ForgotPasswordControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordControl() {
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
		String email = request.getParameter("email");
		IJavaMail emailService = new EmailService();
		String scheme = request.getScheme();
        String serverName = request.getServerName();
        int serverPort = request.getServerPort();
        String contextPath = request.getContextPath();
        String baseUrl = scheme + "://" + serverName + ":" + serverPort + contextPath + "/index";

		UserDAO dao = new UserDAO();
		String pass = dao.getPasswordByEmail(email);
		emailService.send(email, "SAPO - Lấy lại mật khẩu tại SAPO STORE", EmailTemplate.getForgotPasswordTemplate(pass, baseUrl));
		response.sendRedirect("login.jsp");
	}

}
