package vn.hcmuaf.edu.fit.lab6.filter;

import vn.hcmuaf.edu.fit.lab6.beans.Cart;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "OrderFilter",urlPatterns = "/order/*")
public class OrderFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();

        String referer = httpServletRequest.getHeader("referer");
        if(referer == null || !referer.endsWith("checkout")){
            httpServletResponse.sendRedirect("checkout");
        }else{
            chain.doFilter(request,response);
        }
    }
}
