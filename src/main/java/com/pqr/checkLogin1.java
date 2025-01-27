package com.pqr;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class checkLogin1
 */
@WebServlet("/checkLogin1")
public class checkLogin1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkLogin1() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");

        if (username != null && pwd != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");
                
                String sql = "SELECT user_id, form_completed FROM login WHERE username=? AND password=?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, pwd);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                	int userId = rs.getInt("user_id");
                	boolean formCompleted = rs.getInt("form_completed") == 1;
                	
                	
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", rs.getInt("user_id"));
                    session.setAttribute("users", username);
                    response.sendRedirect("hostelForm.jsp");
                    
                    if (formCompleted) {
                        response.sendRedirect("Student_Login_Dashboard.jsp"); // Redirect to dashboard if form is completed
                    } else {
                        response.sendRedirect("hostelForm.jsp"); // Redirect to form if not completed
                    }
                    
                } else {
                    request.setAttribute("msg", "failed");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }

                stmt.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}