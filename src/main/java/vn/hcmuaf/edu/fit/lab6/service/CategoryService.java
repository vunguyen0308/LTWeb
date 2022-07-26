package vn.hcmuaf.edu.fit.lab6.service;

import vn.hcmuaf.edu.fit.lab6.beans.Category;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.dao.CategoryDao;

import java.util.List;

public class CategoryService {
    private static  CategoryService instance;

    private CategoryService(){
    }

    public static CategoryService getInstance() {
        if (instance == null) {
            instance = new CategoryService();
        }
        return instance;
    }

    public List<Category> getAllCategory() {
        return CategoryDao.getInstance().getAllCategory();
    }

    public List<Product> getProductByCID(String cid, int index, int size, int sortCode, int conditionCode) {
        return CategoryDao.getInstance().getProductByCID(cid, index, size,sortCode,conditionCode);
    }

    public Category getCategoryByCId(String cid){
        return CategoryDao.getInstance().getCategoryByCId(cid);
    }
}
