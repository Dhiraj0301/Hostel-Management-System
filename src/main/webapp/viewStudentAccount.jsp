<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student Account</title>
<style type="text/css">
	 body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: rgb(179, 217, 233);
        }
        .header {
            background-color: rgb(92, 169, 199);
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff;
        }
        .header h2 {
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
        }
        .header button:hover {
            background: #333;
        }
         h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 32px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: fadeIn 1s ease-out;
        }

        thead {
            background-color: #4CAF50;
            color: white;
            text-align: left;
        }

        th,
        td {
            padding: 12px 20px;
            text-align: left;
        }

        th {
            font-size: 16px;
            font-weight: 600;
        }

        td {
            font-size: 14px;
            color: #555;
            transition: background-color 0.3s ease;
        }

        /* Hover effect on table rows */
        tr:hover td {
            background-color: #f2f2f2;
        }

        /* Apply alternating row colors */
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:nth-child(odd) {
            background-color: #ffffff;
        }

        /* Hover effect for alternating rows */
        tbody tr:nth-child(even):hover {
            background-color: #e9e9e9;
        }

        tbody tr:nth-child(odd):hover {
            background-color: #f2f2f2;
        }

        /* Add subtle animation to table rows */
        tbody tr {
            animation: slideUp 0.5s ease-out forwards;
        }

        tbody tr:nth-child(even) {
            animation-delay: 0.1s;
        }

        tbody tr:nth-child(odd) {
            animation-delay: 0.2s;
        }

        /* Fade-in animation for the table */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: scale(0.95);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Slide-up animation for table rows */
        @keyframes slideUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Add responsive design for smaller screens */
        @media (max-width: 768px) {
            th,
            td {
                padding: 10px;
            }

            h1 {
                font-size: 24px;
            }
        }
</style>
</head>
<body>
	<div class="header">
        <div class="logo">
            <img src="https://cdn.vectorstock.com/i/500p/37/06/hostel-bed-on-mark-vector-19713706.avif" alt="Hostel Logo"> <!-- Replace with your logo image -->
            <h2>Hostel Management</h2>
        </div>
        <button onclick="logout()">Logout</button>
    </div>
	<h1>Student Information</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Father's Name</th>
                <th>Date of Birth</th>
                <th>Gender</th>
                <th>Blood Group</th>
                <th>Contact No</th>
                <th>Email ID</th>
                <th>Address</th>
                <th>Country</th>
                <th>City</th>
                <th>District</th>
                <th>State</th>
                <th>Pincode</th>
                <th>Aadhar</th>
                <th>Room Preference</th>
                <th>Floor</th>
                <th>Meal Option</th>
            </tr>
        </thead>
        <tbody>
            <% 
                try {
                    // Load JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish database connection
                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");

                    // SQL query to fetch student data
                    String sql = "SELECT * FROM hostel_application_form"; // Change this to filter for specific students if needed
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    // Iterate over the results and display in the table
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("fathersName") %></td>
                    <td><%= rs.getString("dob") %></td>
                    <td><%= rs.getString("gender") %></td>
                    <td><%= rs.getString("bloodGroup") %></td>
                    <td><%= rs.getString("contactNo") %></td>
                    <td><%= rs.getString("emailId") %></td>
                    <td><%= rs.getString("addressLane") %></td>
                    <td><%= rs.getString("country") %></td>
                    <td><%= rs.getString("city") %></td>
                    <td><%= rs.getString("district") %></td>
                    <td><%= rs.getString("state") %></td>
                    <td><%= rs.getString("pincode") %></td>
                    <td><%= rs.getString("aadharApplicant") %></td>
                    <td><%= rs.getString("roomPreference") %></td>
                    <td><%= rs.getString("floor") %></td>
                    <td><%= rs.getString("mealOption") %></td>
                </tr>
            <% 
                    }

                    // Close resources
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>