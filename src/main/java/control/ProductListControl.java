package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;

@WebServlet("/product-listing")

public class ProductListControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int numProductPerPage = 8;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductListControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO dao = new ProductDAO();
		CategoryDAO cateDao = new CategoryDAO();
		List<Category> listCate = cateDao.getAllCategory();
		String id = request.getParameter("id");
		String pageIndex = request.getParameter("page");
		if (pageIndex == null)
			pageIndex = "1";
		int pageNum = Integer.parseInt(pageIndex);
		
		List<Product> listAllProduct = null;
		int totalProduct = 0;
		switch (id) {
		case "1":
			totalProduct = dao.getAllShoe(4).size();
			listAllProduct = dao.getAllShoe(4, pageNum);
			break;
		case "2":
			totalProduct = dao.getOtherProduct(5).size();
			listAllProduct = dao.getOtherProduct(5, pageNum);
			break;
		default:
			totalProduct = dao.getAllProduct().size();
			listAllProduct = dao.getAllProduct();
		}
		String link = getLink(request) + id + "&page=";
		int endPage = (totalProduct % numProductPerPage > 0) ? (totalProduct / numProductPerPage + 1)
				: (totalProduct / numProductPerPage);
		
		request.setAttribute("linkPage", link);
		request.setAttribute("pageTag", pageNum);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCategory", listCate);
		request.setAttribute("id", Integer.parseInt(id));
		request.setAttribute("listProduct", listAllProduct);
		request.getRequestDispatcher("product-listing.jsp").forward(request, response);
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

	private String getLink(HttpServletRequest request) {
		String scheme = request.getScheme(); // http
		String serverName = request.getServerName(); // yourdomain
		int serverPort = request.getServerPort(); // port, ví dụ: 8080
		String contextPath = request.getContextPath(); // yourcontextpath
		return scheme + "://" + serverName + ":" + serverPort + contextPath + "/product-listing?id=";
	}
}
