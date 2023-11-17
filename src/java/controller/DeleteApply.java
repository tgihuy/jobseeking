/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Submisson;

/**
 *
 * @author Admin
 */
public class DeleteApply extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        int applyId = Integer.parseInt((String)request.getParameter("id"));
        
        new Submisson().delete(applyId);
        
        respond.sendRedirect(request.getParameter("backUrl"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        int postId = Integer.parseInt(request.getParameter("postId"));
        String detail = request.getParameter("detail");
        
        new Submisson().create(username, postId, detail);
        
        respond.sendRedirect("home");
    }
    
}
