<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room</title>
    <!-- <link rel="stylesheet" href="styles.css"> -->
     <style>
    body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
             /* display: flex; */
            justify-content: center;
            align-items: center; 
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
 
        .background {
            flex: 1; /* Makes the image and menu share equal width */
            display: flex;
            justify-content: center;
            align-items: center;
        }

.container {
    
            justify-content: center;
            align-items: center;
            gap: 20px; /* Adds space between the image and menu */
            width: 50%; 
            max-width: 428px; /* Ensures it doesn’t get too wide */
            /* Adjust width as needed */
            height: 430px;
            margin: 62px auto;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
            background-color: skyblue;
            border-radius: 10px;
}

h1 {
    background: #4e4fbf;
    /* width: 90%; */
    color: whitesmoke;
    padding: 10px;
    font-size: 34px;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.btn-add {
    background-color: #28a745;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
}

.btn-add:hover {
    background-color: #218838;
}

.room-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.room-table th, .room-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    /* padding-left: 1%; */
    width: 90%;
}

.form-group input, .form-group select {
    width: calc(100% - 20px);
    height: 50px;
    padding: 8px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.btn-submit, .btn-reset {
    padding: 10px 15px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

.btn-submit {
    background-color: #28a745;
    color: white;
    padding: 20px;
}

.btn-reset {
    background-color: #dc3545;
    color: white;
    margin-left: 10px;
    padding: 20px;
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
            <button><a href="rooms.jsp">Back</a></button>
        </div>
    </div>
    <div class="container">
        <h1>Add Rooms</h1>
        <form id="addRoomForm">
            <div class="form-group">
                <label for="roomNumber">Room Number</label>
                <input type="text" id="roomNumber" placeholder="Enter Room Number" required>
            </div>
            <div class="form-group">
                <label for="seater">Seater</label>
                <select id="seater" required>
                    <option value="" disabled selected>Select Seater...</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fees">Total Fees</label>
                <input type="number" id="fees" placeholder="Enter Total Fees" required>
            </div>
            <button type="submit" class="btn-submit">Insert</button>
            <button type="button" class="btn-reset" onclick="cancelForm()">Cancel</button>
        </form>
    </div>

    <script>
    document.getElementById('addRoomForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const roomNumber = document.getElementById('roomNumber').value;
        const seater = document.getElementById('seater').value;
        const fees = document.getElementById('fees').value;

        const newRoom = {
            roomNumber,
            seater,
            fees
        };

        let rooms = JSON.parse(localStorage.getItem('rooms')) || [];
        rooms.push(newRoom);
        localStorage.setItem('rooms', JSON.stringify(rooms));

        window.location.href = 'rooms.jsp'; // Adjust path if necessary
    });
    function logout() {
        // Implement your logout functionality here
        alert('Logging out...');
        window.location.href = 'login.jsp'; // Example redirect to login
    }
    </script>
</body>
</html>