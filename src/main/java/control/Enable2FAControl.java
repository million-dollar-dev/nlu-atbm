package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import security.GoogleAuthService;
import security.QRCodeService;
import security.TwoFAKeyHelper;

import java.io.IOException;

import dao.TwoFAKeyDAO;

@WebServlet("/enable2FA")
public class Enable2FAControl extends HttpServlet {
	private final GoogleAuthService googleAuthService = new GoogleAuthService();
	private final QRCodeService qrCodeService = new QRCodeService();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Enable2FAControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		TwoFAKeyDAO twofaDao = new TwoFAKeyDAO();
		String userId = request.getParameter("userId");
		if (!twofaDao.isGenKey(userId)) {
			String secretKey = googleAuthService.generateSecretKey();
			try {
				twofaDao.createKey(userId, TwoFAKeyHelper.encryptKey(secretKey));
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		if (!twofaDao.isActive(userId)) {
			try {
				
				String secretKey = TwoFAKeyHelper.decryptKey(twofaDao.getSecretKey(userId));
				String issuer = "Sapo Ecommerce";
				String qrText = String.format("otpauth://totp/%s?secret=%s&issuer=%s", issuer, secretKey, issuer);
				String qrCodeBase64 = qrCodeService.generateQRCode(qrText, 250, 250);
				request.setAttribute("qrCodeBase64", qrCodeBase64);
				request.setAttribute("userId", userId);
				request.getRequestDispatcher("/twofa-qr.jsp").forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
