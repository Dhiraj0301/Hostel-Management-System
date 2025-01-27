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
    <title>student_login_dashboard</title>
    <link rel="stylesheet" href="student_login_dashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
    
</head>
<body>
	
  <%
        session = request.getSession(false); // use false to avoid creating a new session if one doesn't exist
        String users = (String) session.getAttribute("users");
        String fullname = "";

        if (users == null) {
            //response.sendRedirect("login.jsp");
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
                    fullname = rs.getString(1);
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
        <div class="header-logo" style="display: flex; align-item: center;">
            <img src="https://cdn.vectorstock.com/i/500p/37/06/hostel-bed-on-mark-vector-19713706.avif" alt="Hostel Logo" style="width: 40px; margin-right: 10px;">

            <h2>Hostel Management</h2>
        </div>
        
        <div class="header-anchor">
            <div class="home-buttom"><a href="Student_Login_Dashboard.jsp"><i class="ri-home-3-fill"></i></a></div>
            <div class="services"><a href="services.jsp"><i class="ri-user-voice-fill"></i></a></div>
            <div class="menu"><a href="menu.jsp"><i class="ri-restaurant-fill"></i></a></div>
            <div class="payment"><a href="payment.jsp"><i class="ri-money-rupee-circle-fill"></i></a></div>
            <div class="payment"><a href="complain.jsp"><i class="ri-questionnaire-fill"></i></i></a></div>
            
            <!-- Notification Dropdown -->
            
            <div class="dropdown">
                <a href="" class="notfication"><i class="ri-notification-3-fill"></i></a>
                

					<%
   						 try {
        					Class.forName("com.cj.mysql.jdbc.Driver");
        				     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:7000/hostelmanagementsystem", "root", "Dhiraj@1234");

        				      String sql = "SELECT message, created_at FROM notifications ORDER BY created_at DESC";
        			            Statement stmt = con.createStatement();
        			            ResultSet rs = stmt.executeQuery(sql);
					%>

				<div class="dropdown-content">
    				<h1 class="noti-title">Notifications</h1>
    				<div class="messages">
        			<%
        			while (rs.next()) {
        				 String message = rs.getString("message");
                        
        			%>
            			<div class="notification-item" style="height: auto;
  width: 90%;
  background-color: white;
  color: black;
  margin: 10px;
  border-radius: 35px;
  padding: 9px;">
                			<%= message %>
            			</div>
        			<%
            			}
        			%>
    			</div>
    			<div class="clear">
        			<a href="clear_notifications.jsp"><h3>Clear Notification</h3></a>
    			</div>
			</div>

					<%
    					} catch (Exception e) {
    			            e.printStackTrace();
    					}
					%>

            </div>
        </div>

        <button onclick="logout()" style="background: #4e4fbf; color: white; padding: 10px 15px; border: none; border-radius: 5px; cursor: pointer; transition: background 0.3s;"><a href="LogOut.jsp">Logout</a></button>
    </div>

    <div class="home">
        <div class="home-2">
            <img id="profileImageDashboard" src="asset/user.svg" alt="Profile Image" class="profile-pic">
            <label for="uploadImage" class="add-image-btn">Upload Image</label>
            <input type="file" id="uploadImage" accept="image/*" style="display:none;" onchange="uploadImage(event)">
		</div>
        <div class="home-1">
            <h1>Welcome,<%= fullname %></h1>
            
        </div>
    </div>
    <div class="details-container">
        <div class="university-detail">
            <div class="university"><h3>University:</h3></div>
            <p>MAKAUT</p>
        </div>
        <div class="study-program">
            <div class="course"><h3>Course:</h3></div>
            <p><%= (request.getAttribute("course") != null) ? request.getAttribute("course") : "B.Tech" %></p>
        </div>
        <div class="batch-detail">
            <div class="batch"><h3>Batch:</h3></div>
            <p><%= (request.getAttribute("batch") != null) ? request.getAttribute("batch") : "2024" %></p>
        </div>
        <div class="roll-detail">
            <div class="roll"><h3>Roll No. :</h3></div>
            <p>10800122<%= (request.getAttribute("roll_no") != null) ? request.getAttribute("roll_no") : "004" %></p>
        </div>
    </div>
    <div class="dues-detail">
        <div class="dues"><h1>Dues</h1></div>
        <div class="fees-detail">

            <div class="fees">
                <div class="fee-name"><h2>Fees List</h2></div><br>
                <div >Mess Fee</div>
                <div >Hostel Fee </div>
                <div >Laundry Fee</div>
                <div >Service Charge</div>
                
            </div>
           
            <div class="fees-2">
                <div class="amount"><h2>Amount</h2></div><br>
                <div >Rs. 4000</div>
                <div >Rs. 3000</div>
                <div >Rs. 700</div>
                <div >Rs. 500</div>
            
            </div>
            <div class="fees-3">
                <div class="due-date"><h2>Due Date</h2></div><br>
                <div >31/12/2024</div>
                <div >31/12/2024</div>
                <div >31/12/2024</div>
                <div >31/12/2024</div>
            </div>
        
         </div>
    </div>
    <div class="hostel-card">
        <a href="hostelCard.jsp"><h1>Hostel-Card</h1></a>
    </div>
    <div class="quote">
        <p>
            Located in the heart of the campus, Sarojini  Hostel offers a comfortable and vibrant living space for students.
        </p>
        
</div>

<footer>
        <h1>Coordinators</h1>
        <div class="coordinators">
            <div>
                <h2>Hostel Wardens</h2>
                <h4>Ashmi - +91 8979874989</h4>
                <h4>Lipika - +91 6871687198</h4>
            </div>
            <div>
                <h2>ANTI RAGGING CELL</h2>
                <h4>Ashmi - +91 8979874989</h4>
                <h4>Ashmi - +91 8979874989</h4>
                <h4>Ashmi - +91 8979874989</h4>
            </div>
        </div>
        <div class="sub-coordinator">
            <h1>Sub-Coordinators</h1>
            <div>
                <h2>Mess Coordinators</h2>
                <h4>Rana - +91 8979874989</h4>
                <h4>Tony - +91 6871687198</h4>
            </div>
            <div>
                <h2>Hostel Helpers</h2>
                <h4>Super - +91 8979874989</h4>
                <h4>Gita - +91 8979874989</h4>
                <h4>Sunita - +91 8979874989</h4>
            </div>
            <div>
                <h2>Doctors</h2>
                <h4>Dr. Hansraj - +91 8979874989</h4>
            </div>
            <div>
                <h2>Travel Support</h2>
                <h4>Auto Driver - +91 7268787763</h4>
                <h4>Car Driver - +91 7268787763</h4>
            </div>
        </div>
</footer>
</div>


    <!-- <div id="services">
        <h2>Choose the Services</h2>
        <div class="services-list">

            <div class="service"><a href="ticket2.html"><img style="height: 100%; width: 100%; border-radius: 20px; " src='../asset/wash-service.webp' alt="error"></a></div>
            <div class="service"><a href="ticket1.html"><img style="height: 100%; width: 100%; border-radius: 20px; " src="../asset/electrician.jpg" alt=""></a></div>
            <div class="service"><a href="ticket3.html"><img style="height: 100%; width: 100%; border-radius: 20px;" src="../asset/plumbing-man.jpg" alt=""></a></div>
            <div class="service"><a href="ticket4.html"><img style="height: 100%; width: 100%; border-radius: 20px;" src="../asset/sweeper.jpeg" alt=""></a></div>
        </div>
    </div> -->

    <script>
        // Function to preview the uploaded image
        function uploadImage(event) {
      const file = event.target.files[0];
      const reader = new FileReader();

      reader.onload = function(e) {
        const uploadedImage = e.target.result;

        // Update the dashboard image
        document.getElementById('profileImageDashboard').src = uploadedImage;

        // Save the image to local storage
        localStorage.setItem('hostelProfileImage', uploadedImage);
      };

      if (file) {
        reader.readAsDataURL(file);
      }
    }

    // Load the saved image on page load
    document.addEventListener('DOMContentLoaded', function() {
      const savedImage = localStorage.getItem('hostelProfileImage');
      if (savedImage) {
        document.getElementById('profileImageDashboard').src = savedImage;
      }
    });
    
    
    document.querySelector('.notfication').addEventListener('click', function() {
        document.querySelector('.dropdown-content').classList.toggle('show');
    });
 </script>   
</body>
</html>