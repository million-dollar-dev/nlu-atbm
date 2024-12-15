package util;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
}
