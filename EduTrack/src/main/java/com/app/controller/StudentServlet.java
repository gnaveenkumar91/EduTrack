package com.app.controller;

import java.io.IOException;

import com.app.model.Student;
import com.app.service.StudentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    private StudentService service = new StudentService();

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // ⭐ SESSION CHECK (for admin actions)
        HttpSession session = req.getSession(false);
        String user = (session != null) ? (String) session.getAttribute("user") : null;

        // 🔒 EDIT PAGE (ADMIN ONLY)
        if ("edit".equals(action)) {

            if (user == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            int id = Integer.parseInt(req.getParameter("id"));
            Student s = service.getStudent(id);

            req.setAttribute("student", s);
            req.getRequestDispatcher("edit.jsp").forward(req, res);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // ⭐ SESSION CHECK
        HttpSession session = req.getSession(false);
        String user = (session != null) ? (String) session.getAttribute("user") : null;

        // ✅ ADD (PUBLIC - NO LOGIN)
        if ("add".equals(action)) {
            Student s = new Student();
            s.setName(req.getParameter("name"));
            s.setEmail(req.getParameter("email"));
            s.setCourse(req.getParameter("course"));

            boolean result = service.registerStudent(s);

            if (result) {
                res.sendRedirect("index.jsp?success=1"); // better UX
            } else {
                res.sendRedirect("index.jsp?error=duplicate");
            }
        }

        // 🔒 UPDATE (ADMIN ONLY)
        if ("update".equals(action)) {

            if (user == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            Student s = new Student();
            s.setId(Integer.parseInt(req.getParameter("id")));
            s.setName(req.getParameter("name"));
            s.setEmail(req.getParameter("email"));
            s.setCourse(req.getParameter("course"));

            service.updateStudent(s);
            res.sendRedirect("list.jsp");
        }

        // 🔒 DELETE (ADMIN ONLY)
        if ("delete".equals(action)) {

            if (user == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            int id = Integer.parseInt(req.getParameter("id"));
            service.removeStudent(id);
            res.sendRedirect("list.jsp");
        }
    }
}