package security;

import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;

public class GoogleAuthService {
	private final GoogleAuthenticator googleAuthenticator;

	public GoogleAuthService() {
		this.googleAuthenticator = new GoogleAuthenticator();
	}

	/**
	 * Tạo một Secret Key mới.
	 * 
	 * @return Secret Key.
	 */
	public String generateSecretKey() {
		GoogleAuthenticatorKey key = googleAuthenticator.createCredentials();
		return key.getKey();
	}

	/**
	 * Xác minh mã OTP.
	 * 
	 * @param secretKey Secret Key.
	 * @param otp       Mã OTP do người dùng nhập.
	 * @return true nếu mã OTP hợp lệ, false nếu không.
	 */
	public boolean validateOTP(String secretKey, int otp) {
		return googleAuthenticator.authorize(secretKey, otp);
	}
}
