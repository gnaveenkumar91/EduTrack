package com.app.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);

        if(session != null){
            session.removeAttribute("user");
            session.removeAttribute("role");
            session.invalidate(); // very important
        }

        res.sendRedirect("index.jsp"); // go to public page
    }
}
