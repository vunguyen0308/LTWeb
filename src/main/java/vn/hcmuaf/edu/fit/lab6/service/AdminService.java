package vn.hcmuaf.edu.fit.lab6.service;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.dao.AdminDao;

import java.util.List;

public class AdminService {
    private static  AdminService instance;

    private AdminService(){
    }

    public static AdminService getInstance() {
        if (instance == null) {
            instance = new AdminService();
        }
        return instance;
    }

    public List<Product> getAllProducts(){
        return AdminDao.getInstance().getAllProduct();
    }

    public List<Account> getAllAccount(){
        return  AdminDao.getInstance().getAllAccount();
    }

    public void removeProduct(String id){
        AdminDao.getInstance().removeProduct(id);
    }

    public void removeUser(String uid) {
        AdminDao.getInstance().removeUser(uid);
    }

    public void addProduct(String name, String brand, String gender, String origin, String concentration, String capacity, String description, String price, String sellPrice,String style, String img, String quantity, String cid ){
        AdminDao.getInstance().addProduct(name, brand, gender, origin, concentration, capacity, description, price, sellPrice, style, img, quantity,cid);
    }

    public void updateProduct(String id, String name, String brand, String gender, String origin, String concentration, String capacity, String description, String price, String sellPrice,String style, String img, String quantity, String cid){
        AdminDao.getInstance().updateProduct(id, name, brand, gender, origin, concentration, capacity, description, price, sellPrice, style, img, quantity, cid);
    }

    public void addUser(String userName, String passWord, String email, String isAdmin){
        AdminDao.getInstance().addUser(userName, passWord, email, isAdmin);
    }
}
