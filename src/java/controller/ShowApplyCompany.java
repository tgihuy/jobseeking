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


public class ShowApplyCompany extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        if(request.getSession().getAttribute("account") == null) {respond.sendRedirect("home");return;}
        int companyId = Integer.parseInt(request.getParameter("companyId"));
        request.setAttribute("companyId", companyId);
        request.setAttribute("listApply", new Submisson().getByCompany(companyId));
        request.setAttribute("company", new Company().getById(companyId));
        
        request.getRequestDispatcher("ShowApplyOfCompany.jsp").forward(request, respond);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
    
    
    
}
