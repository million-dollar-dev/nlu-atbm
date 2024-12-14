package filter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class HttpsRedirectFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        if (!req.isSecure()) {
            String httpsURL = "https://" + req.getServerName() + ":8443" + req.getRequestURI();
            if (req.getQueryString() != null) {
                httpsURL += "?" + req.getQueryString();
            }
            res.sendRedirect(httpsURL);
        } else {
            chain.doFilter(request, response);
        }
    }
}

