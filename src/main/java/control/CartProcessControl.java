package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import entity.Cart;
import entity.CartItem;
import entity.Product;

@WebServlet("/cartProcess")
public class CartProcessControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartProcessControl() {
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
				if (c.getName().equals("cart")) {
					txtCookie += c.getValue();
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		Cart cart = new Cart(txtCookie, listAllProduct);

		String numRaw = request.getParameter("num");
		String idRaw = request.getParameter("id");
		String size = request.getParameter("size");
		int num, id = 0;
		try {
			id = Integer.parseInt(idRaw);
			Product product = productDao.getProductById(id);
			int sizeStockQuantity = productDao.getQuantityBySizeAndId(size, id);
			num = Integer.parseInt(numRaw);
			if (num == -1 && (cart.getQuantityById(id, size) <= 1)) {
				cart.removeItem(id, size);
			}
			else {
				if (num == 1 && cart.getQuantityById(id, size) >= sizeStockQuantity) {
					num = 0;
				}
				CartItem cartItem = new CartItem(product, num, product.getPrice(), size);
				cart.addItem(cartItem);
//				cart.showCart();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		List<CartItem> items = cart.getItems();
		txtCookie = "";
		if (items.size() > 0) {
			for (int i = 0; i < items.size(); i++) {
				for (int j = 0; j < items.get(i).getQuantity(); j++) {
					txtCookie += "/" + items.get(i).getProduct().getId() + ":" + items.get(i).getSize();
				}
			}
		}
		if (txtCookie.length() > 0)
			txtCookie = txtCookie.substring(1);
		Cookie cookie = new Cookie("cart", txtCookie);
		cookie.setMaxAge(60 * 60 * 24 * 2);
		response.addCookie(cookie);
		Cart newCart = new Cart(txtCookie, listAllProduct);
		request.setAttribute("cart", newCart);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO productDao = new ProductDAO();
		List<Product> listAllProduct = productDao.getAllProduct();
		Cookie[] cookies = request.getCookies();
		String txtCookie = "";
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("cart")) {
					txtCookie += c.getValue();
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		String id = request.getParameter("id");
		String out = "";
		String[] arr = txtCookie.split("/");
		for (int i = 0; i < arr.length; i++) {
			String[] arrSon = arr[i].split(":");
			if (!arrSon[0].equals(id)) {
				if (out.isEmpty()) {
					out = arr[i];
				} else {
					out += "/" + arr[i];
				}
			}				
		}

		if (!out.isEmpty()) {
			Cookie cookie = new Cookie("cart", out);
			cookie.setMaxAge(2 * 24 * 60 * 60);
			response.addCookie(cookie);
		}
		
		Cart cart = new Cart(out, listAllProduct);
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}
	
	
}
