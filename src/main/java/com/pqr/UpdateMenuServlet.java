package com.pqr;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.DriverManager;

@WebServlet("/UpdateMenuServlet")
public class UpdateMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hostelmanagementsystem";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Dhiraj@1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        String mealType = request.getParameter("mealType");
        String mealDetails = request.getParameter("mealDetails");

        // Check if parameters are valid
        if (mealType == null || mealDetails == null || mealType.isEmpty() || mealDetails.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Missing parameters
            response.getWriter().write("Meal type or meal details are missing.");
            return;
        }

        // Perform the database update
        try (Connection conn = DatabaseConnection.initializeDatabase()) {
            // Log the connection status
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");
            if (conn != null) {
                System.out.println("Database connection established.");
            }

            // SQL query to update meal details
            String sql = "UPDATE menu SET details = ? WHERE meal_type = ?";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, mealDetails);
                pstmt.setString(2, mealType);

                // Execute the query and update the database
                int rowsUpdated = pstmt.executeUpdate();

                // Handle the result of the update
                if (rowsUpdated > 0) {
                    response.setStatus(HttpServletResponse.SC_OK); // OK response
                    response.getWriter().write("Meal details updated successfully.");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Failure response
                    response.getWriter().write("Failed to update the meal details.");
                }
            } catch (SQLException e) {
                // Log any exception during the SQL operation
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error while executing SQL query: " + e.getMessage());
            }
        } catch (SQLException e) {
            // Log any exception related to the connection
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Database connection error: " + e.getMessage());
        }
    }
}
