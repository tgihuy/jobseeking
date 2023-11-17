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

/**
 *
 * @author Admin
 */
public class LogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        switch (type) {
            case "login":
                Account account = new Account().getAccount(user, pass);
                //check account existed
                if (account == null) {
                    request.setAttribute("message", "Wrong username!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }
                //check banned
                if (account.getStatus().equals("Disable")) {
                    request.setAttribute("message", "This account is banned");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                request.getSession().setAttribute("account", account);
                response.sendRedirect("home");
                break;

            case "signup":
                String pass2 = request.getParameter("pass2");
                String contact = request.getParameter("contact");
                String mail = request.getParameter("mail");
                String displayName = request.getParameter("displayName");

                Account ac = new Account().getAccount(user,pass);

                if (ac != null) {
                    request.setAttribute("message", "Username existed!");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }

                if (!pass.equals(pass2)) {
                    request.setAttribute("message", "2 pass not match");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                } else {
                    new Account().createUserAccount(user, pass, displayName, contact, mail);
                    response.sendRedirect("login.jsp");
                }
                break;
            default:
                throw new AssertionError();
        }

    }

}
