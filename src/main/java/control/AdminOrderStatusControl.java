package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.OrderDAO;
import entity.User;

@WebServlet("/orderStatusChange")
/**
 * Servlet implementation class AdminOrderAcceptControl
 */
public class AdminOrderStatusControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminOrderStatusControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");
		OrderDAO dao = new OrderDAO();
		switch (status.toUpperCase()) {
		case "ACCEPT":
			dao.setOrderStatus(id, "Đã xác nhận");
			break;
		case "SHIP":
			dao.setOrderStatus(id, "Đang giao hàng");
			break;
		case "DONE":
			dao.setOrderStatus(id, "Hoàn thành");
			break;
		case "DELETE":
			dao.setOrderStatus(id, "Hủy");
			break;
		default:
			dao.setOrderStatus(id, "Chờ xác nhận");
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (user.getRole().equalsIgnoreCase("customer"))
			response.sendRedirect("yourOrder?id=" + user.getUserId());
		else
			response.sendRedirect("readOrder");

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
