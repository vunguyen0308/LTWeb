package vn.hcmuaf.edu.fit.lab6.controler.admin_controler;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.beans.AccountStatus;
import vn.hcmuaf.edu.fit.lab6.dao.AccountStatusDao;
import vn.hcmuaf.edu.fit.lab6.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ActiveAccount", value = "/admin/activeAccount")
public class ActiveAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a_id = request.getParameter("id");
        Account a = AdminService.getInstance().activeAccount(a_id);
        if(a == null){
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }

    }
}
