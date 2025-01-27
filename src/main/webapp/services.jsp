<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Services</title>
<link rel="stylesheet" href="services.css">
<link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>

</head>
<body>
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
            
            <!-- Notification Dropdown -->
            <div class="dropdown">
                <a href="#" class="notfication"><i class="ri-notification-3-fill"></i></a>
                <div class="dropdown-content">
                    <h1 class="noti-title">Notifications</h1>
                    <div class="messeges">

                        <div class="noti-1">Last Date to pay hostel fees is 31/12/24 for odd semesters </div>
                        
                        <div class="noti-2">Your service request was completed yesterday. Head to the ticket section to provide your feedback</div>
                        <div class="noti-3">Your mess has been turned off from 7/10/24 till 17/10/24 for puja holidays</div>
                    </div>
                    <div class="clear">
                        <a href=""><h3>Clear Notification</h3></a>
                    </div>
                </div>
            </div>
        </div>
        <button onclick="logout()" style="background: #4e4fbf; color: white; padding: 10px 15px; border: none; border-radius: 5px; cursor: pointer; transition: background 0.3s;">Logout</button>
    </div>
    <div id="services">
        <h2>Choose the Services</h2>
        <div class="services-list">

            <div class="service"><a href="ticket2.jsp"><img style="height: 100%; width: 100%; border-radius: 10px; " src='asset/wash-service.webp' alt="error"></a></div>
            <div class="service"><a href="ticket1.jsp"><img style="height: 100%; width: 100%; border-radius: 10px; " src="asset/electrician.jpg" alt=""></a></div>
            <div class="service"><a href="ticket3.jsp"><img style="height: 100%; width: 100%; border-radius: 10px;" src="asset/plumbing-man.jpg" alt=""></a></div>
            <div class="service"><a href="ticket4.jsp"><img style="height: 100%; width: 100%; border-radius: 10px;" src="asset/sweeper.jpg" alt=""></a></div>
        </div>
        <a class="service-back" href="Student_Login_Dashboard.jsp">Back</a>
    </div>
</body>
</html>