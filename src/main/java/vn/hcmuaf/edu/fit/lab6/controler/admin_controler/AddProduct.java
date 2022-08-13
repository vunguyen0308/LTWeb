package vn.hcmuaf.edu.fit.lab6.controler.admin_controler;

import vn.hcmuaf.edu.fit.lab6.service.AdminService;
import vn.hcmuaf.edu.fit.lab6.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddProduct", value = "/admin/addProduct")
public class AddProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("productName");
        String brandId = request.getParameter("productBrand");
        String brand = "";
        if(!brandId.equals("7")){
            brand = CategoryService.getInstance().getCategoryByCId(brandId).getcName();
        }else{
            brand = request.getParameter("otherBrand");
        }
        String gender = request.getParameter("gender");
        String origin = request.getParameter("productOrigin");
        String concentration = request.getParameter("productConcentration");
        String capacity = request.getParameter("productCapacity");
        String description = request.getParameter("productDescription");
        String price = request.getParameter("productPrice");
        String sellPrice = request.getParameter("productSellPrice");
        String style = request.getParameter("productStyle");
        String img = request.getParameter("productImage");
        String quantity = request.getParameter("productQuantity");

        System.out.println(brandId);
        AdminService.getInstance().addProduct(name,brand,gender,origin,concentration,capacity,description,price,sellPrice,style,img,quantity,brandId);
        response.sendRedirect("/lab6_war_exploded/admin/product-management");
    }
}
