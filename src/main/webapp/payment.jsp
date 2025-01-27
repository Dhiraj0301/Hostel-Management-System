<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
<style type="text/css">
	* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  body {
    background: linear-gradient(to top, rgb(2, 108, 150), white);
    /* background: white; */
    margin:0;
  
  }
   .header {
    /* border: 2px solid red; */
    /*padding: 0 5%;
    position: sticky;
    top: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 80px;
    background-color: rgb(2, 108, 150);
    color: black;
    box-shadow: 0px 0px 20px rgba(16, 17, 17, 0.5);*/
    
    background-color: rgb(92, 169, 199);
    padding:  15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #fff;
  }
  .header h2 {
            margin: 0;
            font-size: 24px;
  }
  .header .header-logo {
            display: flex;
            align-items: center;
  }
  .header .header-logo img {
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
  
  .header .header-anchor {
    /* margin: 0 6%; */
    /* width: 70px; */
    /* border: 2px solid white; */
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 2px;
    height: 40px;
    /* background-color: white; */
    background-color: transparent;
    text-decoration: none;
    color: black;
    font-weight: bolder;
  }
  
  .header .header-anchor a {
    text-decoration: none;
    padding: 8px 20px;
    /* background: rgb(43, 41, 41); */
    color: rgb(19, 19, 27);
    border-radius: 4px;
  
  }
  
  .header .header-anchor i {
    font-size: 25px;
  }
  
  .header .header-anchor a:link {
    text-decoration: none;
    color: black;
  }
  
  .header .header-anchor a:hover {
    /* color: red; */
    color: rgb(224, 145, 145);
  }
  .dropdown {
    position: relative;
    display: inline-block;
  }
  
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 400px;
    /* Increased the size to 400px */
    min-height: 300px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    right: 0;
    /* Align to the right of the dropdown parent */
    transform: translateX(0);
    /* Adjust the dropdown position to stay inside the viewport */
    background-color: rgb(44, 118, 148);
    border-radius: 25px;
  }
  
  .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
  }
  
  .dropdown-content a:hover {
    background-color: #f1f1f1;
  }
  
  .dropdown:hover .dropdown-content {
    display: block;
  }
  .noti-title {
    padding: 10px;
    color: white;
  }
  
  .noti-1,
  .noti-2,
  .noti-3 {
    height: auto;
    width: 90%;
    background-color: white;
    color: black;
    margin: 10px;
    border-radius: 35px;
    padding: 9px;
  }
  
  .clear {
    margin-top: 20px;
    margin-left: 90px;
    height: 50px;
    width: 200px;
    border: 5px solid black;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
    background-color: white;
    color: rgb(44, 118, 148);
  }

.menu-card{
    height: 90vh;
    width: 100vw;
  }
.menu-card h1{
    margin-top: 30px;
    font-size: 40px;
    font-style: italic;
  }
.menu-card ,.menu-container,a{
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}  
.menu-container{
      border: 5px solid black;
      padding: 10px;
    height: 550px;
    width: 30%;
    background-color:white;
    border-radius: 15px;
    margin-top: 20px;
    box-shadow: 0px 0px 20px rgba(16, 20, 17, 0.7);
  }
  .svg-image{
    height: 35%;
    width: 90%;
    margin-bottom: 10px;
  }
  .menu-container h4{
    /* margin-top: 10px; */
    font-size: 25px;
    /* margin-bottom: 20px; */
  }
  .menu-box{
    display:flex ;
    align-items: center;
    justify-content: space-between;
    gap:30px ;

  }
  .back-button{
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
  }
  .back-button a{
    text-decoration: none;
    color: white;
    background-color: rgb(44, 118, 148) ;
    margin-top: 20px;
    height: 50px;
    width: 130px;
    font-size: 30px;
    border-radius: 8px;
    
  }
</style>
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
        <button onclick="logout()"  style="background: #4e4fbf; color: white; padding: 10px 15px; border: none; border-radius: 5px; cursor: pointer; transition: background 0.3s;">Logout</button>
    </div>
    <div class="menu-card">
        <h1>Payment</h1>
        <div class="menu-container">
            <img src="asset/payment.svg" alt="" class="svg-image">
            <div class="menu-box">
                
                <div class="service-id">
                    <div ><h4>Mees Fee</h4><p>Rs.4000</p></div>
                    <div ><h4>Hostel Fee</h4><p>Rs.3000</p></div>
                    <div ><h4>Laundry Fee</h4><p>Rs.700</p></div>      
                    <div ><h4>Service Charge</h4><p>Rs.500</p></div>            
                </div>
                
                <div class="service-date">
                    <div ><p><input type="checkbox"></p></div>
                    <div ><br><p><input type="checkbox"></p></div>
                    <div ><br><p><input type="checkbox"></p></div>
                    <div ><br><p><input type="checkbox"></p></div>
                </div>
            </div>
            <div class="back-button">
    
                <div><a href="">Pay Now</a></div>
                <div><a href="Student_Login_Dashboard.jsp">Back</a></div>
            </div>
        </div>
        <!-- <a href="student_login _dasboard.html">Back</a> -->
    </div>
</body>
</html>