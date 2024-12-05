package filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.http.HttpRequest;

import dao.ProductDAO;
import entity.Product;

@WebFilter("/product-detail")
public class ProductDetailFilter extends HttpFilter {

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public ProductDetailFilter() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String idString = httpRequest.getParameter("id");
        if (idString != null && !idString.isEmpty()) {
            try {
                int id = Integer.parseInt(idString);
                ProductDAO dao = new ProductDAO();
                Product p = dao.getProductById(id);
                if (p == null) {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/error-404.jsp");
                    return;
                }
            } catch (NumberFormatException e) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/error-500.jsp");
                return;
            }
        } else {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error-500.jsp");
            return;
        }
        chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
