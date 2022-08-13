package vn.hcmuaf.edu.fit.lab6.controler.admin_controler;

import vn.hcmuaf.edu.fit.lab6.beans.Category;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.service.AdminService;
import vn.hcmuaf.edu.fit.lab6.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product_Management", value = "/admin/product-management")
public class Product_Management extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> pList = AdminService.getInstance().getAllProducts();
        List<Category> categoryList = CategoryService.getInstance().getAllCategory();

        request.setAttribute("listP",pList);
        request.setAttribute("listC",categoryList);

        request.getRequestDispatcher("product-management.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
