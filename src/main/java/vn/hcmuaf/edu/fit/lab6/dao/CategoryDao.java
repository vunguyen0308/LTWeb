package vn.hcmuaf.edu.fit.lab6.dao;

import vn.hcmuaf.edu.fit.lab6.beans.Category;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    private static CategoryDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private CategoryDao() {
    }

    public static CategoryDao getInstance() {
        if (instance == null) {
            instance = new CategoryDao();
        }
        return instance;
    }
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCID(String cid, int index, int size,int sortCode, int conditionCode) {
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
                " where cid = ?) \n" +
                "select * from x where r between ? and ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,cid);
            ps.setInt(2,(index-1) * size + 1);
            ps.setInt(3,index * size);
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

    public Category getCategoryByCId(String cid){
        String query = "select * from category where `cid` = ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,cid);
            rs = ps.executeQuery();
            while (rs.next()) {
               return new Category(rs.getInt(1),rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDao p1 = new CategoryDao();
        List<Product> list = p1.getProductByCID("3", 1,10, 1, 1);
        for (Product p :
                list) {
            System.out.println(p);
        }
    }
}
