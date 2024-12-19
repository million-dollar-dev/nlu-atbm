package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.Helpers;

import java.io.IOException;

import dao.KeyDAO;
import dao.UserDAO;
import entity.User;
import entity.UserKey;

@WebServlet("/createKey")
public class CreateKeyControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateKeyControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String algo = request.getParameter("algoKey");
		int keySize = Integer.valueOf(request.getParameter("keySize"));
		String expireStr = request.getParameter("expireTime");
		int expireTime = expireStr == "" ? 0 : Integer.valueOf(expireStr);
		KeyDAO keyDao = new KeyDAO();
		try {
			String[] key = Helpers.generateKeyPair(algo, keySize);
			String publicKey = key[0];
			String secretKey = key[1];
			int keyId;
			keyDao.deactivateKeys(userId);
			if (expireTime != 0)
				keyId = keyDao.createKey(userId, publicKey, algo, keySize, expireTime);
			else
				keyId = keyDao.createKey(userId, publicKey, algo, keySize);
			UserKey createdKey = keyDao.getKeyActiveByKeyId(keyId);
			
			request.setAttribute("publicKey", publicKey);
			request.setAttribute("secretKey", secretKey);
			request.setAttribute("key", createdKey);
			request.getRequestDispatcher("your-info.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
