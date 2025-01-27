<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
    <!-- <link rel="stylesheet" href="styles.css"> -->
<style>
    
    body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
            min-height: 100vh;
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
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.greeting {
    font-size: 24px;
    margin-bottom: 20px;
}

.card-container {
    display: flex;
    gap: 10px;
    margin-bottom: 30px;
    justify-content: space-between;
    flex-wrap: wrap;
}

.card {
    background-color: rgb(109, 189, 221);
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 30px;
    width: 23%;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.card h3 {
    font-size: 30px;
    margin: 0;
    color: #333;
}

.card p {
    font-size: 14px;
    color: #666;
    margin-top: 10px;
}

.icon {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 20px;
    color: #888;
}

.user-icon::before {
    content: '\1F464'; /* Unicode for user icon */
}

.rooms-icon::before {
    content: '\1F3E2'; /* Unicode for building icon */
}

.booked-icon::before {
    content: '\1F4CB'; /* Unicode for clipboard icon */
}

.courses-icon::before {
    content: '\1F4D6'; /* Unicode for book icon */
}

.table-container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

thead {
    background-color: rgb(92, 169, 199);
}

thead th {
    text-align: left;
    padding: 10px;
    font-weight: bold;
}

tbody td {
    padding: 10px;
    border-top: 1px solid #e0e0e0;
}

tbody tr:hover {
    background-color: #f9f9f9;
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
    <div class="container">
        <h2 class="greeting">Good Morning, admin!</h2>
        
        <div class="card-container">
            <div class="card">
                <h3>9</h3>
                <p>Registered Students</p>
                <i class="icon user-icon"></i>
            </div>
            <div class="card">
                <h3>9</h3>
                <p>Total Rooms</p>
                <i class="icon rooms-icon"></i>
            </div>
            <div class="card">
                <h3>8</h3>
                <p>Booked Rooms</p>
                <i class="icon booked-icon"></i>
            </div>
            <div class="card">
                <h3>9</h3>
                <p>Featured Courses</p>
                <i class="icon courses-icon"></i>
            </div>
            <div class="card">
                <h3>6</h3>
                <p>Featured Meal</p>
                <i class="icon courses-icon"></i>
            </div>
            <div class="card">
                <h3>9</h3>
                <p>Featured Courses</p>
                <i class="icon courses-icon"></i>
            </div>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Student's Email</th>
                        <th>Last Activity</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>teststudent@mail.com</td>
                        <td>2023-11-09 17:00:49</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>teststudent@mail.com</td>
                        <td>2023-11-09 16:59:18</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>teststudent@mail.com</td>
                        <td>2023-11-09 16:57:38</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>