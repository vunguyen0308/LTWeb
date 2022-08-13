package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VerifyAccountController", value = "/VerifyAccountController")
public class VerifyAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("key1");
        String hashPass = request.getParameter("key2");

        Account a =  AccountService.getInstance().activeAccount(email,hashPass);
        session.setAttribute("closeTab","closeTab");
        if(a!= null){
            request.setAttribute("message","Your account has been activated!");
            request.setAttribute("user", a.getUsername());
            request.setAttribute("success","success");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            request.setAttribute("message","Account activation failed!");
            request.setAttribute("success","");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
