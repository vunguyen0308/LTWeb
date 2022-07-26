package vn.hcmuaf.edu.fit.lab6.dao;


import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ProductDao {
    private static ProductDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private ProductDao() {
    }

    public static ProductDao getInstance() {
        if (instance == null) {
            instance = new ProductDao();
        }
        return instance;
    }

    public List<Product> getAll() {
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

    public List<Product> getAllProductSort(int sortCode, int conditionCode){
        String sortBy = "";
        String condition = "";

//        check sắp xếp theo ?
        switch (sortCode){
            case 0:
                sortBy = "name";
                break;
            case 1:
                sortBy = "sellprice";
        }

//        check điều kiện sắp xếp
        switch (conditionCode){
            case 0:
                condition = "ASC";
                break;
            case 1:
                condition = "DESC";
                break;
        }

        List<Product> list = new ArrayList<>();
        String query = "select * from product order by " + sortBy + " "+ condition;
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

    public int getTotal() {
        String query = "select count(*) from product";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int getTotalByCategory(String cid) {
        String query = "select count(*) from product where cid =?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int getTotalBySearch(String txtSearch) {
        String query = "select count(*) from product where `name` like ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,"%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }


    public List<Product> getProduct(int index, int size, int sortCode,int conditionCode) {
        String sortBy = "";
        String condition = "";

//        check sắp xếp theo ?
        switch (sortCode){
            case 0:
                sortBy = "id";
                break;
            case 1:
                sortBy = "name";
                break;
            case 2:
                sortBy = "sellprice";
                break;
        }

//        check điều kiện sắp xếp
        switch (conditionCode){
            case 0:
                condition = "ASC";
                break;
            case 1:
                condition = "DESC";
                break;
        }
        List<Product> list = new ArrayList<>();
        String query = "with x as (select *, ROW_NUMBER() over (order by " + sortBy + " " + condition + " ) as r from product) \n" +
                "select * from x where r between ? and ?" ;
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,(index-1) * size + 1);
            ps.setInt(2,index * size);

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
        }
        return list;
    }

    public Product getProductById(String id){
        String query = "select * from product where id =?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()){
                return new Product(rs.getInt(1),
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
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Product> getProductByGender(String gender){
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product\n" +
                    "WHERE gender = ? \n" +
                    "ORDER BY id DESC\n" +
                    "LIMIT 8";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, gender);
            rs = ps.executeQuery();
            while (rs.next()){
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

        }
        return list;
    }

    public List<Product> getProductByBrand(String brand){
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product\n" +
                "WHERE brand = ? \n" +
                "ORDER BY id asc\n" +
                "LIMIT 4";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, brand);
            rs = ps.executeQuery();
            while (rs.next()){
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

        }
        return list;
    }

    public List<Product> searchByName(String txtSearch, int index, int size, int sortCode, int conditionCode){
        String sortBy = "";
        String condition = "";

//        check sắp xếp theo ?
        switch (sortCode){
            case 0:
                sortBy = "id";
                break;
            case 1:
                sortBy = "name";
                break;
            case 2:
                sortBy = "sellprice";
                break;
        }

//        check điều kiện sắp xếp
        switch (conditionCode){
            case 0:
                condition = "ASC";
                break;
            case 1:
                condition = "DESC";
                break;
        }

        List<Product> list = new ArrayList<>();
        String query = "with x as (select *, ROW_NUMBER() over (order by " + sortBy + " " + condition + " ) as r from product\n" +
                " where `name` like ?) \n" +
                "select * from x where r between ? and ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2,(index-1) * size + 1);
            ps.setInt(3,index * size);
            rs = ps.executeQuery();
            while (rs.next()){
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

        }
        return list;
    }

    public void updateProductQuantity(Product p, int quantitySold){
        int id = p.getId();
        int quantity = p.getQuantity();
        String query ="update product set quantity = ? where id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,(quantity-quantitySold));
            ps.setInt(2,id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }





    public static void main(String[] args) {
        ProductDao p1 = new ProductDao();
        List<Product> l1 = p1.searchByName("a",2,20,1,1);
        for (Product p:
             l1) {
            System.out.println(p);
        }
    }

}
