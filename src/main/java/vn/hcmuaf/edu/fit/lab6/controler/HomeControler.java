package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "HomeControler", value = "/index")
public class HomeControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String naId = request.getParameter("pg");
        if(naId == null){
            naId = "female";
        }
        List<Product> listPNA = ProductService.getInstance().getProductByGender(naId);
        request.setAttribute("listPNA", listPNA);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            String naId = request.getParameter("pg");
            if(naId == null){
                naId = "female";
            }
            List<Product> listPNA = ProductService.getInstance().getProductByGender(naId);
            PrintWriter out = response.getWriter();

            for (Product p: listPNA) {
                out.println("<div class=\"col-md-3 product-men\">\n" +
                        "\t\t\t\t\t\t\t\t<div class=\"men-pro-item simpleCart_shelfItem\">\n" +
                        "\t\t\t\t\t\t\t\t\t<div class=\"men-thumb-item\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<img src=\""+ p.getImg()+"\" alt=\"\" class=\"pro-image-front\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<img src=\""+ p.getImg()+"\" alt=\"\" class=\"pro-image-back\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<div class=\"men-cart-pro\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t<div class=\"inner-men-cart-pro\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"detail?pid="+ p.getId()+"&brand="+ p.getBrand()+"\" class=\"link-product-add-cart\">Quick View</a>\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t\t\t\t<span class=\"product-new-top\">New</span>\n" +
                        "\n" +
                        "\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t\t\t<div class=\"item-info-product \">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<h4><a href=\"detail?pid="+ p.getId()+"&brand="+ p.getBrand()+"\">"+ p.getName()+"</a></h4>\n" +
                        "\t\t\t\t\t\t\t\t\t\t<div class=\"info-product-price\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t<span class=\"item_price\">"+ p.getSellPrice() + " USD</span>\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t<del>"+ p.getPrice()+" USD</del>\n" +
                        "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t\t\t\t<div class=\"snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t<form id=\"add-cart-form\" class=\"add-form\" action=\"\" method=\"post\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t\t<fieldset>\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"submit\" name=\"submit\" value=\"Add to cart\" class=\"button addToCart\" pid=\""+p.getId()+"\" pname=\""+p.getName()+"\" pprice=\""+p.getSellPrice()+"\">\n"+
                        "\t\t\t\t\t\t\t\t\t\t\t\t</fieldset>\n" +
                        "\t\t\t\t\t\t\t\t\t\t\t</form>\n" +
                        "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\n" +
                        "\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t</div>");

            }

        }catch (Exception e){

        }
    }
}
