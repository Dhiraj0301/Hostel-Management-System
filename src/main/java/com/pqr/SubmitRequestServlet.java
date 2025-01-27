package com.pqr;

import jakarta.servlet.ServletException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class SubmitRequestServlet
 */
@WebServlet("/SubmitRequestServlet")
public class SubmitRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SubmitRequestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String serviceType = request.getParameter("serviceType");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        // Assuming user_id is stored in session after login
       if (userId == null) {
           response.sendRedirect("login.jsp?msg=Please+log+in+first");
            return;
       }
        
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");
            // Insert the request into the service request table
            String query = "INSERT INTO service_requests (user_id, service_type, status, created_at) VALUES (?, ?, 'Pending', NOW())";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.setString(2, serviceType);
            stmt.executeUpdate();

            response.sendRedirect("services.jsp?msg=Service+Request+Submitted+Successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("services.jsp?msg=Error+Submitting+Service+Request");
        }
    }
}