package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterControler", value = "/register")
public class RegisterControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("register.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String user = request.getParameter("Username");
            String pass = request.getParameter("Password");
            String email = request.getParameter("Email");

            Account a = AccountService.getInstance().checkAccountExist(user);
            if(a == null){
                AccountService.getInstance().register(user,pass,email);
                Account ac = AccountService.getInstance().login(user,pass);
                HttpSession session = request.getSession();
                session.setAttribute("acc", ac);
                response.sendRedirect("index");

            }else{
                request.setAttribute("user", user);
                request.setAttribute("email", email);
                request.setAttribute("message", "Username already exists");
                request.getRequestDispatcher("register.jsp").forward(request,response);
            }
        }catch (Exception e){

        }

    }
}
