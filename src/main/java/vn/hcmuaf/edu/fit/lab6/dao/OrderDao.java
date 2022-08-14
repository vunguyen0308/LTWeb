package vn.hcmuaf.edu.fit.lab6.dao;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.beans.Order;
import vn.hcmuaf.edu.fit.lab6.beans.OrderDetail;
import vn.hcmuaf.edu.fit.lab6.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private static OrderDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private OrderDao() {
    }

    public static OrderDao getInstance() {
        if (instance == null) {
            instance = new OrderDao();
        }
        return instance;
    }

    public int createOrder(Order order) {
        String query = "insert into orders (`user_id`,`total`,`payment`,`fullname`,`address`,`phone_number`) values(?,?,?,?,?,?)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1,order.getAccount().getUserId());
            ps.setDouble(2,order.getTotal());
            ps.setString(3,order.getPayment());
            ps.setString(4,order.getFullName());
            ps.setString(5, order.getAddress());
            ps.setString(6, order.getPhoneNumber());
            ps.executeUpdate();
             try(ResultSet rs = ps.getGeneratedKeys()){
                    if(rs.next()){
                        return rs.getInt(1);
                    }
                }

        }catch (Exception e){
        }
        return 0;
    }

    public List<Order> getAllOrderActive(Account a) {
        List<Order> list = new ArrayList<>();
        int user_id = a.getUserId();
        String query = "select * from orders where user_id = ? and status != 5";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        a,
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void cancelOrderByOrderId(String orderId){
        String query = "update orders set status = 5 where orders_id = ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,orderId);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    public void updateProductQuantityCancelOrder(OrderDetail orderDetail){
        int id = orderDetail.getProduct().getId();
        int quantity = orderDetail.getProduct().getQuantity();
        int quantityCancel = orderDetail.getQuantity();

        String query = "update product set quantity = ? where id = ?";
        try {
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,quantity + quantityCancel);
            ps.setInt(2,id);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }


    public static void main(String[] args) {
        Account a = new Account(1,"123","123","123",1,0);
        Order order = new Order(a,1,"123","123","123","123");
        OrderDao o = new OrderDao();
        System.out.println(o.createOrder(order));
    }
}
