<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submission Successful</title>
<style type="text/css">
	* {
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    /* display: flex; */
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f4f4f4;
    margin: 0;
}
.header {
    background-color: rgb(92, 169, 199);
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #fff;
}

.header .button-group {
    display: flex;
    gap: 9px;
}

.header h3 {
    margin: 0;
    font-size: 24px;
}

.header .logo {
    display: flex;
    align-items: center;
}

.header .logo img {
    width: 40px;
    margin-right: 10px;
}

.header button {
    background: #4e4fbf;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
    margin-left: 5px;
}

.header button a {
    color: white;
    text-decoration: none;
}

.header button:hover {
    background: #333;
}
.success-message {
    background-color: #4CAF50;
    color: white;
    padding: 15px;
    margin-top: 20px;
    border-radius: 5px;
    text-align: center;
    font-size: 16px;
}
</style>
</head>
<body>
<%
        session = request.getSession(false); // use false to avoid creating a new session if one doesn't exist
        String users = (String) session.getAttribute("users");
        String fullname = "";
        //System.out.println("Username from session: " + users); // Debugging


        if (users == null) {
            response.sendRedirect("login.jsp");
            return; // Stop further execution
        } else {
            try {
                // Load JDBC driver and establish connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");

                // Query to get full name of logged-in user
                String sql = "SELECT Fullname FROM register WHERE username = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, users);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    //fullname = rs.getString(1);
                    fullname = rs.getString("Fullname"); // Using column name
            System.out.println("Full name retrieved: " + fullname); // Debugging
                }

                // Close resources
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    %>
<div class="header">
        <div class="logo">
            <img src="https://cdn.vectorstock.com/i/500p/37/06/hostel-bed-on-mark-vector-19713706.avif" alt="Hostel Logo"> 
            <h3>Hii,<%= fullname %></h3>
        </div>
        <div class="button-group">
            <button onclick="logout()"><a href="LogOut.jsp">Logout</a></button>
            <button><a href="login.jsp">Back</a></button>
        </div>
    </div>
	 <div id="successMessage" class="success-message">
        <p>Form submitted successfully!</p>
        <a href="Student_Login_Dashboard.jsp">Done</a>
    </div>
</body>
</html>