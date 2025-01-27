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
<title>HostelForm</title>
<link rel="stylesheet" href="hostelForm.css">
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
    <div class="form-container">
        <h2>Application Form</h2>
        
        
        <form id="hostelForm" action="HostelFormServlet" method="post">
        <!-- Personal Details Section -->
            <div class="form-section">
                <h3>Personal Details</h3>
                <label>Name:                   
                    <input type="text" name="Name" placeholder="Name">                    
                </label>
                <label>Father's Name:            
                    <input type="text" name="fathersName" placeholder="Name">                    
                </label>
                <label>Date of Birth:
                    <input type="date" name="dob">
                </label>
                <label>Gender:
                    <select name="gender">
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </label>
                <label>Blood-Group:
                    <select id="bloodGroup" class="item-input" name="bloodGroup" required>
                        <option value="" disabled selected>Select Blood Group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                </label>
                <label>Contact No.:
                    <input type="number" name="contactNo" placeholder="Contact No">
                </label>
                <label>Email Id:
                    <input type="email" id="emailId" name="emailId" required="required" placeholder="Email Id">
                </label>
            </div>

            <!-- Permanent Address Section -->
            <div class="form-section">
                <h3>Permanent Address</h3>
                <!-- <label>House No./Apartment Name/Block No.:
                    <input type="text" name="houseNo" placeholder="House No./Apartment">
                </label> -->
                <label>Address Lane:
                    <input type="text" name="addressLane">
                </label>
                <label>Country:
                    <select name="country">
                        <option>India</option>
                        <!-- Add more options as needed -->
                    </select>
                </label>
                <label>City:
                    <input type="text" name="city" placeholder="City">
                </label>
                <label>District:
                    <input type="text" name="district" placeholder="District">
                </label>
                <label>State:
                    <input type="text" name="state" placeholder="State">
                </label>
                <label>Pincode:
                    <input type="text" name="pincode" placeholder="Pincode">
                </label>
            </div>
            <div class="form-section">
                <h3>Aadhaar Details</h3>
                <label>Aadhaar Number of applicant:
                    <input type="number" name="aadharApplicant" placeholder="Aadhar Number of Guardian">
                </label>
                <label>Aadhaar Image of applicant:
                    <input type="file">
                </label>
                <label>Aadhaar Number of guardian:
                    <input type="number"  placeholder="Aadhar Number of Guardian">
                </label>
                <label>Aadhaar Image of guardian:
                    <input type="file">
                </label>         
            </div>
            
            
            <div class="form-section">
                <h3>Course Details</h3>
                <label>Course:
                    <select name="course">
                    	<option value="" disabled selected>Select Course Type</option>
                    	<option value="B.Tech">B.Tech</option>
                    	<option value="BBA">BBA</option>
                    	<option value="BCA">BCA</option>
                    	<option value="M.Tech">M.Tech</option>
                    	<option value="MCA">MCA</option>
                    	<option value="MBA">MBA</option>
                    </select>
                </label>
                <label>Batch:
                    <input type="number" name="batch" placeholder="Enter batch:">
                </label>
                <label>Roll no:
                    <input type="number" name="roll_no" placeholder="Enter Roll no." required>
                </label>
                        
            </div>
            
            <div class="form-section">
                <h3>Room Preference and Meal selection</h3>
                <label>Room Preference:
                    <select name="roomPreference">
                        <option value="" disabled selected>Select Room Type</option>
                        <option value="Non-AC Single Room">Non-AC Single Room</option>
                        <option value="AC Single Room">AC Single Room</option>
                        <option value="Non Ac Double Room">Non Ac Double Room</option>
                        <option value="Ac Double Room">Ac Double Room</option>
                    </select>
                </label>
                <label>Select Floor:
                    <select name="floor">
                        <option value="" disabled selected>Select Floor</option>
                        <option value="Ground Floor">Ground Floor</option>
                        <option value="First Floor">First Floor</option>
                        <option value="Second Floor">Second Floor</option>
                        <option value="Third Floor">Third Floor</option>
                    </select>
                </label>
                
                <label>Options:
                    <select name="mealOption">
                        <option value="" disabled selected>Options</option>
                        <option value="VEG">VEG</option>
                        <option value="Non-VEG">Non-VEG</option>
                    </select>
                </label>
            </div>
            <div class="form-section">
                <h3>Payment</h3>
                <label  >Hostel Admission fees (Rs 2,000)
                    <input type="checkbox">
                </label>
                <label >Hostel Fees (Rs. 3,000/month)
                    <input type="checkbox">
                </label>
                <label  >Mess Fees (Rs. 3,000/month)
                    <input type="checkbox">
                </label>
                <label>Caution Money (Rs. 5,000 applicable once)
    				<input type="checkbox">  
                </label>          
            </div>
            <button type="submit" class="submit-button">Submit</button>
        </form>
    </div>
    
    

    <script src="script.js">
    document.querySelectorAll('.tab-button').forEach((button) => {
        button.addEventListener('click', () => {
            document.querySelector('.tab-button.active').classList.remove('active');
            button.classList.add('active');
            // Additional code for tab switching logic can be added here.
        });
    });

    document.getElementById('hostelForm').addEventListener('submit', function(e) {
        e.preventDefault();
        alert('Form submitted successfully!');
        // Add AJAX call or form submission logic here
    });
    document.getElementById('hostelForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the form from submitting the traditional way
        
        // Show the success message
        document.getElementById('successMessage').style.display = 'block';
        
        // Optionally, hide the form after submission
        document.querySelector('.form-container').style.display = 'none';

        // You can also send the form data to a server using AJAX if needed
    });

    </script>
</body>
</html>