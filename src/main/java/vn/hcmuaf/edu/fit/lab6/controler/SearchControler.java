package vn.hcmuaf.edu.fit.lab6.controler;

import vn.hcmuaf.edu.fit.lab6.beans.Category;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.dao.ProductDao;
import vn.hcmuaf.edu.fit.lab6.service.CategoryService;
import vn.hcmuaf.edu.fit.lab6.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControler", value = "/search")
public class SearchControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String search = request.getParameter("search");
            if(search == null){
                search = "";
            }
//            sort

//            pagination
            String indexString = request.getParameter("page");
            if(indexString == null){
                indexString = "1";
            }
            int page = Integer.parseInt(indexString);
            int count = ProductDao.getInstance().getTotalBySearch(search);

            String size = request.getParameter("sizepage");
            if(size == null){
                size = "20";
            }
            int pageSize = Integer.parseInt(size);

            int endPage = count/pageSize;
            if(count % pageSize != 0){
                endPage++;
            }

            List<Product> list = ProductService.getInstance().searchByName(search.trim(),page,pageSize);
            List<Category> listC = CategoryService.getInstance().getAllCategory();

            request.setAttribute("size", size);
            request.setAttribute("listPBS", list);
            request.setAttribute("result", search);
            request.setAttribute("end", endPage);
            request.setAttribute("tag", page);
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("search.jsp").forward(request,response);
        }catch (Exception e){

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
