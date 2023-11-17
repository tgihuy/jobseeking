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
import model.Account;
import model.Company;
import model.Post;

/**
 *
 * @author Admin
 */
public class showPostByCompany extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        int companyId = Integer.parseInt(request.getParameter("companyId"));
        
        request.setAttribute("listPost", new Post().getByCompanyId(companyId));
        request.setAttribute("company", new Company().getById(companyId));
        
        request.getRequestDispatcher("showPostByCompany.jsp").forward(request, respond);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
    }
    
}
