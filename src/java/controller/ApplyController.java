/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import model.Company;
import model.Post;
import model.Submisson;

/**
 *
 * @author Admin
 */
public class ApplyController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        int postId = Integer.parseInt((String)request.getParameter("postId"));
        Post post = new Post().getPost(postId);
        
        request.setAttribute("post", post);
        request.setAttribute("company", new Company().getCompany(post.getCompanyId()));
        
        request.getRequestDispatcher("ViewApply.jsp").forward(request, respond);
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
