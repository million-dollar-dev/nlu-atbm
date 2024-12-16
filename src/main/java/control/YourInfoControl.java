package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.KeyDAO;
import dao.OrderDAO;
import dao.UserDAO;
import entity.OrderRow;
import entity.User;
import entity.UserKey;

@WebServlet("/yourInfo")
public class YourInfoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YourInfoControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null)
			response.sendRedirect("login.jsp");
		else {
			int id = Integer.parseInt(request.getParameter("id"));
			UserDAO userDao = new UserDAO();
			User userInfo = userDao.getUserById(String.valueOf(id));
			KeyDAO keyDao = new KeyDAO();
			UserKey key = keyDao.getKeyActiveByUserId(id);
			request.setAttribute("user", userInfo);
			request.setAttribute("key", key);
			request.getRequestDispatcher("your-info.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
