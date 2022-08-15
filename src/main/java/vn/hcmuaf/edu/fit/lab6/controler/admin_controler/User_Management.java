package vn.hcmuaf.edu.fit.lab6.controler.admin_controler;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.dao.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "User_Management", value = "/admin/user-management")
public class User_Management extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Account> aList = AdminDao.getInstance().getAllAccount();
        request.setAttribute("listA",aList);
        request.getRequestDispatcher("user-management.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
