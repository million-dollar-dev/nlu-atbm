package security;

import com.warrenstrange.googleauth.GoogleAuthenticator;

public class TestGoogleAuth {
	public static void main(String[] args) {
        GoogleAuthenticator gAuth = new GoogleAuthenticator();
        String secretKey = gAuth.createCredentials().getKey();
        System.out.println("Secret Key: " + secretKey);
    }
}
