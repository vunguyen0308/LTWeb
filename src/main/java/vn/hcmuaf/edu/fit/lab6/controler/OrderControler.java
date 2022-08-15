package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.*;
import vn.hcmuaf.edu.fit.lab6.service.OrderService;
import vn.hcmuaf.edu.fit.lab6.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OrderControler", value = "/order")
public class OrderControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");

        Account account =(Account) session.getAttribute("acc");
        Cart cart  = (Cart) session.getAttribute("cart");

        Order order = new Order(account,cart.total(),"1",fullname,address,phone_number);

        int order_id = OrderService.getInstance().createOrder(order);
        for (Product p : cart.getData()) {
            OrderDetail orderDetail = new OrderDetail(order_id,p,p.getSellPrice(),p.getQuantitySold());
            OrderService.getInstance().createOrderDetail(orderDetail);
            ProductService.getInstance().updateProductQuantity(p,p.getQuantitySold());
        }
        session.removeAttribute("cart");
        cart.getData().clear();
        response.sendRedirect("orders-success");
    }

}
