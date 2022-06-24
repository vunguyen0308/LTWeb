package vn.hcmuaf.edu.fit.lab6.beans;

import java.sql.Timestamp;

public class OrderDetail {
    private int orderDetailId;
    private int orderId;
    private Product product;
    private double price;
    private int quantity;
    private Timestamp createAt;
    private Timestamp updateAt;

    public OrderDetail(){

    }

    public OrderDetail(int orderDetailId, int orderId, Product product, double price, int quantity, Timestamp createAt, Timestamp updateAt) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.product = product;
        this.price = price;
        this.quantity = quantity;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public OrderDetail(int orderId, Product product, double price, int quantity) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.product = product;
        this.price = price;
        this.quantity = quantity;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "orderDetailId=" + orderDetailId +
                ", orderId=" + orderId +
                ", product=" + product +
                ", price=" + price +
                ", quantity=" + quantity +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                '}';
    }

    public static void main(String[] args) {
        OrderDetail o = new OrderDetail();
        o.getProduct().getName();
    }
}
