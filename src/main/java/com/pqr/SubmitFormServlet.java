package com.pqr;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
@WebServlet("/SubmitFormServlet")
/**
 * Servlet implementation class SubmitFormServlet
 */
public class SubmitFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitFormServlet() {
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
		// TODO Auto-generated method stub
		// Get form data
        String name = request.getParameter("studentName");
        String bloodGroup = request.getParameter("bloodGroup");
        String contactNo = request.getParameter("contactNo");
        String emergencyNo = request.getParameter("emergencyNo");
        String emailId = request.getParameter("emailId");

        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String pincode = request.getParameter("pincode");
        String district = request.getParameter("district");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        String guardianName = request.getParameter("guardianName");
        String guardianContactNo = request.getParameter("guardianContactNo");
        String guardianRelationship = request.getParameter("guardianRelationship");
        String guardianEmail = request.getParameter("guardianEmail");
        
        String guardianAadhaarNo = request.getParameter("guardianAadhaarNo");
        String guardianAadhaarImg1 = request.getParameter("guardianAadhaarImg1");
        String guardianAadhaarImg2 = request.getParameter("guardianAadhaarImg2");
        
        String tenantAadhaarNo = request.getParameter("tenantAadhaarNo");
        String tenantAadhaarImg1 = request.getParameter("tenantAadhaarImg1");
        String tenantAadhaarImg2 = request.getParameter("tenantAadhaarImg2");

        String roomPreference = request.getParameter("roomPreference");
        String floorPreference = request.getParameter("floorPreference");
        String mealPreference = request.getParameter("mealPreference");

        String admissionFee = request.getParameter("admissionFee");
        String hostelFee = request.getParameter("hostelFee");
        String messFee = request.getParameter("messFee");
        String cautionMoney = request.getParameter("cautionMoney");
        
     // Check if student name is null or empty
        //System.out.println("Student Name: '" + name + "'");
        System.out.println("Student Name: " + request.getParameter("studentName"));
        System.out.println("Contact No: " + request.getParameter("contactNo"));
        
       // System.out.println("Gurdian Name: '" + guardianName + "'");
//        if (cautionMoney == null || cautionMoney.isEmpty()) {
//            request.setAttribute("error", "Caution money is required.");
//            request.getRequestDispatcher("Student_Login_Dashborad.jsp").forward(request, response);
//            return;
//        }
        if (contactNo == null || contactNo.isEmpty()) {
            request.setAttribute("errorMessage", "Contact number is required.");
            request.getRequestDispatcher("Student_Login_Dashboard.jsp").forward(request, response);
            return;
        }
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");
             conn.setAutoCommit(true);
            // SQL query to insert data into the database
            String sql = "INSERT INTO students (studentName, bloodGroup, contactNo, emergencyNo, emailId, "
                    + "addressLine1, addressLine2, pincode, district, state, country, guardianName, "
                    + "guardianContactNo, guardianRelationship, guardianEmail, "
                    + "guardianAadhaarNo,guardianAadhaarImg1,guardianAadhaarImg2,"
                    + "tenantAadhaarNo,tenantAadhaarImg1,tenantAadhaarImg2,"
                    + "roomPreference, "
                    + "floorPreference, mealPreference, admissionFee, hostelFee, messFee, cautionMoney) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?)";

            // Create a PreparedStatement object
            pstmt = conn.prepareStatement(sql);

            // Set the values
            pstmt.setString(1, name);
            pstmt.setString(2, bloodGroup);
            pstmt.setString(3, contactNo);
            pstmt.setString(4, emergencyNo);
            pstmt.setString(5, emailId);
            pstmt.setString(6, addressLine1);
            pstmt.setString(7, addressLine2);
            pstmt.setString(8, pincode);
            pstmt.setString(9, district);
            pstmt.setString(10, state);
            pstmt.setString(11, country);
            pstmt.setString(12, guardianName);
            pstmt.setString(13, guardianContactNo);
            pstmt.setString(14, guardianRelationship);
            pstmt.setString(15, guardianEmail);
            
            pstmt.setString(16, guardianAadhaarNo);
            pstmt.setString(17, guardianAadhaarImg1);
            pstmt.setString(18, guardianAadhaarImg2);
            
            pstmt.setString(19, tenantAadhaarNo);
            pstmt.setString(20, tenantAadhaarImg1);
            pstmt.setString(21, tenantAadhaarImg2);
            
            pstmt.setString(22, roomPreference);
            pstmt.setString(23, floorPreference);
            pstmt.setString(24, mealPreference);
            pstmt.setString(25, admissionFee);
            pstmt.setString(26, hostelFee);
            pstmt.setString(27, messFee);
            pstmt.setString(28, cautionMoney);
            
            // Execute the query
            pstmt.executeUpdate();

            // Redirect to the confirmation page
            response.sendRedirect("Student_Login_Dashboard.jsp");

        } catch (Exception e) {
        	request.setAttribute("errorMessage", "Database access error: " + e.getMessage());
            request.getRequestDispatcher("Student.jsp").forward(request, response);
        	 e.printStackTrace();
            // Throw a more detailed ServletException
            throw new ServletException("Database access error", e);
        } finally {
            // Ensure connection is closed
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
