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
import java.util.List;

import dao.ImageDAO;
import dao.ProductDAO;
import entity.Image;
@WebServlet("/updateProductSubmit")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 5 * 5)

public class AdminProductUpdateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIRECTORY = "imageShoe";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductUpdateControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		String status = request.getParameter("status");
		int price = Integer.parseInt(request.getParameter("price"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		String description = request.getParameter("description");
		ProductDAO pDao = new ProductDAO();
		pDao.updateProduct(id, name, categoryId, status, price, sale, description);
		uploadFile(request, Integer.parseInt(id));
		response.sendRedirect("readProduct");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			if (request.getParts().isEmpty())
				return;
			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath = request.getServletContext().getRealPath("");
			appPath = appPath.replace('\\', '/');
			System.out.println(appPath);

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
			List<Image> listImg = dao.getAllImageByProductId(id);
			deleteImageInFolder(listImg, fileSaveDir);
			dao.deleteImageByProductId(id + "");
			// Danh mục các phần đã upload lên (Có thể là nhiều file).
			for (Part part : request.getParts()) {
				String fileName = extractFileName(part);
				if (fileName != null && fileName.length() > 0) {
					String filePath = fullSavePath + "/" + fileName;
					
					part.write(filePath);
					dao.insertImageForProductId("" + id, fileName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void deleteImageInFolder(List<Image> list, File file) {
		for (Image i:list) {
			for (File f: file.listFiles()) {
				if (f.getName().equals(i.getPath()))
					f.delete();
			}
		}
	}
	
}
