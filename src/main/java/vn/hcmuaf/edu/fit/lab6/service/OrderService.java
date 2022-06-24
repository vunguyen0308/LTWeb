package vn.hcmuaf.edu.fit.lab6.service;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.beans.Order;
import vn.hcmuaf.edu.fit.lab6.beans.OrderDetail;
import vn.hcmuaf.edu.fit.lab6.dao.OrderDao;
import vn.hcmuaf.edu.fit.lab6.dao.OrderDetailDao;

import java.util.List;

public class OrderService {
    private static OrderService instance;

    private OrderService(){
    }

    public static OrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }
        return instance;
    }

    public int createOrder(Order order){
        return OrderDao.getInstance().createOrder(order);
    }

    public void createOrderDetail(OrderDetail orderDetail){
        OrderDetailDao.getInstance().createOrderDetail(orderDetail);
    }

    public List<Order> getAllOrderActive(Account a) {
        return OrderDao.getInstance().getAllOrderActive(a);
    }

    public List<OrderDetail> getAllOrderDetailByOrderId(int orderId) {
        return OrderDetailDao.getInstance().getAllOrderDetailByOrderId(orderId);
    }

    public void cancelOrderByOrderId(String orderId){
        OrderDao.getInstance().cancelOrderByOrderId(orderId);
    }

    public void updateProductQuantityCancelOrder(OrderDetail orderDetail){
        OrderDao.getInstance().updateProductQuantityCancelOrder(orderDetail);
    }


}
