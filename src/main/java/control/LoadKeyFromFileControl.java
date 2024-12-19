package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import dao.KeyDAO;
import dao.OrderDAO;
import dao.UserDAO;
import entity.OrderRow;
import entity.User;
import entity.UserKey;

@WebServlet("/loadKeyFromFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // Kích thước bộ nhớ tạm (1MB)
		maxFileSize = 1024 * 1024 * 5, // Kích thước file tối đa (5MB)
		maxRequestSize = 1024 * 1024 * 10 // Kích thước request tối đa (10MB)
)
public class LoadKeyFromFileControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadKeyFromFileControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Part filePart = request.getPart("keyFile");
		StringBuilder fileData = new StringBuilder();
		String userId = request.getParameter("userId");

		// Đọc nội dung file
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(filePart.getInputStream()))) {
			String line;
			while ((line = reader.readLine()) != null) {
				fileData.append(line).append("\n");
			}
		}

		// Xử lý nội dung file và trích xuất thông tin
		String fileContent = fileData.toString();
		System.out.println(fileContent);
		StringBuilder result = new StringBuilder();

		try {
			String[] lines = fileContent.split("\n");
			for (String line : lines) {
				if (line.startsWith("User ID:")) {
					result.append("User ID: ").append(line.split(":")[1].trim()).append("\n");
				} else if (line.startsWith("Public Key:")) {
					result.append("Public Key: ").append(line.split(":")[1].trim()).append("\n");
				} else if (line.startsWith("Secret Key:")) {
					result.append("Secret Key: ").append(line.split(":")[1].trim()).append("\n");
				} else if (line.startsWith("Key type:")) {
					result.append("Key Type: ").append(line.split(":")[1].trim()).append("\n");
				} else if (line.startsWith("Key size:")) {
					result.append("Key Size: ").append(line.split(":")[1].trim()).append("\n");
				} else if (line.startsWith("Created at:")) {
					result.append("Created At: ").append(line.split(":")[1].trim()).append("\n");
				} else if (line.startsWith("Expire at:")) {
					result.append("Expire At: ").append(line.split(":")[1].trim()).append("\n");
				}
			}
		} catch (Exception e) {
			result.append("Upload không thành công, vui lòng kiểm tra lại file!").append(e.getMessage());
		}
		System.out.println(result);
		request.setAttribute("uploadMess", result.toString());
		request.getRequestDispatcher("yourInfo?id=" + userId).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
