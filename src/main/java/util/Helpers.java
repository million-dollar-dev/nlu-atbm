package util;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.http.HttpServletRequest;
import javaMail.EmailService;
import javaMail.EmailTemplate;
import javaMail.IJavaMail;

public class Helpers {
	public static boolean isValidPhoneNumber(String phoneNumber) {
		String patternRegex = "^(\\+?84|0[1-9])+([0-9]{8})$";
		Pattern pattern = Pattern.compile(patternRegex);
		Matcher matcher = pattern.matcher(phoneNumber);
		return matcher.matches();
	}

	public static String[] generateKeyPair(String algorithm, int keySize) throws Exception {
		KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance(algorithm);
		keyPairGen.initialize(keySize);

		KeyPair keyPair = keyPairGen.generateKeyPair();

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		String publicKeyBase64 = Base64.getEncoder().encodeToString(publicKey.getEncoded());
		String privateKeyBase64 = Base64.getEncoder().encodeToString(privateKey.getEncoded());

		return new String[] { publicKeyBase64, privateKeyBase64 };
	}
	
	public static void sendMail(String email, HttpServletRequest request) {
		IJavaMail emailService = new EmailService();
		String scheme = request.getScheme(); // http
		String serverName = request.getServerName(); // yourdomain
		int serverPort = request.getServerPort(); // port, ví dụ: 8080
		String contextPath = request.getContextPath(); // yourcontextpath
		String baseUrl = scheme + "://" + serverName + ":" + serverPort + contextPath + "/index";

		emailService.send(email, "SAPO - Cảm ơn vì đã đặt hàng tại SAPO STORE",
				EmailTemplate.getSuccessOrderTemplate(baseUrl));
	}
}