package model;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Post {
    
    private int id;
    private String owner;
    private int companyId;
    private String title;
    private String content;
    private int salary;
    private String status;
    
    private String img;
    private String companyName;

    public Post() {
    }

    public Post(int id, String owner, int companyId, String title, String content, int salary, String status) {
        this.id = id;
        this.owner = owner;
        this.companyId = companyId;
        this.title = title;
        this.content = content;
        this.salary = salary;
        this.status = status;
    }

    public Post(int id, String owner, int companyId, String title, String content, int salary, String status, String img, String companyName) {
        this.id = id;
        this.owner = owner;
        this.companyId = companyId;
        this.title = title;
        this.content = content;
        this.salary = salary;
        this.status = status;
        this.img = img;
        this.companyName = companyName;
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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOnwer() {
        return owner;
    }

    public void setOnwer(String owner) {
        this.owner = owner;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
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

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public ArrayList<Post> getAll() {
        ArrayList<Post> list = new ArrayList<>();
        
        try {
            String query = "select * from post";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Post(res.getInt(1) , res.getString(2), 
                        res.getInt(3), res.getString(4), 
                        res.getString(5), res.getInt(6), 
                        res.getString(7)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public ArrayList<Post> getByCompanyId(int companyId) {
        ArrayList<Post> list = new ArrayList<>();
        
        try {
            String query = "select * from post where company_id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, companyId);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Post(res.getInt(1) , res.getString(2), 
                        res.getInt(3), res.getString(4), 
                        res.getString(5), res.getInt(6), 
                        res.getString(7)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public ArrayList<Post> getByOwner(String owner) {
        ArrayList<Post> list = new ArrayList<>();
        
        try {
            String query = "select * from post p, company c where p.company_id = c.id and p.[owner] = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, owner);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                list.add(new  Post(res.getInt(1) , res.getString(2), 
                        res.getInt(3), res.getString(4), 
                        res.getString(5), res.getInt(6), 
                        res.getString(7), res.getString(12), res.getString(9)));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public void create(String owner, int companyId, String title, String content, int salary) {
        
        try {
            String query = "insert into post values(?,?,?,?,?,'Available')";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, owner);
            preparedStatement.setInt(2, companyId);
            preparedStatement.setString(3, title);
            preparedStatement.setString(4, content);
            preparedStatement.setInt(5, salary);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void delete(int id) {
        
        try {
            String query = "delete from post where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, id);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void update(int id, String title, String content, int salary) {
        
        try {
            String query = "update post set title = ?, content = ?, salary = ? where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, content);
            preparedStatement.setInt(3, salary);
            preparedStatement.setInt(4, id);
            
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    public Post getPost(int postId) {
        
        try {
            String query = "select * from post where id = ?";
            Connection connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setInt(1, postId);
            
            ResultSet res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return new  Post(res.getInt(1) , res.getString(2), 
                        res.getInt(3), res.getString(4), 
                        res.getString(5), res.getInt(6), 
                        res.getString(7));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return null;
    }
    
}
