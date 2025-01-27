<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComplainBox</title>
<style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            margin-top: 20px;
        }
        .complaint-card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 20px;
            position: relative;
            overflow: hidden;
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.6s forwards;
        }
        .complaint-card img{
            width: 100%;
            overflow-clip-margin: content-box;
            overflow: clip;
        }
        .complaint-card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transform: translateY(-5px);
            transition: all 0.3s ease-in-out;
        }
        .complaint-card h3 {
            margin-top: 0;
            font-size: 20px;
            color: #333;
        }
        .complaint-card p {
            font-size: 16px;
            color: #555;
            margin: 10px 0;
        }
        .complaint-card .date {
            font-size: 14px;
            color: #888;
        }
        .btn-resolve {
            background: #4a90e2;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            text-align: center;
        }
        .btn-resolve:hover {
            background: #357abd;
        }
        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Complaint Box Form */
        .complaint-form {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            padding: 20px;
            margin-top: 20px;
            animation: fadeIn 1s ease-in-out;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .complaint-form textarea {
            width: 96%;
            height: 100px;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            resize: none;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .complaint-form textarea:focus {
            border-color: rgb(92, 169, 199);
            outline: none;
        }

        .complaint-form button {
            background: rgb(92, 169, 199);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }

        .complaint-form button:hover {
            background: #357abd;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
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
            <button onclick="logout()"><a href="login.jsp">Logout</a></button>
            <button><a href="Student_Login_Dashboard.jsp">Back</a></button>
        </div>
    </div>
    <div class="container" id="complaint-list">
        <!-- Sample complaint cards -->
        <div class="complaint-card">
            <img src="asset/Water Supply.svg" alt="">
            <h3>Water Issue</h3>
            <p>The water supply in Room 202 has been inconsistent for the past week.</p>
            <p class="date">Filed on: 2024-10-19</p>
            <button class="btn-resolve">Mark as Resolved</button>
        </div>
        <div class="complaint-card">
            <img src="asset/wifi.svg" alt="">
            <h3>WiFi Connectivity</h3>
            <p>WiFi connection is very weak in the study hall area.</p>
            <p class="date">Filed on: 2024-10-18</p>
            <button class="btn-resolve">Mark as Resolved</button>
        </div>
        <div class="complaint-card">
            <img src="asset/noise.svg" alt="">
            <h3>Noise Disturbance</h3>
            <p>There's constant noise from Room 305 late at night, making it hard to sleep.</p>
            <p class="date">Filed on: 2024-10-17</p>
            <button class="btn-resolve">Mark as Resolved</button>
        </div>
    </div>

    <!-- Complaint Form -->
    <div class="container">
        <form class="complaint-form" id="complaintForm">
            <h3>Submit a New Complaint</h3>
            <textarea placeholder="Write your complaint here..."></textarea>
            <button type="submit">Send Complaint</button>
        </form>
    </div>

    <script>
        document.getElementById('complaintForm').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Your complaint has been submitted successfully!');
            // Here, you can implement the logic to send the complaint to the server
        });
    </script>
</body>
</html>