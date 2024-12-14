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

@WebServlet("/addToCart")
public class AddToCartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDao = new ProductDAO();
		List<Product> listAllProduct = productDao.getAllProduct();
		Cookie[] cookies = request.getCookies();
		String txtCookie = "";
		if (cookies != null) {
			for (Cookie c: cookies) {
				if (c.getName().equals("cart")) {
					txtCookie += c.getValue();
					c.setMaxAge(0);
					response.addCookie(c);
				}			
			}
		}
		
		String id = request.getParameter("id");
		int size = Integer.parseInt(request.getParameter("size"));
		
		if (txtCookie.isEmpty()) {
			txtCookie = id + ":" + size;
		} else {
			txtCookie = txtCookie + "/" + id + ":" + size;
		}
		Cookie cookie = new Cookie("cart", txtCookie);
		cookie.setMaxAge(2 * 24 * 60 * 60);		
		response.addCookie(cookie);
		response.sendRedirect("product-detail?id=" + id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
}
