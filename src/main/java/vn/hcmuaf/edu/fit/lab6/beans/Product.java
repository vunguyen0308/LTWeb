package vn.hcmuaf.edu.fit.lab6.beans;

import java.io.Serializable;

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
    private String brand;
    private String gender;
    private String origin;
    private String concentration;
    private String capacity;
    private String description ;
    private double price;
    private double sellPrice;
    private String style;
    private String img;
    private int quantity;
    private int quantitySold;
    private int cId;

    public Product(int id, String name, String brand, String gender, String origin, String concentration, String capacity, String description, double price, double sellPrice, String style, String img, int quantity, int quantitySold, int cId) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.gender = gender;
        this.origin = origin;
        this.concentration = concentration;
        this.capacity = capacity;
        this.description = description;
        this.price = price;
        this.sellPrice = sellPrice;
        this.style = style;
        this.img = img;
        this.quantity = quantity;
        this.quantitySold = quantitySold;
        this.cId = cId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getConcentration() {
        return concentration;
    }

    public void setConcentration(String concentration) {
        this.concentration = concentration;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(double sellPrice) {
        this.sellPrice = sellPrice;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public double total(){
        if(quantitySold > quantity){
            quantitySold = quantity;
        }
        return  (double) Math.round((quantitySold * sellPrice) * 100) / 100;
    }


    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", gender='" + gender + '\'' +
                ", origin='" + origin + '\'' +
                ", concentration='" + concentration + '\'' +
                ", capacity='" + capacity + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", sellPrice=" + sellPrice +
                ", style='" + style + '\'' +
                ", img='" + img + '\'' +
                ", quantity=" + quantity +
                ", quantitySold=" + quantitySold +
                '}';
    }
}