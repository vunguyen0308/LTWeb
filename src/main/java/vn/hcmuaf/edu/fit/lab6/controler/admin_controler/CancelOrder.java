package vn.hcmuaf.edu.fit.lab6.controler.admin_controler;

import vn.hcmuaf.edu.fit.lab6.beans.Order;
import vn.hcmuaf.edu.fit.lab6.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancelOrder", value = "/admin/cancelOrder")
public class CancelOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oId = request.getParameter("id");
        Order o = AdminService.getInstance().cancelOrder(oId);
        if(o == null){
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
