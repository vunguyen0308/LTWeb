package vn.hcmuaf.edu.fit.lab6.dao;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {
    private static AdminDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private AdminDao() {
    }

    public static AdminDao getInstance() {
        if (instance == null) {
            instance = new AdminDao();
        }
        return instance;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getDouble(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        0,
                        rs.getInt(14)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query ="select * from account ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)
                ));
            }
        }catch (Exception e){

        }
        return list;
    }

    public void removeProduct(String id){
        String query = "delete from product where id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public void removeUser(String uid) {
        String query = "delete from account where user_id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,uid);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public void addProduct(String name, String brand, String gender, String origin, String concentration, String capacity, String description, String price, String sellPrice,String style, String img, String quantity, String cid){
        String query = "insert into product (`name`,`brand`,`gender`,`origin`,`concentration`,`capacity`,`description`,`price`,`sellprice`,`style`,`img`,`quantity`,`cid`) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,brand);
            ps.setString(3,gender);
            ps.setString(4,origin);
            ps.setString(5,concentration);
            ps.setString(6,capacity);
            ps.setString(7,description);
            ps.setString(8,price);
            ps.setString(9,sellPrice);
            ps.setString(10,style);
            ps.setString(11,img);
            ps.setString(12,quantity);
            ps.setString(13,cid);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void addUser(String userName, String passWord, String email, String isAdmin){
        String query = "insert into account (`username`,`password`,`email`,`isAdmin`) values(?,?,?,?)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,userName);
            ps.setString(2,passWord);
            ps.setString(3,email);
            ps.setString(4,isAdmin);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public void updateProduct(String id, String name, String brand, String gender, String origin, String concentration, String capacity, String description, String price, String sellPrice,String style, String img, String quantity, String cid){
        String query = "update product set `name` = ?,`brand` = ? ,`gender` = ?,`origin` = ?,`concentration` = ?,`capacity` = ?,`description` = ?,`price` = ?,`sellprice` = ?,`style` = ?,`img` = ?,`quantity` = ?,`cid` = ? where id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,brand);
            ps.setString(3,gender);
            ps.setString(4,origin);
            ps.setString(5,concentration);
            ps.setString(6,capacity);
            ps.setString(7,description);
            ps.setString(8,price);
            ps.setString(9,sellPrice);
            ps.setString(10,style);
            ps.setString(11,img);
            ps.setString(12,quantity);
            ps.setString(13,cid);
            ps.setString(14,id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public double totalRevenue(){
        String query ="select sum(total) from orders where `status` = 4";
        double total = 0;
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                total = rs.getDouble(1);
            }
        }catch (Exception e){

        }
        return  total;
    }

}
