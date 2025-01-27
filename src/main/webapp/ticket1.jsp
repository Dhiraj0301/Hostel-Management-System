<%@ page import="java.util.Random"  %>
<%@ page import="java.time.LocalDate"  %>
<%@ page import="java.time.format.DateTimeFormatter"  %>
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
<title>ticket1</title>

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
    padding: 15px;
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

.card{
    height: 90vh;
    width: 100vw;
  }
.card h1{
    margin-top: 30px;
    font-size: 40px;
    font-style: italic;
  }
.card ,.ticket-container,a{
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}  
.ticket-container{
      /* border: 5px solid black; */
    height: 450px;
    width: 30%;
    background-color:white;
    border-radius: 15px;
    margin-top: 20px;
    box-shadow: 0px 0px 20px rgba(16, 20, 17, 0.7);
  }
  .svg-image{
    height: 60%;
    width: 60%;
  }
  .ticket-container h3{
    margin-top: 10px;
    font-size: 30px;
    margin-bottom: 20px;
  }
  .service-requirement{
    display:flex ;
    align-items: center;
    justify-content: space-between;
    gap:30px ;

  }
  .card a{
    text-decoration: none;
    color: black;
    background-color: white;
    margin-top: 20px;
    height: 50px;
    width: 130px;
    font-size: 30px;
    border-radius: 8px;
    
  }
  .submit-service button {
        background-color: skyblue;
        border: none;
        color: white;
        padding: 10px 20px;
        font-size: 20px;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
    }

    .submit-service button:hover {
        background-color: deepskyblue;
        transform: translateY(-5px);
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
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
            <div class="home-buttom"><a href="Student_Login_Dashboard.jsp"><i class="ri-home-3-fill"></i></a></div>            <div class="services"><a href="#services"><i class="ri-user-voice-fill"></i></a></div>
            <div class="menu"><a href=""><i class="ri-restaurant-fill"></i></a></div>
            <div class="payment"><a href=""><i class="ri-money-rupee-circle-fill"></i></a></div>
            
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
    <div class="card">
        <h1>Your Ticket</h1>
        <div class="ticket-container">
            <img src="asset/electrician.jpg" alt="" class="svg-image">
            <h3>Electrician Needed</h3>
            <div class="service-requirement">
                
                <div class="seervice-id">
                    <div >Ticket Id</div>
                    <div >Generated on </div>
                    <div >Expected to be done by</div>             
                </div>
                
                <div class="service-date">
                    <div >
                    	<!-- Use Java to generate a random ticket ID -->
                    	<%
                            Random rand = new Random();
                            int ticketId = 100000 + rand.nextInt(900000); // Generates a 6-digit random number
                            out.println(ticketId);
                        %>
                    </div>
                    <div >
                    	<!-- Use Java to display the current date -->
                        <%= LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yy")) %>
                    </div>
                    <div >
                    	<!-- Use Java to display a future date, e.g., 1 day after the current date -->
                        <%= LocalDate.now().plusDays(1).format(DateTimeFormatter.ofPattern("dd/MM/yy")) %>
                    </div>
                </div>
            </div>
        </div>
        <div class="submit-service">
        	<form action="<%= request.getContextPath() %>/SubmitRequestServlet" method="post">
   			 <input type="hidden" name="serviceType" value="Electrician"> <!-- Example: Electrician -->
    	     <button type="submit">Submit Request</button>
    	     
            </form>
        </div>
        <a href="services.jsp">Back</a>
    </div>
</body>
</html>