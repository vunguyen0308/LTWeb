package vn.hcmuaf.edu.fit.lab6.service;

import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.dao.ProductDao;

import java.util.List;

public class ProductService {
    private static  ProductService instance;

    private ProductService(){
    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
            return instance;
    }

    public List<Product> getAll(){
        return ProductDao.getInstance().getAll();
    }

    public List<Product> getProduct(int index, int size) {
        return ProductDao.getInstance().getProduct(index, size);
    }

    public Product getProductById(String id){
        return ProductDao.getInstance().getProductById(id);
    }

    public List<Product> getProductByGender(String gender){
        return ProductDao.getInstance().getProductByGender(gender);
    }

    public List<Product> getProductByBrand(String brand){
        return ProductDao.getInstance().getProductByBrand(brand);
    }

    public List<Product> searchByName(String txtSearch, int index, int size){
        return ProductDao.getInstance().searchByName(txtSearch, index, size);
    }

    public void updateProductQuantity(Product p, int quantitySold){
        ProductDao.getInstance().updateProductQuantity(p,quantitySold);
    }



}
