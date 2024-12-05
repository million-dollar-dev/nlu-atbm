package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Cart;
import entity.CartItem;
import entity.Category;
import entity.Product;
import entity.Review;

@WebServlet("/product-detail")
public class DetailControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		ProductDAO productDao = new ProductDAO();
		Product product = productDao.getProductById(id);
		int categoryId = product.getCategory().getId();
		List<Product> listRec = productDao.getProductByCategoryId(categoryId);
		List<String> listSize = productDao.getSizeListById(id);
		List<Review> listReview = productDao.getAllReviewByProductId(id + "");
		
		request.setAttribute("reviewCount", listReview.size());
		request.setAttribute("listReview", listReview);
		request.setAttribute("listSize", listSize);
		request.setAttribute("product", product);
		request.setAttribute("listRec", listRec);
		request.setAttribute("id", id);
		request.getRequestDispatcher("product-detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
