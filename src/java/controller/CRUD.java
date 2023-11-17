/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import model.Account;
import model.Company;
import model.Post;
import model.Submisson;

/**
 *
 * @author Admin
 */
public class CRUD extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CRUD</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUD at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String type = request.getParameter("type");
        String action = request.getParameter("action");
        
        switch (type) {
            case "apply":
                switch (action) {
                    case "update":
                        int id = Integer.parseInt(request.getParameter("id"));
                        
                        String status = request.getParameter("status");
                        new Submisson().updateStatus(id,status);
                        request.setAttribute("companyId", request.getParameter("companyId"));
                        request.getRequestDispatcher("showApplyCompany").forward(request, response);
                        return;
                }
            case "post":
                switch (action) {
                    case "delete":
                        String idDelete = request.getParameter("id");
                        new Post().delete(Integer.parseInt(idDelete));
                        request.setAttribute("type", "post");
                        response.sendRedirect("showApply");
                        break;
                    case "update":
                        Post post = new Post().getPost(Integer.parseInt(request.getParameter("id")));
                        Account account = new Account().getAccount(post.getOnwer());
                        request.setAttribute("action", "applyUpdate");
                        request.setAttribute("post", post);
                        request.setAttribute("account", account);
                        request.setAttribute("company", new Company().getCompany(post.getCompanyId()));
                        request.getRequestDispatcher("EditPost.jsp").forward(request, response);
                        break;
                    case "add":
                        String owner = request.getParameter("owner");
                        int companyId = Integer.parseInt(request.getParameter("companyId"));
                        String title = request.getParameter("title");
                        String content = request.getParameter("content");
                        int salary = Integer.parseInt(request.getParameter("salary"));
                        new Post().create(owner, companyId, title, content, salary);
                        response.sendRedirect("showApply");
                        break;
                    case "applyUpdate":
                        int id = Integer.parseInt(request.getParameter("id"));
                        title = request.getParameter("title");
                        content = request.getParameter("content");
                        salary = Integer.parseInt(request.getParameter("salary"));
                        new Post().update(id, title, content, salary);
                        response.sendRedirect("showApply");
                        break;
                }
                break;
            case "company":
                switch (action) {
                    case "delete2":
                        String idDelete = request.getParameter("id");
                        new Company().delete(Integer.parseInt(idDelete));
                        request.setAttribute("type", "company");
                        response.sendRedirect("companyManager");
                        break;
                    case "update2":
                        request.setAttribute("backUrl", "companyManager");
                        Company company = new Company().getCompany(Integer.parseInt(request.getParameter("id")));
                        request.setAttribute("action", "applyUpdate");
                        request.setAttribute("company", company);
                        request.setAttribute("account", new Account().getAccount(company.getOwner()));
                        request.getRequestDispatcher("EditCompany.jsp").forward(request, response);
                        break;
                    case "add":
                        String name = request.getParameter("name");
                        String owner = request.getParameter("owner");
                        String contact = request.getParameter("contact");
                        String img = request.getParameter("img");
                        String mail = request.getParameter("mail");
                        String location = request.getParameter("location");
                        new Company().create(name, owner, contact, img, mail, location);
                        response.sendRedirect("companyManager");
                        break;
                    case "applyUpdate":
                        int id = Integer.parseInt(request.getParameter("id"));
                        contact = request.getParameter("contact");
                        mail = request.getParameter("mail");
                        location = request.getParameter("location");
                        img = request.getParameter("img");
                        new Company().update(id, contact, mail, location, img);
                        request.setAttribute("type", "post");
                        response.sendRedirect("companyManager");
                        break;
                }
                break;
            case "user":
                switch (action) {
                    case "delete":
                        String idDelete = request.getParameter("id");
                        new Account().updateStatus(idDelete, "Disable");
                        request.setAttribute("type", "user");
                        request.getRequestDispatcher("admin").forward(request, response);
                        break;
                    case "update":
                        String username = request.getParameter("account");
                        String displayName = request.getParameter("displayName");
                        String contact = request.getParameter("contact");
                        String mail = request.getParameter("mail");
                        new Account().updateInfo(username, displayName, contact, mail);
                        //update session
                        request.getSession().removeAttribute("account");
                        System.out.println(new Account().getAccount(username));
                        request.getSession().setAttribute("account", new Account().getAccount(username));
                        response.sendRedirect("home");
                        break;
                }
                break;
        }
    } 
    
    private HashMap<Integer,Company> getCompanyData() {
        ArrayList<Company> listCompany = new Company().getAll();
        HashMap<Integer,Company> map = new HashMap<>();
        for(Company i : listCompany)
            map.put(i.getId(), i);
        
        return map;
    }
    
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
