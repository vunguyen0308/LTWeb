package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Category;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.dao.ProductDao;
import vn.hcmuaf.edu.fit.lab6.service.CategoryService;
import vn.hcmuaf.edu.fit.lab6.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListControler", value = "/product")
public class ProductListControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
//            sort

            String sort = request.getParameter("sort");
            if(sort == null){
                sort = "0";
            }
            int sortCode = Integer.parseInt(sort);
            int sortByCode = -1;
            int conditionCode = -1;

            switch (sortCode){
                case 0:
                    sortByCode = 0;
                    conditionCode = 0;
                    break;
                case 1:
                    sortByCode = 1;
                    conditionCode = 0;
                    break;
                case 2:
                    sortByCode = 1;
                    conditionCode = 1;
                    break;
                case 3:
                    sortByCode = 2;
                    conditionCode = 1;
                    break;
                case 4:
                    sortByCode = 2;
                    conditionCode = 0;
                    break;
            }

//
            String indexString = request.getParameter("page");
            if(indexString == null){
                indexString = "1";
            }
            int page = Integer.parseInt(indexString);
            int count = ProductDao.getInstance().getTotal();
            String size = request.getParameter("sizepage");
            if(size == null){
                size = "20";
            }
            int pageSize = Integer.parseInt(size);


            int endPage = count/pageSize;
            if(count % pageSize != 0){
                endPage++;
            }

            List<Product> listP = ProductService.getInstance().getProduct(page,pageSize,sortByCode,conditionCode);
            List<Category> listC = CategoryService.getInstance().getAllCategory();

            request.setAttribute("size", size);
            request.setAttribute("sortCode", sort);
            request.setAttribute("end", endPage);
            request.setAttribute("product", listP);
            request.setAttribute("tag", page);
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("product.jsp").forward(request,response);

        }catch (Exception e){

        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }
}
