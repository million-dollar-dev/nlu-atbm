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

@WebServlet("/verifyOTP")
public class VerifyOTPControl extends HttpServlet {
	private final GoogleAuthService googleAuthService = new GoogleAuthService();
	private final QRCodeService qrCodeService = new QRCodeService();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VerifyOTPControl() {
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
		String otpStr = request.getParameter("otp");
		String userId = request.getParameter("userId");
		System.out.println(otpStr);
		System.out.println(userId);
		try {
			String secretKey = TwoFAKeyHelper.decryptKey(twofaDao.getSecretKey(userId));
			int otp = Integer.parseInt(otpStr);
			boolean isValid = googleAuthService.validateOTP(secretKey, otp);
			System.out.println(isValid);
			System.out.println(secretKey);
			if (isValid) {
                response.getWriter().write("success"); // Gửi phản hồi thành công
            } else {
                response.getWriter().write("Mã OTP không chính xác."); // Gửi thông báo lỗi
            }
			System.out.println(isValid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().write("Lỗi: Mã OTP không hợp lệ.");
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
