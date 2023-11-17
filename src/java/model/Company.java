package model;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Company {
    
    private int id;
    private String name;
    private String owner;
    private String contact;
    private String img;
    private String mail;
    private String location;

    public Company() {
    }

    public Company(int id, String name, String owner, String contact, String img, String mail, String location) {
        this.id = id;
        this.name = name;
        this.owner = owner;
        this.contact = contact;
        this.img = img;
        this.mail = mail;
        this.location = location;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    
    public ArrayList<Company> getAll() {
        ArrayList<Company> list = new ArrayList<>();
        
        try {
            String query = "select * from company";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Company(res.getInt(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6), 
                        res.getString(7)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
        
    }
    
    public ArrayList<Company> getCompanyByOwner(String username) {
        ArrayList<Company> list = new ArrayList<>();
        
        try {
            String query = "select * from company where owner = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, username);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Company(res.getInt(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6), 
                        res.getString(7)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
        
    }
    
    public Company getById(int companyId) {
        
        try {
            String query = "select * from company where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, companyId);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return new Company(res.getInt(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6), 
                        res.getString(7));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return null;
        
    }
    
    public ArrayList<Company> getByOwner(String owner) {
        ArrayList<Company> list = new ArrayList<>();
        
        try {
            String query = "select * from company where [owner] = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, owner);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Company(res.getInt(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6), 
                        res.getString(7)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
        
    }
    
    public void create(String name, String owner, String contact, String img, String mail, String location) {
        
        try {
            String query = "insert into company values(?,?,?,?,?,?)";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, owner);
            preparedStatement.setString(3, contact);
            preparedStatement.setString(4, img);
            preparedStatement.setString(5, mail);
            preparedStatement.setString(6, location);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void delete(int id) {
        
        try {
            String query = "delete from company where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, id);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void update(int id, String contact, String mail, String location, String img) {
        
        try {
            String query = "update company set contact = ?, mail = ?, location = ?, img = ? where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, contact);
            preparedStatement.setString(2, mail);
            preparedStatement.setString(3, location);
            preparedStatement.setString(4, img);
            preparedStatement.setInt(5, id);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    public Company getCompany(int companyId) {
        
        try {
            String query = "select * from company where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, companyId);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return new  Company(res.getInt(1) , res.getString(2), 
                        res.getString(3), res.getString(4), 
                        res.getString(5), res.getString(6), 
                        res.getString(7));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return null;
        
    }
    
}
