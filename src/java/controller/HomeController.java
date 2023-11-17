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


public class HomeController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        request.setAttribute("listPost", new Post().getAll());
        request.setAttribute("listCompany", new Company().getAll());
        request.setAttribute("mapCompany", getCompanyData());
        
        request.getRequestDispatcher("home.jsp").forward(request, respond);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    private HashMap<Integer,Company> getCompanyData() {
        ArrayList<Company> listCompany = new Company().getAll();
        
        HashMap<Integer,Company> map = new HashMap<>();
        for(Company i : listCompany)
            map.put(i.getId(), i);
        
        return map;
    }
    
}
