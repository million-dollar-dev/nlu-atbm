package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import entity.Category;
import entity.Product;

@WebServlet("/index")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get data from dao
		ProductDAO dao = new ProductDAO();
		List<Product> listProduct = dao.getTopProduct(12);
		Product lastItem = dao.getTopLastProduct(1).get(0);
		List<Product> listTopSeller = dao.getTopLastProduct(10);
		// set data to jsp
		
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("listTopSeller", listTopSeller);
		request.setAttribute("lastItem", lastItem);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
