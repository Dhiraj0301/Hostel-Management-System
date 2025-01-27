<%@ page import="jakarta.servlet.*"  %>
<%@ page import="jakarta.servlet.http.*"  %>
<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Notification</title>
    
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<style>
	@charset "UTF-8";
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: linear-gradient(to top, rgb(2, 108, 150), white);
    font-family: 'Arial', sans-serif;
}

/* Header Section */
.header {
    padding: 0 5%;
    position: sticky;
    top: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 80px;
    background-color: rgb(2, 108, 150);
    color: black;
    box-shadow: 0px 0px 20px rgba(16, 17, 17, 0.5);
}

.header-logo {
    font-size: 25px;
    color: white;
}

.header .header-anchor {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 10px;
}

.header .header-anchor a {
    text-decoration: none;
    padding: 8px 20px;
    color: white;
    border-radius: 4px;
    font-weight: bold;
}

.header .header-anchor i {
    font-size: 25px;
}

.header .header-anchor a:hover {
    color: rgb(224, 145, 145);
}

/* Dropdown Notification */
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 400px;
    min-height: 300px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    right: 0;
    transform: translateX(0);
    background-color: rgb(44, 118, 148);
    border-radius: 25px;
    padding: 20px;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.noti-title {
    padding: 10px;
    color: white;
    font-size: 18px;
}

.noti-1, .noti-2, .noti-3 {
    background-color: white;
    color: black;
    margin: 10px 0;
    border-radius: 35px;
    padding: 10px 15px;
}

.clear {
    margin-top: 20px;
    text-align: center;
    padding: 10px;
    background-color: white;
    color: rgb(44, 118, 148);
    border-radius: 10px;
    cursor: pointer;
}

/* Card Section */
.card {
    min-height: 90vh;
    width: 100vw;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.card h1 {
    margin-top: 30px;
    font-size: 40px;
    font-style: italic;
    color: white;
}

.ticket-container, .form-container {
    background-color: white;
    width: 30%;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0px 0px 20px rgba(16, 20, 17, 0.7);
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.svg-image {
    height: 60%;
    width: 60%;
}

.ticket-container h3 {
    margin-top: 10px;
    font-size: 30px;
    margin-bottom: 20px;
    color: rgb(2, 108, 150);
}

.service-requirement {
    display: flex;
    justify-content: space-between;
    gap: 30px;
}

.card a {
    text-decoration: none;
    color: black;
    background-color: white;
    margin-top: 20px;
    height: 50px;
    width: 130px;
    font-size: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

/* Form Styles */
.form-container form {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.form-container label {
    font-size: 18px;
    margin-bottom: 10px;
    color: rgb(2, 108, 150);
}

.form-container textarea {
    padding: 15px;
    width: 100%;
    height: auto;
    min-height: 100px; 
    margin-bottom: 15px;
    border-radius: 8px;
    border: 1px solid rgba(2, 108, 150, 0.5);
    font-size: 16px;
    resize: vertical; /* Allows resizing only vertically */
    overflow: auto; /* Makes sure the scroll appears if needed */
    line-height: 1.5;
}


.form-container input[type="submit"] {
    padding: 10px 20px;
    background-color: rgb(2, 108, 150);
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

.form-container input[type="submit"]:hover {
    background-color: rgb(1, 85, 120);
}
	
</style>
<body>
<!-- admin_add_notification.jsp -->
<%
    String notificationMessage = request.getParameter("message");

    if(notificationMessage != null && !notificationMessage.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");
            
            String sql = "INSERT INTO notifications (message) VALUES (?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, notificationMessage);
            stmt.executeUpdate();
            
            out.println("Notification added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error adding notification.");
        }
    }
%>


    <!-- Header Section -->
    <div class="header">
        <div class="header-logo">
            <h3>LOGO</h3>
        </div>
        <div class="header-anchor">
            <div class="home-buttom"><a href="student_login_dashboard.html"><i class="ri-home-3-fill"></i></a></div>
            <div class="services"><a href="#services"><i class="ri-user-voice-fill"></i></a></div>
            <div class="menu"><a href="#"><i class="ri-restaurant-fill"></i></a></div>
            <div class="payment"><a href="#"><i class="ri-money-rupee-circle-fill"></i></a></div>

            <!-- Notification Dropdown -->
            <div class="dropdown">
                <a href="#" class="notification"><i class="ri-notification-3-fill"></i></a>
                <div class="dropdown-content">
                    <h1 class="noti-title">Notifications</h1>
                    <div class="messages">
                        
                    </div>
                    <div class="clear">
                        <a href="#"><h3>Clear Notification</h3></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content: Notification Form -->
    <div class="card">
        <h1>Add a Notification</h1>
        <div class="form-container">
            <form action="admin_add_notification.jsp" method="post">
                <label for="message">Notification Message:</label>
                <textarea id="message" name="message" rows="4" required></textarea>
                <input type="submit" value="Add Notification">
            </form>
        </div>
        <a href="admin.jsp">Back</a>
    </div>

</body>
</html>
