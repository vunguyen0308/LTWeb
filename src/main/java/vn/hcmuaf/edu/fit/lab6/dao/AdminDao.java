package vn.hcmuaf.edu.fit.lab6.dao;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.beans.Order;
import vn.hcmuaf.edu.fit.lab6.beans.OrderDetail;
import vn.hcmuaf.edu.fit.lab6.beans.Product;
import vn.hcmuaf.edu.fit.lab6.db.DBConnect;
import vn.hcmuaf.edu.fit.lab6.service.AccountService;
import vn.hcmuaf.edu.fit.lab6.service.ProductService;

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
                        rs.getInt(5),
                        rs.getInt(6)
                ));
            }
        }catch (Exception e){

        }
        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String query ="select * from orders";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
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
        String query = "insert into account (`username`,`password`,`email`,`isAdmin`,`status`) values(?,?,?,?,1)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,userName);
            ps.setString(2,AccountDao.getInstance().hashPassword(passWord));
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

//    active account
    public Account activeAccount(String a_id){
        String query ="select * from account where `user_id` = ?  and `status` = 0";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            rs = ps.executeQuery();
            if (rs.next()){
                active(a_id);
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        }catch (Exception e){

        }
        return null;
    }


    private void active(String a_id){
        String query ="update account set `status` = 1 where `user_id` = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

//    disable account
    public Account disableAccount(String a_id){
        String query ="select * from account where `user_id` = ?  and `status` = 1";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            rs = ps.executeQuery();
            if (rs.next()){
                disable(a_id);
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        }catch (Exception e){

        }
        return null;
    }

    private void disable(String a_id){
        String query ="update account set `status` = 2 where `user_id` = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

//    enable account
    public Account enableAccount(String a_id){
        String query ="select * from account where `user_id` = ?  and `status` = 2";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            rs = ps.executeQuery();
            if (rs.next()){
                enable(a_id);
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        }catch (Exception e){

        }
        return null;
    }


    private void enable(String a_id){
        String query ="update account set `status` = 1 where `user_id` = ? ";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,a_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

//    get all order detail by orderId
public List<OrderDetail> getAllOrderDetailByOrderId(String orderId) {
    List<OrderDetail> list = new ArrayList<>();
    String query = "select * from orders_detail where orders_id = ?";
    try {
        conn = DBConnect.connect().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1,orderId);
        rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new OrderDetail(rs.getInt(1),
                    rs.getInt(2),
                    ProductService.getInstance().getProductById(rs.getString(3)),
                    rs.getDouble(4),
                    rs.getInt(5),
                    rs.getTimestamp(6),
                    rs.getTimestamp(7)
            ));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

//


//  accept order

    public Order acceptOrder(String oId) {
        String query ="select * from orders where `orders_id` = ?  and `status` = 1";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                accept(oId);
                return new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void accept(String oId) {
        String query ="update orders set `status` = 2 where `orders_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

//    next step order
    public Order nextStepOrder(String oId, String oStatus){
        String query ="select * from orders where `orders_id` = ?  and `status` < 4";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                nextStep(oId,oStatus);
                return new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void nextStep(String oId, String oStatus) {
        String query ="update orders set `status` = ? where `orders_id` = ?";
        int status = Integer.parseInt(oStatus);

        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,status + 1);
            ps.setString(2,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

//    cancel order
    public Order cancelOrder(String oId){
        String query ="select * from orders where `orders_id` = ?  and `status` between 1 and 3";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            rs = ps.executeQuery();
            if (rs.next()){
                cancel(oId);
                return new Order(
                        rs.getInt(1),
                        AccountService.getInstance().getAccountById(rs.getString(2)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10)
                );
            }
        }catch (Exception e){

        }
        return null;
    }

    private void cancel(String oId) {
        String query ="update orders set `status` = 5 where `orders_id` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,oId);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
//

    public static void main(String[] args) {
        AdminDao a = new AdminDao();
        Order o = a.nextStepOrder("75","2");
        System.out.println(o);
    }


}
