package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.OrderDetail;
import vn.hcmuaf.edu.fit.lab6.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OrdersDetailHistoryControler", value = "/ordersdetail-history")
public class OrdersDetailHistoryControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("orderId");
        int orderId = Integer.parseInt(id);

        List<OrderDetail> orderDetailList = OrderService.getInstance().getAllOrderDetailByOrderId(orderId);
        PrintWriter out = response.getWriter();
        int count = 0;
        for (OrderDetail od: orderDetailList) {
            count++;
            out.println("<tr>\n" +
                    "                           <td>"+count+"</td>\n" +
                    "                           <td>"+od.getProduct().getName()+"</td>\n" +
                    "                           <td> $"+od.getPrice()+"</td>\n" +
                    "                           <td>"+od.getQuantity()+"</td>\n" +
                    "                       </tr>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
