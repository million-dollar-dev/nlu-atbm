package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import dao.ImageDAO;
import dao.ProductDAO;
import entity.Product;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet("/createProductSubmit")
public class AdminProductCreateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIRECTORY = "imageShoe";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminProductCreateControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		int price = Integer.parseInt(request.getParameter("price"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		String description = request.getParameter("description");
				
		ProductDAO pDao = new ProductDAO();
		pDao.insertProduct(name, categoryId, price, sale, description);
		int id = pDao.getTopLastProduct(1).get(0).getId();
		createInventory(id, categoryId, pDao);
		uploadFile(request, id);
		response.sendRedirect("readProduct");
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

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
				clientFileName = clientFileName.replace("\\", "/");
				int i = clientFileName.lastIndexOf('/');
				return clientFileName.substring(i + 1);
			}
		}
		return null;
	}

	private void uploadFile(HttpServletRequest request, int id) {
		try {
			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath = request.getServletContext().getRealPath("");
			appPath = appPath.replace('\\', '/');

			// Thư mục để save file tải lên.
			String fullSavePath = null;
			if (appPath.endsWith("/")) {
				fullSavePath = appPath + SAVE_DIRECTORY;
			} else {
				fullSavePath = appPath + "/" + SAVE_DIRECTORY;
			}

			File fileSaveDir = new File(fullSavePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}

			ImageDAO dao = new ImageDAO();
			// Danh mục các phần đã upload lên (Có thể là nhiều file).
			for (Part part : request.getParts()) {
				String fileName = extractFileName(part);
				if (fileName != null && fileName.length() > 0) {
					String filePath = fullSavePath + "/" + fileName;
					System.out.println("Write attachment to file: " + filePath);
					part.write(filePath);
					dao.insertImageForProductId("" + id, fileName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createInventory(int id, int categoryId, ProductDAO dao) {
		if (categoryId < 5) {
			int size = 39;
			for (int i = 0; i < 5; i++) {
				dao.createInventory(id, size++ + "", 1);
			}
		} else {
			int size = 1;
			for (int i = 0; i < 3; i++) {				
				dao.createInventory(id, size++ + "", 1);
			}
		}
	}
}
