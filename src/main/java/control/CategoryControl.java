package control;

import jakarta.servlet.ServletException;
import entity.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.CategoryDAO;
import dao.ProductDAO;

@WebServlet("/category")
public class CategoryControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int numProductPerPage = 8; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get request para
		int categoryId = Integer.parseInt(request.getParameter("id"));
		String pageIndex = request.getParameter("page");
		if (pageIndex == null) 
			pageIndex = "1";
		int pageNum = Integer.parseInt(pageIndex);
		//get data from dao
		ProductDAO productDao = new ProductDAO();
		List<Product> list = productDao.getProductByCategoryId(categoryId, pageNum);
		
		CategoryDAO categoryDao = new CategoryDAO();
		List<Category> listAllCategory = categoryDao.getAllCategory();
		
		int totalProduct = productDao.countProductByCategoryId(categoryId);
		int endPage = (totalProduct % numProductPerPage > 0) ? (totalProduct / numProductPerPage + 1) : (totalProduct / numProductPerPage);
		
		String link = getLink(request) + categoryId + "&page=";
		
		request.setAttribute("linkPage", link);
		request.setAttribute("pageTag", pageNum);
		request.setAttribute("tag", categoryId);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCategory", listAllCategory);
		request.setAttribute("listProduct", list);
		request.getRequestDispatcher("product-listing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String getLink(HttpServletRequest request) {
		String scheme = request.getScheme(); // http
        String serverName = request.getServerName(); // yourdomain
        int serverPort = request.getServerPort(); // port, ví dụ: 8080
        String contextPath = request.getContextPath(); // yourcontextpath
        return scheme + "://" + serverName + ":" + serverPort + contextPath + "/category?id=";
	}

}
