package vn.hcmuaf.edu.fit.lab6.service;

import vn.hcmuaf.edu.fit.lab6.beans.Account;
import vn.hcmuaf.edu.fit.lab6.dao.AccountDao;

public class AccountService {
    private static  AccountService instance;

    private AccountService(){
    }

    public static AccountService getInstance() {
        if (instance == null) {
            instance = new AccountService();
        }
        return instance;
    }

    public Account login(String user, String pass){
        return AccountDao.getInstance().login(user, pass);
    }

    public Account checkAccountExist(String user){
        return AccountDao.getInstance().checkAccountExist(user);
    }

    public void register(String user, String pass, String email){
         AccountDao.getInstance().register(user, pass, email);
    }

    public void changePassword(Account a, String newPass){
        AccountDao.getInstance().changePassword(a,newPass);
    }

    public boolean checkPasswordCorrect(Account a, String password){
        return AccountDao.getInstance().checkPasswordCorrect(a,password);
    }
}
