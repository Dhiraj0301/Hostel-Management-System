<%@ page import="jakarta.servlet.*"  %>
<%@ page import="jakarta.servlet.http.*"  %>
<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Services</title>
<style type="text/css">
	@charset "UTF-8";
/* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
            min-height: 100vh;
            padding:20px
        }
.header {
            background-color: rgb(92, 169, 199);
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff;
        }

        .header .button-group {
            display: flex;
            gap: 9px;
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
            margin-left: 5px;
        }

        .header button a {
            color: white;
            text-decoration: none;
        }

        .header button:hover {
            background: #333;
        }

/* Header Styles */
h1 {
    color: rgb(2, 108, 150);
    text-align: center;
    margin-bottom: 20px;
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ccc;
    padding: 12px;
    text-align: left;
}

th {
    background-color: rgb(2, 108, 150);
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Button Styles */
button {
    padding: 8px 12px;
    margin: 0 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    color: white;
    transition: background-color 0.3s;
}

button[name="action"] {
    background-color: rgb(2, 108, 150);
}

button[name="action"]:hover {
    background-color: rgb(1, 80, 110);
}

button[value="Accept"] {
    background-color: rgb(0, 123, 0); /* Green for accept */
}

button[value="Accept"]:hover {
    background-color: rgb(0, 100, 0);
}

button[value="Reject"] {
    background-color: rgb(220, 53, 69); /* Red for reject */
}

button[value="Reject"]:hover {
    background-color: rgb(200, 30, 30);
}
</style>
</head>
<body>
	<div class="header">
        <div class="logo">
            <img src="https://cdn.vectorstock.com/i/500p/37/06/hostel-bed-on-mark-vector-19713706.avif" alt="Hostel Logo"> 
            <h2>Hostel Management</h2>
        </div>
        <div class="button-group">
            <button onclick="logout()">Logout</button>
            <button><a href="admin.jsp">Back</a></button>
        </div>
    </div>

    <h1>Pending Service Requests</h1>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>Service Type</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");

                String query = "SELECT * FROM service_requests WHERE status='Pending'";
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("service_type") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <form action="AdminResponseServlet" method="post">
                    <input type="hidden" name="requestId" value="<%= rs.getInt("request_id") %>">
                    <button name="action" value="Accept" type="submit">Accept</button>
                    <button name="action" value="Reject" type="submit">Reject</button>
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
	
</body>
</html>