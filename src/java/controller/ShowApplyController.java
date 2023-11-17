package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import model.Account;
import model.Company;
import model.Post;
import model.Submisson;


public class ShowApplyController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        if(request.getSession().getAttribute("account") == null) {respond.sendRedirect("home");return;}
        String username = ((Account)request.getSession().getAttribute("account")).getUsername();
        
        request.setAttribute("listApply", new Submisson().getByOwner(username));
        request.setAttribute("listPost", new Post().getByOwner(username));
        
        request.getRequestDispatcher("ShowApplyOfUser.jsp").forward(request, respond);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
    
    
    
}
