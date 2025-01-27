<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel - Hostel Management</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
<style>
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
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 26px;
            padding: 46px;
            justify-content: center;
            /* background-color: rgb(60, 145, 179); */
        }
        .card {
            background: rgb(204, 226, 230);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 248px;
            height: 288px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            /* gap: 20px; */
            /* flex-direction: column;
            justify-content: flex-start;
            padding: 10px; */
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card img {
            width: 100%;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            height: 215px;
            object-fit: contain;
        }
        .cards-container .card a{
            /* margin-top: 50px; */
            /* color: rgb(92, 169, 199); */
            font-size: 25px;
            text-decoration: none;
            color: inherit;
            /* font-weight:bold; */
            /* margin-right: 10px; */
            
            /* padding: 0%; */
            /* gap: 20px; */
            /* display: block; */
            /* display: block; */
        }
        .card p {
            padding: 0 15px 20px;
            color: #777;
        }
        .content {
            display: none;
            padding: 20px;
        }
        .content.active {
            display: block;
        }
        .footer{
            background: skyblue;
            height: 50px;
            padding: 0.5%;
        }
        .footer p{
            display: flex;
            align-items: center;
            justify-content: center;
        }
</style>
</head>
<body>
	<div class="header">
        <div class="logo">
            <img src="https://cdn.vectorstock.com/i/500p/37/06/hostel-bed-on-mark-vector-19713706.avif" alt="Hostel Logo"> <!-- Replace with your logo image -->
            <h2>Hostel Management</h2>
        </div>
        <button onclick="logout()"><a href="main.jsp">Logout</a></button>
    </div>

    <div class="cards-container">
     	<!--    <div class="card">
            <img src="asset/dashboard.svg" alt="Dashboard">
            <h3><a href="dashboard.jsp">Dashboard</a></h3>
            <!-- <h3>Dashboard</h3>
        </div>    -->
        <div class="card"  onclick="showContent('service-request')">
            <img src="asset/service.svg" alt="Service Request"> 
            <h3><a href="admin_service.jsp">Service Request</a></h3>
        </div>
        <div class="card" onclick="showContent('view-student')">
            <img src="asset/student.svg" alt="View Student Account"> 
            <h3><a href="viewStudentAccount.jsp">View Student Account</a></h3>
        </div>
        <div class="card" onclick="showContent('manage-rooms')">
            <img src="asset/room.svg" alt="Manage Rooms"> 
            <h3><a href="rooms.jsp">Manage Rooms</a></h3>
        </div>
        <div class="card" >
            <img src="asset/menu.svg" alt="Manage Menu"> 
            <h3><a href="menu1.jsp">Manage Menu</a></h3>
        </div>
        <div class="card" onclick="showContent('complaint-box')">
            <img src="asset/complain.svg" alt="Complaint Box"> 
            <h3><a href="complainBox.jsp">Complaint Box</a></h3>
        </div>
        <div class="card" onclick="showContent('notification')">
            <img src="asset/notification.svg" alt="Notification"> 
            <h3><a href="notification.jsp" >Notification</a></h3>
        </div>
    </div>

    <div id="dashboard" class="content" >
        <h2>Dashboard</h2>
        <p>Welcome to the dashboard overview.</p>
    </div>
    <div id="service-request" class="content">
        <h2>Service Request</h2>
        <p>Details of service requests will be shown here.</p>
    </div>
    <div id="view-student" class="content">
        <h2>View Student Accounts</h2>
        <p>Student account information will be shown here.</p>
    </div>
    <div id="manage-rooms" class="content">
        <h2>Manage Rooms</h2>
        <p>Room management options will be displayed here.</p>
    </div>
    <div id="manage-menu" class="content">
        <h2>Manage Menu</h2>
        <p>Menu management details will be shown here.</p>
    </div>
    <div id="complaint-box" class="content">
        <h2>Complaint Box</h2>
        <p>Complaints submitted by students will be displayed here.</p>
    </div>
    <div id="notification" class="content">
        <h2>Notification</h2>
        <p>All notifications will be shown here.</p>
    </div>
    <!-- footer -->
     <div class="footer">
        <p>&copy;Copyright: All Right Reserved</p>
     </div>
    <script>
        // function showContent(sectionId) {
        //     const sections = document.querySelectorAll('.content');
        //     sections.forEach(section => section.classList.remove('active'));
        //     document.getElementById(sectionId).classList.add('active');
        // }

        function logout() {
            alert('Logging out...');
            // Add actual logout logic here
        }
    </script>
</body>
</html>