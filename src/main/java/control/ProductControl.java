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

@WebServlet("/product")
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get data from dao
		ProductDAO productDao = new ProductDAO();
		List<Product> listAllProduct = productDao.getAllProduct();
		List<Product> list3Last = productDao.getTopLastProduct(3);
		
		CategoryDAO categoryDao = new CategoryDAO();
		List<Category> listAllCategory = categoryDao.getAllCategory();
		
		// set data to jsp
		request.setAttribute("listProduct", listAllProduct);
		request.setAttribute("list3Last", list3Last);
		request.setAttribute("listCategory", listAllCategory);
		request.getRequestDispatcher("product.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
