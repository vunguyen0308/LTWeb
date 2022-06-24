package vn.hcmuaf.edu.fit.lab6.dao;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.db.DBConnect;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDao {
    private static AccountDao instance;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private AccountDao() {
    }

    public static AccountDao getInstance() {
        if (instance == null) {
            instance = new AccountDao();
        }
        return instance;
    }

    public Account login(String user, String pass){
        String query ="select * from account where `username` = ? and `password` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,user);
            if(user.equals("admin")){
                ps.setString(2,pass);
            }else{
                ps.setString(2,hashPassword(pass));
            }
            rs = ps.executeQuery();
            while (rs.next()){
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        }catch (Exception e){

        }
        return null;
    }

    public Account checkAccountExist(String user){
        String query ="select * from account where `username` = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,user);
            rs = ps.executeQuery();
            while (rs.next()){
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        }catch (Exception e){

        }
        return null;
    }

    public void register(String user, String pass, String email){
        String query ="insert into account (`username`, `password`,`email`,`isAdmin`) values (?,?,?,0)";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,user);
            ps.setString(2,hashPassword(pass));
            ps.setString(3,email);
            ps.executeUpdate();
        }catch (Exception e){

        }

    }

    public void changePassword(Account a, String newPass){
        int user_id = a.getUserId();
        String query ="update account set password = ? where user_id = ?";
        try{
            conn = DBConnect.connect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,hashPassword(newPass));
            ps.setInt(2,user_id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public boolean checkPasswordCorrect(Account a, String password){
        String passwordCheck = a.getPassword();
        if(passwordCheck.equals(hashPassword(password))){
            return true;
        }
        return false;

    }


    private String hashPassword(String password){
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte byteData[] = md.digest();
            BigInteger number = new BigInteger(1,byteData);
            return number.toString(16);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }


    public static void main(String[] args) {
//        Account a = AccountDao.getInstance().login("admin","admin");
//        Account b = AccountDao.getInstance().checkAccountExist("admin");
//        System.out.println(AccountDao.getInstance().hashPassword("abc"));
        AccountDao a1 = new AccountDao();

    }


}
