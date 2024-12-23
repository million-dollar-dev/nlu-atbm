package security;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

public class QRCodeService {
	public String generateQRCode(String text, int width, int height) throws IOException {
		try {
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

			// Lưu mã QR vào ByteArrayOutputStream
			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			MatrixToImageWriter.writeToStream(bitMatrix, "PNG", byteArrayOutputStream);

			// Chuyển ByteArray thành Base64 để nhúng vào trang JSP
			byte[] qrCodeBytes = byteArrayOutputStream.toByteArray();
			return Base64.getEncoder().encodeToString(qrCodeBytes);
		} catch (Exception e) {
			throw new IOException("Lỗi khi tạo mã QR", e);
		}
	}
}
