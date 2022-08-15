package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Category;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.dao.ProductDao;
import vn.hcmuaf.edu.fit.lab6.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryControler", value = "/category")
public class CategoryControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String cateID = request.getParameter("cid");

//            pagination
            String indexString = request.getParameter("page");
            if(indexString == null){
                indexString = "1";
            }
            int page = Integer.parseInt(indexString);
            int count = ProductDao.getInstance().getTotalByCategory(cateID);
            String size = request.getParameter("sizepage");
            if(size == null){
                size = "20";
            }
            int pageSize = Integer.parseInt(size);


            int endPage = count/pageSize;
            if(count % pageSize != 0){
                endPage++;
            }

            List<Product> listPByC = CategoryService.getInstance().getProductByCID(cateID,page,pageSize);
            List<Category> listC = CategoryService.getInstance().getAllCategory();

            request.setAttribute("listPByC", listPByC);
            request.setAttribute("listC", listC);
            request.setAttribute("size", size);
            request.setAttribute("end", endPage);
            request.setAttribute("tag", page);
            request.setAttribute("tagC", Integer.parseInt(cateID));
            request.getRequestDispatcher("category.jsp").forward(request,response);
        }catch (Exception e){

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
