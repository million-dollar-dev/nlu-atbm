package filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.http.HttpRequest;

@WebFilter(urlPatterns = { "/*" }, initParams = {
		@WebInitParam(name = "excludedPage",
				value = "/category,/list-product,/product-detail,/updateProduct,"
						+ "/updateInventory,/updateUser") })
public class HomeFilter extends HttpFilter {

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public HomeFilter() {
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
		String url = httpRequest.getRequestURI();
		if (url.endsWith(".jsp")) {
			if (!url.endsWith("blog-detail.jsp") && !url.endsWith("login.jsp") && !url.endsWith("register.jsp")
					&& !url.endsWith("adminAccountCreate.jsp") && !url.endsWith("contact-us.jsp")
					&& !url.endsWith("error-500.jsp") && !url.endsWith("error-404.jsp")
					&& !url.endsWith("forgot-password.jsp") && !url.endsWith("success.jsp")) {
				httpResponse.sendRedirect("index");
				return;
			}

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
