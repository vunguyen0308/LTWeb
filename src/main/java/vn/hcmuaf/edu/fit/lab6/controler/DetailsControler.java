package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailsControler", value = "/detail")
public class DetailsControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String id = request.getParameter("pid");
            String brand = request.getParameter("brand");

            Product p = ProductService.getInstance().getProductById(id);
            List<Product> listNP = ProductService.getInstance().getProductByBrand(brand);

            request.setAttribute("detail", p);
            request.setAttribute("newp", listNP);

            request.getRequestDispatcher("single.jsp").forward(request,response);
        }catch (Exception e){

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
