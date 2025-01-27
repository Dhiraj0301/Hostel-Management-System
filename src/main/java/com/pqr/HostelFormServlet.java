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

@WebServlet("/HostelFormServlet")
public class HostelFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HostelFormServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Retrieve form data
        String name = request.getParameter("Name");
        String fathersName = request.getParameter("fathersName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String bloodGroup = request.getParameter("bloodGroup");
        String contactNo = request.getParameter("contactNo");
        String emailId = request.getParameter("emailId");
        String addressLane = request.getParameter("addressLane");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String aadharApplicant = request.getParameter("aadharApplicant");
        String roomPreference = request.getParameter("roomPreference");
        String floor = request.getParameter("floor");
        String mealOption = request.getParameter("mealOption");
        String course = request.getParameter("course");
        String batch = request.getParameter("batch");

        // Parse roll_no safely
        int roll_no;
        try {
            roll_no = Integer.parseInt(request.getParameter("roll_no"));
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Roll Number format. Please enter a valid number.");
            return;
        }

        // Retrieve username from session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("users");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");

            // SQL query for inserting form data
            String sql = "INSERT INTO hostel_application_form (name, fathersName, dob, gender, bloodGroup, contactNo, emailId, "
                       + "addressLane, country, city, district, state, pincode, aadharApplicant, roomPreference, floor, mealOption, "
                       + "course, batch, roll_no) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, name);
            stmt.setString(2, fathersName);
            stmt.setString(3, dob);
            stmt.setString(4, gender);
            stmt.setString(5, bloodGroup);
            stmt.setString(6, contactNo);
            stmt.setString(7, emailId);
            stmt.setString(8, addressLane);
            stmt.setString(9, country);
            stmt.setString(10, city);
            stmt.setString(11, district);
            stmt.setString(12, state);
            stmt.setString(13, pincode);
            stmt.setString(14, aadharApplicant);
            stmt.setString(15, roomPreference);
            stmt.setString(16, floor);
            stmt.setString(17, mealOption);
            stmt.setString(18, course);
            stmt.setString(19, batch);
            stmt.setInt(20, roll_no); // Use parsed integer value for roll_no

            // Execute insert statement
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                // Update register table
                PreparedStatement updateStmt = con.prepareStatement("UPDATE register SET form_completed = 1 WHERE username = ?");
                updateStmt.setString(1, username);
                updateStmt.executeUpdate();
                updateStmt.close();

                response.sendRedirect("success.jsp"); // Redirect to success page
            } else {
                response.getWriter().println("Failed to insert data.");
            }

            // Close resources
            stmt.close();
            con.close();
         // Forward the request to the Student_Login_Dashboard.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("Student_Login_Dashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
