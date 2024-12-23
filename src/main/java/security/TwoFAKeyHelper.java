package security;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class TwoFAKeyHelper {
	private static final String ALGORITHM = "AES";
	private static final String ENCRYPTION_KEY = "yoMQgZbKwCFpJi29HG4zoA==";

	public static String encryptKey(String secretKey) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		SecretKey keySpec = new SecretKeySpec(ENCRYPTION_KEY.getBytes(), ALGORITHM);
		cipher.init(Cipher.ENCRYPT_MODE, keySpec);
		byte[] encryptedBytes = cipher.doFinal(secretKey.getBytes());
		return Base64.getEncoder().encodeToString(encryptedBytes);
	}

	public static String decryptKey(String encryptedKey) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		SecretKey keySpec = new SecretKeySpec(ENCRYPTION_KEY.getBytes(), ALGORITHM);
		cipher.init(Cipher.DECRYPT_MODE, keySpec);
		byte[] decodedBytes = Base64.getDecoder().decode(encryptedKey);
		byte[] decryptedBytes = cipher.doFinal(decodedBytes);
		return new String(decryptedBytes);
	}

	public static void main(String[] args) throws Exception {
		String key = encryptKey("tôi tên tuấn");
		System.out.println(key);
		String result = decryptKey(key);
		System.out.println(result);
	}
}
