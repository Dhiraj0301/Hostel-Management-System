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
<title>Hostel Card</title>
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
  /* Profile Section Styling */
  .profile-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
  }
  
  .profile-pic {
    width: 220px;
    height: 220px;
    border-radius: 50%;
    border: 4px solid #FF6F61;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  }
	/* Hostel Card Styling */
  .hostel-card-container {
    width: 500px;
    height: 570px;
    background: #ffffff;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    padding: 30px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    margin-left: 400px;
  }
  
  .hostel-card-container:hover {
    transform: scale(1.05);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
  }
  
  .hostel-card-container h2 {
    margin: 15px 0;
    font-size: 1.8em;
    color: #FF6F61;
    font-weight: bold;
  }
  
  .hostel-card-container p {
    font-size: 1em;
    color: #666;
    line-height: 1.5;
  }
  
  .button-container {
    margin-top: 20px;
  }
	 .view-more-btn {
    padding: 10px 20px;
    font-size: 1em;
    background: #FF6F61;
    color: #fff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s ease;
  }
  
  .view-more-btn:hover {
    background: #FF9A8B;
  }
  
  .info h2 {
    margin: 10px 0;
    font-size: 2em;
    color: #333;
  }
  
  .info p {
    margin: 5px 0;
    font-size: 1.2em;
    color: #555;
  }
  
  .info p strong {
    font-weight: bold;
    color: #333;
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
            //response.sendRedirect("login.jsp");
        //    return; // Stop further execution
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
     <%
        // Get the session object
        session = request.getSession(false); // false to avoid creating a new session
        String user = (String) session.getAttribute("users"); // Retrieve the username from session
        String Fullname = "";
        String contactNo = "";
        String course = "";
        String batch = "";
        int roll_no = 0;

        if (users == null) {
            // Redirect to login page if the user is not logged in
            response.sendRedirect("login.jsp");
        } else {
            try {
                // Load JDBC driver and establish connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");

                // Query to get the user's details (course, batch, roll_no) and fullname from hostel_application_form
                String sql = "SELECT Fullname, contactNo,course, batch, roll_no FROM hostel_application_form WHERE username = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, users);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    fullname = rs.getString("Fullname");
                    contactNo=rs.getString("contactNo");// Full name of the user
                    course = rs.getString("course"); // Course
                    batch = rs.getString("batch"); // Batch
                    roll_no = rs.getInt("roll_no"); // Roll number
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
            <button><a href="Student_Login_Dashboard.jsp">Back</a></button>
        </div>
    </div>
	<!-- Hostel Card -->
  <!-- <div class="hostel-card-container">
    <div class="profile-section">
      <img id="profileImageHostelCard" src="../asset/user.svg" alt="Profile Image" class="profile-pic">
    </div>
    <h2>Sarojini Girls Hostel</h2>
    <p>Providing a safe and vibrant space for students</p>
  </div>

  <script>
    // Load the saved profile image from local storage
    document.addEventListener('DOMContentLoaded', function() {
      const savedImage = localStorage.getItem('hostelProfileImage');
      if (savedImage) {
        document.getElementById('profileImageHostelCard').src = savedImage;
      }
    });
  </script> -->

  <div class="hostel-card-container">
      <h2>Sarojini  Hostel</h2>
    <div class="profile-section">
      <img id="profileImageHostelCard" src="../asset/user.svg" alt="Profile Image" class="profile-pic">
    </div>
	<div class="info">
        <h2>Name:  <%= fullname %></h2>
        <p><strong>Room No:</strong> 202</p>
        
        <p><strong>Contact:</strong><%= (contactNo != null && !contactNo.isEmpty()) ? contactNo : "7864092289" %> </p>
        <p><strong>Course:B.Tech</strong> <%= course %></p>
        <p><strong>Batch:2024</strong>  <%= batch %></p>
        <p><strong>Roll no:10800122004</strong> <%= roll_no %></p>
      </div>
  </div>

  <script>
    // Load the saved profile image from local storage
    document.addEventListener('DOMContentLoaded', function() {
      const savedImage = localStorage.getItem('hostelProfileImage');
      if (savedImage) {
        document.getElementById('profileImageHostelCard').src = savedImage;
      }
    });
  </script>
	
</body>
</html>