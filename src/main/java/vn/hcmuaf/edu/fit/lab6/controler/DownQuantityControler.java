package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DownQuantityControler", value = "/downQuantity")
public class DownQuantityControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String pid = request.getParameter("id");
        int id = Integer.parseInt(pid);
        cart.downQuantity(id);
        if(cart.get(id).getQuantitySold() <= 0){
            cart.remove(id);
        }

        double total = cart.total();
        PrintWriter out = response.getWriter();
        if(cart.getData().size() == 0){
            out.println(" <h2 class=\"text-center m-8 \"><strong>Your Cart Is Empty</strong></h2>\n" +
                    "            <button style=\"display: block; margin: 0 auto\" type=\"button\" class=\"btn btn-lg btn-primary mt-2\" onclick=\"location.href ='product' \">Shopping Now</button>");
        }else{
            out.println(total);

        }
    }
}
