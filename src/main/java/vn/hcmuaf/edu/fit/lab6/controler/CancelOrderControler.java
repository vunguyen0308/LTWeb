package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.beans.Order;
import vn.hcmuaf.edu.fit.lab6.beans.OrderDetail;
import vn.hcmuaf.edu.fit.lab6.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CancelOrderControler", value = "/cancelOrder")
public class CancelOrderControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String orderId = request.getParameter("orderId");
        List<OrderDetail> orderDetailList = OrderService.getInstance().getAllOrderDetailByOrderId(Integer.parseInt(orderId));
        for (OrderDetail od: orderDetailList) {
            OrderService.getInstance().updateProductQuantityCancelOrder(od);
        }
        OrderService.getInstance().cancelOrderByOrderId(orderId);

        Account a  = (Account) session.getAttribute("acc");
        List<Order> orderList = OrderService.getInstance().getAllOrderActive(a);
        PrintWriter out = response.getWriter();
        if(orderList.size() == 0){
            out.println(" <div id=\"empty-cart\">\n" +
                    "                <h2 class=\"text-center m-8 \"><strong>Your Order Is Empty</strong></h2>\n" +
                    "                <button style=\"display: block; margin: 0 auto\" type=\"button\" class=\"btn btn-lg btn-primary mt-2\" onclick=\"location.href ='product' \">Shopping Now</button>\n" +
                    "            </div>");
        }

    }
}
