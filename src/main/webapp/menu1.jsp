<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Meal Menu</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
            /* display: flex;
            justify-content: center;
            align-items: center; */
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
            gap: 9px; /* Adjust this value to control the space between the buttons */
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
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px; /* Adds space between the image and menu */
            width: 80%; /* Adjust width as needed */
            height: 425px;
            margin: 25px auto;
            padding: 40px 0 70px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
            background-color: skyblue;
            border-radius: 10px;
        }
        .menu-container {
            flex: 1; /* Makes the image and menu share equal width */
            padding: 20px;
            border-radius: 10px;
            /* box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */
            /* background-color: white; */
        }
        .background {
            flex: 1; /* Makes the image and menu share equal width */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .menu-container .background img{
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        img{
        	width:95%;
        	
        }
        .menu-section {
            margin-bottom: 20px;
        }
        .menu-section h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #4e4fbf;
        }
        .menu-items {
            background-color: #eaeaea;
            padding: 15px;
            border-radius: 8px;
            font-size: 18px;
        }
        .menu-items p {
            margin: 0;
            padding: 5px 0;
        }
        .menu-section button {
            margin-top: 10px;
            background-color: #4e4fbf;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .menu-section button:hover {
            background-color: #333;
            transform: translateY(-2px);
        }
        /* Modal styling */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }
        .modal-content h3 {
            margin-top: 0;
            color: #4e4fbf;
        }
        .modal-content textarea {
            width: 100%;
            height: 100px;
            border-radius: 5px;
            padding: 10px;
            margin-top: 10px;
            resize: none;
            border: 1px solid #ddd;
        }
        .modal-content button {
            background-color: #4e4fbf;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .modal-content button:hover {
            background-color: #333;
        }
        .close-btn {
            background-color: #dc3545;
            margin-right: 10px;
        }
    </style>
</head>
<body>
	<%
        // Get today's day of the week
        String[] days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
        Calendar calendar = Calendar.getInstance();
        String today = days[calendar.get(Calendar.DAY_OF_WEEK) - 1];

        // Set up database connection
        String url = "jdbc:mysql://localhost:3306/hostelmanagementsystem";
        String user = "root";
        String password = "Dhiraj@1234";

        String breakfast = "";
        String lunch = "";
        String dinner = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);
            String query = "SELECT breakfast, lunch, dinner FROM menu_schedule WHERE day_of_week = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, today);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                breakfast = rs.getString("breakfast");
                lunch = rs.getString("lunch");
                dinner = rs.getString("dinner");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
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
    <div class="background">
        <img src="asset/menu.svg" alt="">
    </div>
    <div class="menu-container">    
        <div class="menu-section">
            <h2>Breakfast</h2>
            <div class="menu-items" id="breakfast-items">
                <p><%= breakfast %></p>
            </div>
            <button onclick="openModal('Breakfast', 'breakfast-items')">Update</button>
        </div>
        
        <div class="menu-section">
            <h2>Lunch</h2>
            <div class="menu-items" id="lunch-items">
                <p><%= lunch %></p>
            </div>
            <button onclick="openModal('Lunch', 'lunch-items')">Update</button>
        </div>
        
        <div class="menu-section">
            <h2>Dinner</h2>
            <div class="menu-items" id="dinner-items">
                <p><%= dinner %></p>
            </div>
            <button onclick="openModal('Dinner', 'dinner-items')">Update</button>
        </div>
    </div>
    
</div>    
    

    <!-- Modal -->
    <div class="modal" id="modal">
        <div class="modal-content">
            <h3>Edit <span id="meal-type"></span> Meal</h3>
            <textarea id="meal-input" placeholder="Enter new meal details..."></textarea>
            <div>
                <button class="close-btn" onclick="closeModal()">Close</button>
                <button onclick="saveMeal()">Save</button>
            </div>
        </div>
    </div>

    <script>
    const modal = document.getElementById('modal');
    const mealInput = document.getElementById('meal-input');
    const mealTypeSpan = document.getElementById('meal-type');
    let currentMealType = '';
    let currentMealId = '';
    const today = "<%= today %>"; 

    function openModal(mealType, mealId) {
        currentMealType = mealType;
        currentMealId = mealId;
        mealTypeSpan.textContent = mealType;

        const mealContent = document.getElementById(mealId).querySelector('p').textContent.trim();
        mealInput.value = mealContent;
        modal.style.display = 'flex';
    }

    function saveMeal() {
        const newMeal = mealInput.value.trim();
        if (newMeal) {
            document.getElementById(currentMealId).querySelector('p').textContent = newMeal;
            closeModal();

            // Send updated data to server
            fetch('update_menu.jsp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: "day=" + encodeURIComponent(today) + "&mealType=" + encodeURIComponent(currentMealType) + "&mealContent=" + encodeURIComponent(newMeal)
            })
            .then(response => response.text())
            .then(data => console.log("Update successful:", data))
            .catch(error => console.error("Error updating meal:", error));
        } else {
            alert('Please enter meal details before saving.');
        }
    }

    function closeModal() {
        modal.style.display = 'none';
        mealInput.value = '';
    }
    </script>
</body>
</html>
