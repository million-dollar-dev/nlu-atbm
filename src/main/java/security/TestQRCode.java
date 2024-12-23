package security;
import java.nio.file.Paths;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;


public class TestQRCode {
	public static void main(String[] args) throws Exception {
        String qrText = "otpauth://totp/MyApp:UserEmail?secret=MYSECRETKEY&issuer=MyApp";
        BitMatrix bitMatrix = new com.google.zxing.qrcode.QRCodeWriter().encode(
            qrText, BarcodeFormat.QR_CODE, 250, 250
        );
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", Paths.get("qr_code.png"));
        System.out.println("QR Code saved as qr_code.png");
    }
}
