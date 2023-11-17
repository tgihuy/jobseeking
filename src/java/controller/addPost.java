package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Company;
import model.Account;
import model.Submisson;

/**
 *
 * @author Admin
 */
public class addPost extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        Account account = (Account)request.getSession().getAttribute("account");
        String username = account.getUsername();
        
        request.setAttribute("listCompany", new Company().getCompanyByOwner(username));
        request.setAttribute("username", account.getUsername());
        
        request.getRequestDispatcher("addPost.jsp").forward(request, respond);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        int postId = Integer.parseInt(request.getParameter("postId"));
        String experience = request.getParameter("experience");
        String detail = request.getParameter("detail");
        
        new Submisson().create(username, postId, experience + ". " + detail);
        
        respond.sendRedirect("home");
    }
    
}
