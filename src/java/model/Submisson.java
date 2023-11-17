package model;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Submisson {
    
    private int id;
    private String owner;
    private int postId;
    private String detail;
    private String status;
    
    private String title;
    private String content;
    private String companyImg;
    private String companyName;
    private int salary;
    private String location;
    
    private String contact;
    private String mail;

    public Submisson() {
    }

    public Submisson(int id, String owner, int postId, String detail, String status) {
        this.id = id;
        this.owner = owner;
        this.postId = postId;
        this.detail = detail;
        this.status = status;
    }

    public Submisson(int id, String owner, int postId, String detail, String title, String content, String companyImg, String companyName, int salary, String location, String status) {
        this.id = id;
        this.owner = owner;
        this.postId = postId;
        this.detail = detail;
        this.title = title;
        this.content = content;
        this.companyImg = companyImg;
        this.companyName = companyName;
        this.salary = salary;
        this.location = location;
        this.status = status;
    }

    public Submisson(int id, String owner, int postId, String detail, String title, String content, String companyImg, String companyName, int salary, String location, String contact, String mail, String status) {
        this.id = id;
        this.owner = owner;
        this.postId = postId;
        this.detail = detail;
        this.title = title;
        this.content = content;
        this.companyImg = companyImg;
        this.companyName = companyName;
        this.salary = salary;
        this.location = location;
        this.contact = contact;
        this.mail = mail;
        
        this.status = status;
    }

    public String getColor() {
        if(status==null) return "black";
        if(status.equals("Approved")) return "green";
        if(status.equals("Rejected")) return "red";
        return "black";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCompanyImg() {
        return companyImg;
    }

    public void setCompanyImg(String companyImg) {
        this.companyImg = companyImg;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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

    public String getStatus() {
        return status==null ? "Pending" : status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    public ArrayList<Submisson> getByOwner(String owner) {
        ArrayList<Submisson> list = new ArrayList<>();
        
        try {
            String query = "select * from submission s, post p, company c where s.post_id = p.id and c.id = p.company_id and s.[owner] = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, owner);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Submisson(res.getInt(1) , res.getString(2), 
                        res.getInt(3), res.getString(4), 
                        res.getString(9), res.getString(10),
                        res.getString(17), res.getString(14),
                        res.getInt(11), res.getString(19), res.getString(5)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
        
    }
    
    public ArrayList<Submisson> getByCompany(int companyId) {
        ArrayList<Submisson> list = new ArrayList<>();
        
        try {
            String query = "select * from submission s, post p, company c, account a where s.post_id = p.id and c.id = p.company_id and s.owner = a.username and c.id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, companyId);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Submisson(res.getInt(1) , res.getString(2), 
                        res.getInt(3), res.getString(4), 
                        res.getString(9), res.getString(10),
                        res.getString(17), res.getString(14),
                        res.getInt(11), res.getString(19),
                        res.getString(23), res.getString(24), res.getString(5)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
        
    }
    
    public void create(String owner, int postId, String detail) {
        
        try {
            String query = "insert into submission values(?,?,?,'Pending')";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, owner);
            preparedStatement.setInt(2, postId);
            preparedStatement.setString(3, detail);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void delete(int id) {
        
        try {
            String query = "delete from submission where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, id);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void update(int id, String detail) {
        
        try {
            String query = "update submission set detail = ? where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, detail);
            preparedStatement.setInt(2, id);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    public void updateStatus(int id, String status) {
        try {
            String query = "update submission set status = ? where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, id);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
