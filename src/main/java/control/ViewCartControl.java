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
import entity.Product;
@WebServlet("/viewCart")
public class ViewCartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCartControl() {
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
				}			
			}
		}
		Cart cart = new Cart(txtCookie, listAllProduct);
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
