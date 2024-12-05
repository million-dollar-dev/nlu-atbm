package security;

import java.security.*;
import java.util.Base64;

public class DigitalSignatureExample {
    public static void main(String[] args) {
        try {
            // 1. Tạo cặp khóa
            KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");
            keyPairGen.initialize(2048);
            KeyPair keyPair = keyPairGen.generateKeyPair();
            PrivateKey privateKey = keyPair.getPrivate();
            System.out.println("pk:" + privateKey);
            PublicKey publicKey = keyPair.getPublic();
            System.out.println("plk:" + publicKey);

            // 2. Dữ liệu cần ký
            String data = "Đây là dữ liệu cần ký";
            byte[] dataBytes = data.getBytes();

            // 3. Ký dữ liệu
            Signature signature = Signature.getInstance("SHA256withRSA");
            signature.initSign(privateKey);
            signature.update(dataBytes);
            byte[] digitalSignature = signature.sign();

            System.out.println("Chữ ký số (Base64): " + Base64.getEncoder().encodeToString(digitalSignature));

            // 4. Xác minh chữ ký
            signature.initVerify(publicKey);
            signature.update(dataBytes);
            boolean isValid = signature.verify(digitalSignature);

            System.out.println("Chữ ký hợp lệ: " + isValid);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

