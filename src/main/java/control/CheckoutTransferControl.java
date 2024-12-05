package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import entity.Cart;
import entity.Product;
import entity.User;

@WebServlet("/checkout")
public class CheckoutTransferControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutTransferControl() {
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null)
			response.sendRedirect("login.jsp");
		else {
			Cart cart = new Cart(txtCookie, listAllProduct);
			request.setAttribute("cart", cart);
			request.setAttribute("user", user);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
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

}
