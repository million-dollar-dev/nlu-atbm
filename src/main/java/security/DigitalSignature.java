package security;

import java.security.*;
import java.util.Base64;
import java.nio.charset.StandardCharsets;

public class DigitalSignature {

    private PrivateKey privateKey;
    private PublicKey publicKey;

    public void generateKeyPair(int keySize) throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(keySize);
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        this.privateKey = keyPair.getPrivate();
        this.publicKey = keyPair.getPublic();
    }

    public String signData(String data) throws Exception {
        if (data == null || data.isEmpty()) {
            throw new IllegalArgumentException();
        }

        Signature rsaSignature = Signature.getInstance("SHA256withRSA");
        rsaSignature.initSign(privateKey);
        rsaSignature.update(data.getBytes(StandardCharsets.UTF_8));

        byte[] signatureBytes = rsaSignature.sign();
        return Base64.getEncoder().encodeToString(signatureBytes);
    }

    public boolean verifySignature(String data, String signature) throws Exception {
        if (data == null || signature == null || signature.trim().isEmpty()) {
            throw new IllegalArgumentException();
        }

        Signature rsaSignature = Signature.getInstance("SHA256withRSA");
        rsaSignature.initVerify(publicKey);
        rsaSignature.update(data.getBytes(StandardCharsets.UTF_8));

        byte[] signatureBytes = Base64.getDecoder().decode(signature);
        return rsaSignature.verify(signatureBytes);
    }

    public PublicKey getPublicKey() {
        return publicKey;
    }

    public PrivateKey getPrivateKey() {
        return privateKey;
    }
    public static void main(String[] args) {
        try {
            DigitalSignature digitalSignature = new DigitalSignature();

            digitalSignature.generateKeyPair(2048);

            String data = "orderId: 1, ten nguoi mua: Thinh, gia: 200";

            String signature = digitalSignature.signData(data);
            System.out.println("Chữ ký: " + signature);

            boolean isVerified = digitalSignature.verifySignature(data, signature);
            if (isVerified) {
                System.out.println("chu ky hop le");
            } else {
                System.out.println("chu ky ko hop le");
            }

        } catch (NoSuchAlgorithmException e) {
            System.err.println();
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }
}

