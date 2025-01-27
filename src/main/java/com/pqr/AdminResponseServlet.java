package com.pqr;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

/**
 * Servlet implementation class AdminResponseServlet
 */
@WebServlet("/AdminResponseServlet")
public class AdminResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminResponseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int requestId = Integer.parseInt(request.getParameter("requestId"));
	    String action = request.getParameter("action");
	    String status = action.equals("Accept") ? "Accepted" : "Rejected";
	    String responseMessage = action.equals("Accept") ? "Your request has been accepted." : "Your request has been rejected.";

	    // Using try-with-resources to ensure resources are closed
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234")) {
	            
	            // Update the service request status
	            String query = "UPDATE service_requests SET status=?, response_message=?, updated_at=NOW() WHERE request_id=?";
	            try (PreparedStatement stmt = con.prepareStatement(query)) {
	                stmt.setString(1, status);
	                stmt.setString(2, responseMessage);
	                stmt.setInt(3, requestId);
	                stmt.executeUpdate();
	            }

	            // Insert a notification for the user
	            query = "INSERT INTO notifications (user_id, message, status, created_at) VALUES ((SELECT user_id FROM service_requests WHERE request_id=?), ?, 'Unread', NOW())";
	            try (PreparedStatement stmt = con.prepareStatement(query)) {
	                stmt.setInt(1, requestId);
	                stmt.setString(2, responseMessage);
	                stmt.executeUpdate();
	            }

	            response.sendRedirect("admin_service.jsp?msg=Request+Processed");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("admin_service.jsp?msg=Error+Processing+Request");
	    }
	}

}
