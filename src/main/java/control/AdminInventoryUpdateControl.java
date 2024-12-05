package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import dao.ProductDAO;

@WebServlet("/updateInventoryDone")
public class AdminInventoryUpdateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInventoryUpdateControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		ProductDAO dao = new ProductDAO();
		TreeMap<String, Integer> map = dao.getInventoryById(id);
		Set<String> set = map.keySet();
		for (String str: set) {
			int quantity = Integer.parseInt(request.getParameter(str));
			map.put(str, quantity);
		}
		
		for (Map.Entry<String, Integer> entry : map.entrySet()) {
            dao.updateInventory(id, entry.getKey(), entry.getValue());
        }
		response.sendRedirect("readInventory");
	}

}
