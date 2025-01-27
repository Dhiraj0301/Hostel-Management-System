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
<title>Students Dashboard</title>
<link rel="stylesheet" href="Student.css">
<link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<body>
	
	<%
        session = request.getSession(false); // use false to avoid creating a new session if one doesn't exist
        String users = (String) session.getAttribute("users");
        String fullname = "";
        //System.out.println("Username from session: " + users); // Debugging


        if (users == null) {
          //  response.sendRedirect("login.jsp");
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
    <div class="header-logo">
        <h3><i class="ri-user-fill"></i> Hii,<%= fullname %></h3>
    </div>
    <div class="header-anchor">
        <a href="LogOut.jsp" style="font-size: 25px;">Logout</a>
    </div>
</div>

<div class="container">

    <div class="form">
        <div class="title">DASHBOARD</div>
        <div class="form-field">
            <ul>
                <li class="form-field"><a onclick="showForm('form1')">BOOK HOSTEL</a></li>
                <li class="form-field"><a onclick="showForm('form2')">ROOM PREFERENCE</a></li>
                <li class="form-field"><a onclick="showForm('form3')">PAYMENT</a></li>
                <li class="form-field"><a onclick="showForm('form4')">PREVIEW</a></li>
            </ul>
        </div>
    </div>

    <div id="form1" class="form-container">
        <h2 class="book-hostel">STUDENTS DETAIL</h2>
        <form class="dashboard-form" method="post" action="SubmitFormServlet" onsubmit="return validateForm()">
            <div class="students-detail">
                <div class="item">
                    <input class="item-input" placeholder="Name of Student" type="text" id="studentName" name="studentName"  required />
                    <label class="item-label">Name</label>
                </div>
                <div class="item">
                <label class="item-label">Blood Group</label>
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
                    
                </div>
                <div class="item">
                    <input type="number" id="contactNo" class="item-input"  placeholder="Contact No" name="contactNo" required>
                    <label class="item-label">Contact No</label>
                </div>
                <div class="item">
                    <input type="number" name="emergencyNo"  id="emergencyNo" class="item-input" required="required" placeholder="Emergency No">
                    <label class="item-label">Emergency No.</label>
                </div>
                <div class="item">
                    <input type="email" id="emailId" name="emailId" class="item-input" required="required" placeholder="Email Id">
                    <label class="item-label">Email Id</label>
                </div>
            </div>
        </form>

        <h2 class="book-hostel">RESIDENTIAL ADDRESS</h2>
        <form method="post" action="SubmitFormServlet">
            <div class="residential-address">
                <div class="item">
                    <input type="text" id="addressLine1" name="addressLine1" class="item-input" required="required" placeholder="Address Line 1">
                    <label class="item-label">Address Line 1</label>
                </div>
                <div class="item">
                    <input type="text" id="addressLine2" name="addressLine2" class="item-input" required="required" placeholder="Address Line 2">
                    <label class="item-label">Address Line 2</label>
                </div>
                <div class="item">
                    <input type="number" id="pincode" name="pincode" class="item-input" required="required" placeholder="Pincode">
                    <label class="item-label">Pincode</label>
                </div>
                <div class="item">
                    <input type="text" id="district" name="district" class="item-input" required="required" placeholder="District">
                    <label class="item-label">District</label>
                </div>
                <div class="item">
                    <input type="text" id="state" name="state" class="item-input" required="required" placeholder="State">
                    <label class="item-label">State</label>
                </div>
                <div class="item">
                    <input type="text" id="country" name="country" class="item-input" required="required" placeholder="Country">
                    <label class="item-label">Country</label>
                </div>
            </div>
        </form>

        <h2 class="book-hostel">Guardian's Details</h2>
        <form method="post" action="SubmitFormServlet">
            <div class="guardians-details">
                <div class="item">
                    <input type="text" id="guardianName" name="guardianName" class="item-input" required="required" placeholder="Name of Guardian">
                    <label class="item-label">Guardian's Name</label>
                </div>
                <div class="item">
                    <input type="number" id="guardianContactNo" name="guardianContactNo" class="item-input" required="required" placeholder="Contact No">
                    <label class="item-label">Contact No.</label>
                </div>
                <div class="item">
                    <input type="text" id="guardianRelationship" name="guardianRelationship" class="item-input" required="required" placeholder="Relationship with Tenant">
                    <label class="item-label">Relationship with Tenant</label>
                </div>
                <div class="item">
                    <input type="email" id="guardianEmail" name="guardianEmail" class="item-input" required="required" placeholder="Email Address">
                    <label class="item-label">Email Address</label>
                </div>
            </div>
        </form>
        
        <h2 class="book-hostel">Guardian Verification</h2>
        <form method="post" action="SubmitFormServlet">
            <div class="guardians-verification">
                <div class="item">
                    <input type="number" name="guardianAadhaarNo" id="guardianAadhaarNo" class="item-input" required="required" placeholder="Aadhar Number of Guardian">
                    <label class="item-label">Aadhaar Number</label>
                </div>
                <div class="item">
                    <input type="file" id="guardianAadhaarImg1" name="guardianAadhaarImg1" class="item-input" required="required">
                    <label class="item-label">Aadhaar Image (front)</label>
                </div>
                <div class="item">
                    <input type="file" id="guardianAadhaarImg2" name="guardianAadhaarImg2" class="item-input" required="required">
                    <label class="item-label">Aadhaar Image (back)</label>
                </div>
            </div>
        </form>

        <h2 class="book-hostel">Tenant's Documentation</h2>
        <form method="post" action="SubmitFormServlet">
            <div class="tenants-documentation">
                <div class="item">
                    <input type="number" id="tenantAadhaarNo" name="tenantAadhaarNo" class="item-input" required="required" placeholder="Aadhaar Number of Tenant">
                    <label class="item-label">Aadhaar Number</label>
                </div>
                <div class="item">
                    <input type="file" id="tenantAadhaarImg1" name="tenantAadhaarImg1" class="item-input" required="required">
                    <label class="item-label">Aadhaar Image (front)</label>
                </div>
                <div class="item">
                    <input type="file" id="tenantAadhaarImg2" name="tenantAadhaarImg2" class="item-input" required="required">
                    <label class="item-label">Aadhaar Image (back)</label>
                </div>
            </div>
            
        </form>

   
            <h3>ROOM PREFERENCE</h3>
            <form method="post" action="SubmitFormServlet">
                <div class="hostel-allocation">
                    <div class="item">
                        <label for="room-preference" class="item-label">Room Preference</label>
                        <select id="roomPreference" name="room-preference" class="item-input">
                            <option value="" disabled selected>Select Room Type</option>
                          <option value="Non-AC Single Room">Non-AC Single Room</option>
                          <option value="AC Single Room">AC Single Room</option>
                          <option value="Non Ac Double Room">Non Ac Double Room</option>
                          <option value="Ac Double Room">Ac Double Room</option>
                        </select>
                    </div>
                    <div class="item">
                        <label for="floor-preference" class="item-label">Select Floor</label>
                        <select id="floorPreference" name="floor-preference" class="item-input">
                            <option value="" disabled selected>Select Floor</option>
                          <option value="Ground Floor">Ground Floor</option>
                          <option value="First Floor">First Floor</option>
                          <option value="Second Floor">Second Floor</option>
                          <option value="Third Floor">Third Floor</option>
                        </select>
                    </div>
                    <h3>Meal for Tenant</h3>
                    <div class="item">
                        <label for="meal-preference" class="item-label">Options</label>
                        <select id="mealPreference" name="meal-preference" class="item-input">
                          <option value="" disabled selected>Options</option>
                          <option value="VEG">VEG</option>
                          <option value="Non-VEG">Non-VEG</option>
                        </select>
                    </div>
                    
                </div>
            </form>

    
   
        <h3>PAYMENT</h3>
        <form method="post" action="SubmitFormServlet">
            <div class="item">
                <label class="item-label">Payment</label>
                <div class="item-input-payment">
                    <div class="payment-img">
                        <!-- <img src="asset/payment.svg" alt=""> -->
                    </div>
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <label  >Hostel Admission fees (Rs 2,000)</label>
                            <input type="checkbox" id="admissionFee" name="admissionFee" value="Hostel Admission fees" required="required">
                        </div>
            
                        <div class="checkbox-item">
                            <label >Hostel Fees (Rs. 3,000/month)</label>
                            <input type="checkbox" name="hostelFee" id="hostelFee" value="Hostel Fees" required="required">
                        </div>
            
                        <div class="checkbox-item">
                            <label  >Mess Fees (Rs. 3,000/month)</label>
                            <input type="checkbox" name="messFee" id="messFee" value="Mess Fees" required="required">
                        </div>
       
                       <input type="hidden" name="cautionMoney" value="0"> <!-- Default value -->
						<div class="checkbox-item">
    						<label>Caution Money (Rs. 5,000 applicable once)</label>
    						<input type="checkbox" name="cautionMoney" id="cautionMoney" value="5000" onchange="this.form.cautionMoney.value = this.checked ? this.value : '0'">
						</div>

                    </div>
                </div>
            </div>
        </form>
        <div class="student-submit">

             <input class="student-submit" onClick="previewData(event)" type="submit" value="Submit">
         </div>
   
    </div>
    
            <div id="form4" class="form-container">
                <h3>PREVIEW</h3>
                <div class="preview-section">
                    <!-- Student Details Preview -->
                    <div class="preview-block">
                        <h4>Student Details</h4>
                        <p><strong>Name:</strong> <span id="previewName"></span></p>
                        <p><strong>Blood Group:</strong><span id="previewBloodGroup"></span> </p>
                        <p><strong>Contact No:</strong> <span id="previewContactNo"></span></p>
                        <p><strong>Emergency No:</strong> <span id="previewEmergencyNo"></span></p>
                        <p><strong>Email Id:</strong> <span id="previewEmailId"></span></p>
                    </div>
            
                    <!-- Residential Address Preview -->
                    <div class="preview-block">
                        <h4>Residential Address</h4>
                        <p><strong>Address Line 1:</strong> <span id="previewAddressLine1"></span></p>
                        <p><strong>Address Line 2:</strong><span id="previewAddressLine2"></span></p>
                        <p><strong>Pincode:</strong> <span id="previewPincode"></span></p>
                        <p><strong>District:</strong> <span id="previewDistrict"></span></p>
                        <p><strong>State:</strong> <span id="previewState"></span></p>
                        <p><strong>Country:</strong> <span id="previewCountry"></span></p>
                    </div>
            
                    <!-- Guardian's Details Preview -->
                    <div class="preview-block">
                        <h4>Guardian's Details</h4>
                        <p><strong>Guardian's Name:</strong> <span id="previewGuardianName"></span></p>
                        <p><strong>Contact No:</strong> <span id="previewGuardianContactNo"></span></p>
                        <p><strong>Relationship with Tenant:</strong> <span id="previewGuardianRelationship"></span></p>
                        <p><strong>Email Address:</strong> <span id="previewGuardianEmail"></span></p>
                    </div>
            
                    <!-- Guardian Verification Preview -->
                    <div class="preview-block">
                        <h4>Guardian Verification</h4>
                        <p><strong>Aadhaar Number:</strong> <span id="previewGuardianAadhaarNo"></span></p>
                        <p><strong>Aadhaar Front Image:</strong> <span id="previewGuardianAadhaarImg1"></span></p>
                        <p><strong>Aadhaar Back Image:</strong><span id="previewGuardianAadhaarImg2"></span></p>
                    </div>
            
                    <!-- Tenant Documentation Preview -->
                    <div class="preview-block">
                        <h4>Tenant's Documentation</h4>
                        <p><strong>Aadhaar Number:</strong><span id="previewTenantAadhaarNo"></span></p>
                        <p><strong>Aadhaar Front Image:</strong> <span id="previewTenantAadhaarImg1"></span></p>
                        <p><strong>Aadhaar Back Image:</strong> <span id="previewTenantAadhaarImg2"></span></p>
                    </div>
            
                    <!-- Room Preference Preview -->
                    <div class="preview-block">
                        <h4>Room Preference</h4>
                        <p><strong>Room Type:</strong> <span id="previewRoomType"></span></p>
                        <p><strong>Floor:</strong> <span id="previewFloor"></span></p>
                        <p><strong>Meal Option:</strong> <span id="previewMealOption"></span></p>
                    </div>
            
                    <!-- Payment Details Preview -->
                    <div class="preview-block">
                        <h4>Payment Details</h4>
                        <p><strong>Hostel Admission Fees:</strong> <span id="previewAdmissionFee"></span></p>
                        <p><strong>Hostel Fees:</strong><span id="previewHostelFee"></span></p>
                        <p><strong>Mess Fees:</strong> <span id="previewMessFee"></span></p>
                        <p><strong>Caution Money:</strong> <span id="previewCautionMoney"></span></p>
                    </div>
                    
                    <div class="student-submit">
                         <button type="button" onclick="showEditForm()">Edit</button>
       
                    </div>

                    <form id="previewForm" method="post" action="SubmitFormServlet" onsubmit="submitFormData(event)">
    					<div class="student-submit">
        					<button id="previewForm" type="submit">Submit</button>
    					</div>
					</form>
                </div>
            </div>
    </div>    
    <div class="gallery">
        <div class="gallery-title"><h1>GALLERY</h1></div>
        <div class="gallery-box">
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
            <div class="inner-gallery"></div>
        </div>
    </div>



<footer>ALL RIGHTS RESERVED</footer>

<script>

//function validateForm() {
    //const studentName = document.getElementById("studentName").value;
    //if (!studentName) {
        //alert("Student name cannot be empty");
        //return false;
    //}
    //return true;
//}
    // Function to display the selected form and hide others
    function showForm(formId) {
        // Hide all forms
        var forms = document.querySelectorAll('.form-container');
        forms.forEach(function (form) {
            form.classList.remove('active');
        });

        // Show the selected form
        document.getElementById(formId).classList.add('active');
    }
    
    document.addEventListener("DOMContentLoaded", function() {
        // Your code here, including the previewData function
    	function previewData(event) {
            // Prevent the form from actually submitting
            event.preventDefault();
            
            // Get student details
            document.getElementById("previewName").textContent = document.getElementById("studentName").value;
            document.getElementById("previewBloodGroup").textContent = document.getElementById("bloodGroup").value;
            document.getElementById("previewContactNo").textContent = document.getElementById("contactNo").value;
            document.getElementById("previewEmergencyNo").textContent = document.getElementById("emergencyNo").value;
            document.getElementById("previewEmailId").textContent = document.getElementById("emailId").value;
            
            // Get residential address
            document.getElementById("previewAddressLine1").textContent = document.getElementById("addressLine1").value;
            document.getElementById("previewAddressLine2").textContent = document.getElementById("addressLine2").value;
            document.getElementById("previewPincode").textContent = document.getElementById("pincode").value;
            document.getElementById("previewDistrict").textContent = document.getElementById("district").value;
            document.getElementById("previewState").textContent = document.getElementById("state").value;
            document.getElementById("previewCountry").textContent = document.getElementById("country").value;
            
            
            
            // Get guardian details
            document.getElementById("previewGuardianName").textContent = document.getElementById("guardianName").value;
            document.getElementById("previewGuardianContactNo").textContent = document.getElementById("guardianContactNo").value;
            document.getElementById("previewGuardianRelationship").textContent = document.getElementById("guardianRelationship").value;
            document.getElementById("previewGuardianEmail").textContent = document.getElementById("guardianEmail").value;
            
            //Get guardian aadhaar details
            document.getElementById("previewGuardianAadhaarNo").textContent = document.getElementById("guardianAadhaarNo").value;
            document.getElementById("previewGuardianAadhaarImg1").textContent = document.getElementById("guardianAadhaarImg1").value;
            document.getElementById("previewGuardianAadhaarImg2").textContent = document.getElementById("guardianAadhaarImg2").value;
            
          	//Get Tenant aadhaar details
            document.getElementById("previewTenantAadhaarNo").textContent = document.getElementById("tenantAadhaarNo").value;
            document.getElementById("previewTenantAadhaarImg1").textContent = document.getElementById("tenantAadhaarImg1").value;
            document.getElementById("previewTenantAadhaarImg2").textContent = document.getElementById("tenantAadhaarImg2").value;
            
            // Get room preferences
            document.getElementById("previewRoomType").textContent = document.getElementById("roomPreference").value;
            document.getElementById("previewFloor").textContent = document.getElementById("floorPreference").value;
            document.getElementById("previewMealOption").textContent = document.querySelector('select[name="meal-preference"]').value;
            
            // Get payment details
            document.getElementById("previewAdmissionFee").textContent = document.getElementById("admissionFee").checked ? "Yes" : "No";
            document.getElementById("previewHostelFee").textContent = document.getElementById("hostelFee").checked ? "Yes" : "No";
            document.getElementById("previewMessFee").textContent = document.getElementById("messFee").checked ? "Yes" : "No";
            document.getElementById("previewCautionMoney").textContent = document.getElementById("cautionMoney").checked ? "Yes" : "No";
            
            // Show the preview section and hide the form sections (if needed)
            document.getElementById("form4").style.display = "block";
            document.getElementById("form1").style.display = "none";
            document.getElementById("form2").style.display = "none";
            document.getElementById("form3").style.display = "none";
            

            
            window.location.href = "Student.jsp";
        }

    });
  

    
    function submitFormData(event) {
        // Prevent default form submission
        event.preventDefault();

        // Gather data from the preview section
        const formData = new FormData();
        formData.append("studentName", document.getElementById("previewName").textContent);
        formData.append("bloodGroup", document.getElementById("previewBloodGroup").textContent);
        formData.append("contactNo", document.getElementById("previewContactNo").textContent);
        formData.append("emergencyNo", document.getElementById("previewEmergencyNo").textContent);
        formData.append("emailId", document.getElementById("previewEmailId").textContent);
        
        // Append residential address
        formData.append("addressLine1", document.getElementById("previewAddressLine1").textContent);
        formData.append("addressLine2", document.getElementById("previewAddressLine2").textContent);
        formData.append("pincode", document.getElementById("previewPincode").textContent);
        formData.append("district", document.getElementById("previewDistrict").textContent);
        formData.append("state", document.getElementById("previewState").textContent);
        formData.append("country", document.getElementById("previewCountry").textContent);
        
        // Append guardian details
        formData.append("guardianName", document.getElementById("previewGuardianName").textContent);
        formData.append("guardianContactNo", document.getElementById("previewGuardianContactNo").textContent);
        formData.append("guardianRelationship", document.getElementById("previewGuardianRelationship").textContent);
        formData.append("guardianEmail", document.getElementById("previewGuardianEmail").textContent);
        
        
        //Append guardian aadhar details
        formData.append("guardianAadhaarNo", document.getElementById("previewGuardianAadhaarNo").textContent);
        formData.append("guardianAadhaarImg1", document.getElementById("previewGuardianAadhaarImg1").textContent);
        formData.append("guardianAadhaarImg2", document.getElementById("previewGuardianAadhaarImg2").textContent);
        
      	//Append guardian aadhar details
        formData.append("tenantAadhaarNo", document.getElementById("previewTenantAadhaarNo").textContent);
        formData.append("tenantAadhaarImg1", document.getElementById("previewTenantAadhaarImg1").textContent);
        formData.append("tenantAadhaarImg2", document.getElementById("previewTenantAadhaarImg2").textContent);
        
        // Append room preferences
        formData.append("roomType", document.getElementById("previewRoomType").textContent);
        formData.append("floor", document.getElementById("previewFloor").textContent);
        formData.append("mealOption", document.querySelector('select[name="meal-preference"]').value);
        
        // Append payment details
        formData.append("admissionFee", document.getElementById("previewAdmissionFee").textContent);
        formData.append("hostelFee", document.getElementById("previewHostelFee").textContent);
        formData.append("messFee", document.getElementById("previewMessFee").textContent);
        formData.append("cautionMoney", document.getElementById("previewCautionMoney").textContent);

       
        // Use fetch to send data to the server
        fetch("SubmitFormServlet", {
            method: "POST",
            body: formData,
        })
        .then(response => response.text()) // or .json() based on your response type
        .then(data => {
            console.log("Success:", data);
            // Handle success (e.g., show a success message)
            window.location.href = "Student_Login_Dashboard.jsp";
        })
        .catch((error) => {
            console.error("Error:", error);
            // Handle error (e.g., show an error message)
           
        });
       
    }

    function showEditForm() {
        // Logic to show the form for editing the data
        // Example: document.getElementById("form1").style.display = 'block';
    }
    
        // document.getElementById("previewForm").submit();
    
    
    function showForm(formId) {
        // Hide all forms
        var forms = document.querySelectorAll('.form-container');
        forms.forEach(function (form) {
            form.style.display = 'none';
        });

        // Show the selected form
        document.getElementById(formId).style.display = 'block';
    }
    
</script>

</body>
</html>