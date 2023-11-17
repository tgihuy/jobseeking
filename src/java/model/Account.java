package model;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class Account {
    
    private String username;
    private String password;
    private String displayName;
    private String contact;
    private String mail;
    private String role;
    private String status;

    public Account() {
    }

    public Account(String username, String password, String displayName, String contact, String mail, String role, String status) {
        this.username = username;
        this.password = password;
        this.displayName = displayName;
        this.contact = contact;
        this.mail = mail;
        this.role = role;
        this.status = status;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        if(status==null) return "Available";
        
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public ArrayList<Account> getAll() {
        ArrayList<Account> list = new ArrayList<>();
        
        try {
            String query = "select * from account";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Account(res.getString(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6),
                        res.getString(7)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
        
    }
    
    public Account getAccount(String user, String pass) {
        
        try {
            String query = "select * from account where username = ? and password = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return new  Account(res.getString(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6),
                        res.getString(7));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return null;
        
    }
    
    public Account getAccount(String user) {
        
        try {
            String query = "select * from account where username = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, user);
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return new  Account(res.getString(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6),
                        res.getString(7));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return null;
        
    }
    
    
    public void createUserAccount(String user, String pass, String displayName, String contact, String mail) {
        
        try {
            String query = "insert into account values(?,?,?,?,?,'user','Available')";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            preparedStatement.setString(3, displayName);
            preparedStatement.setString(4, contact);
            preparedStatement.setString(5, mail);
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void updateInfo(String account, String displayName, String contact, String mail) {
        
        try {
            
            String query = "update account set display_name = ?, contact = ?, mail = ? where username = ?";
            
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, displayName);
            preparedStatement.setString(2, contact);
            preparedStatement.setString(3, mail);
            preparedStatement.setString(4, account);
            preparedStatement.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void updateStatus(String account, String status) {
        
        try {
            
            String query = "update account set status = ? where username = ?";
            
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, account);
            preparedStatement.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void updatePassword(String account, String pass) {
        
        try {
            
            String query = "update account set password = ? where username = ?";
            
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, pass);
            preparedStatement.setString(2, account);
            preparedStatement.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
}
