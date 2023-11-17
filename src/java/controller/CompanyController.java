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
import model.Submisson;

/**
 *
 * @author Admin
 */
public class CompanyController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        if(request.getSession().getAttribute("account") == null) {respond.sendRedirect("home");return;}
        String username = ((Account)request.getSession().getAttribute("account")).getUsername();
        
        request.setAttribute("listCompany", new Company().getByOwner(username));
        
        request.getRequestDispatcher("companyManager.jsp").forward(request, respond);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
    }
    
}
