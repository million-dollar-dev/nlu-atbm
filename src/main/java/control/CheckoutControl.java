package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javaMail.EmailService;
import javaMail.EmailTemplate;
import javaMail.IJavaMail;

import java.io.IOException;
import java.util.List;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import entity.Cart;
import entity.Product;
import entity.User;

@WebServlet("/checkoutDone")
public class CheckoutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO productDao = new ProductDAO();
		List<Product> listAllProduct = productDao.getAllProduct();
		Cookie[] cookies = request.getCookies();
		String txtCookie = "";
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("cart"))
					txtCookie += c.getValue();
			}
		}
		OrderDAO orderDao = new OrderDAO();
		Cart cart = new Cart(txtCookie, listAllProduct);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String email = request.getParameter("email");
		if (user == null)
			response.sendRedirect("login.jsp");
		else {
			orderDao.createOrder(user, cart);
			Cookie cookie = new Cookie("cart", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			sendMail(email, request);
			response.sendRedirect("success.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void sendMail(String email, HttpServletRequest request) {
		IJavaMail emailService = new EmailService();
		String scheme = request.getScheme(); // http
        String serverName = request.getServerName(); // yourdomain
        int serverPort = request.getServerPort(); // port, ví dụ: 8080
        String contextPath = request.getContextPath(); // yourcontextpath
        String baseUrl = scheme + "://" + serverName + ":" + serverPort + contextPath + "/index";

		emailService.send(email, "SAPO - Cảm ơn vì đã đặt hàng tại SAPO STORE", EmailTemplate.getSuccessOrderTemplate(baseUrl));
	}

}
