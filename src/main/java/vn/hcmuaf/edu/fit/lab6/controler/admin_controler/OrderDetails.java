package vn.hcmuaf.edu.fit.lab6.controler.admin_controler;

import vn.hcmuaf.edu.fit.lab6.beans.OrderDetail;
import vn.hcmuaf.edu.fit.lab6.service.AdminService;
import vn.hcmuaf.edu.fit.lab6.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OrderDetails", value = "/admin/orderDetails")
public class OrderDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        List<OrderDetail> orderDetailList = AdminService.getInstance().getAllOrderDetailByOrderId(orderId);

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
}
