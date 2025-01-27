<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rooms Management</title>
    <link
    href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
    rel="stylesheet"/>
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
            height: 80vh;
            margin: 25px auto;
            background-color: skyblue;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            visibility: visible; /* Ensure it is not hidden */
    opacity: 1; /* Ensure it is fully opaque */
        }

        .container h2 {
            margin-bottom: 20px;
            color: #333;
            padding: 10px;
            font-size: 34px;
            background: #4e4fbf;
            color: whitesmoke;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-add {
            background: #4a4ab2;
            color: #fff;
            padding: 20px;
            border: none;
            font-size: medium;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 20px;
            width: 100%;
        }

        .btn-add:hover {
            background: yellow;
            color: black;
        }

        .rooms-table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
        }

        .rooms-table th, .rooms-table td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
            font-size: 16px;
            color:black;
        }

        .rooms-table th {
            background-color: #4e4fbf;
            color: #fff;
        }

        .rooms-table tr:hover {
            background-color: #f1f1f1;
        }
	
        .rooms-table .btn-edit, .rooms-table .btn-delete {
            background: #4a4ab2;
            color: #fff;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .rooms-table .btn-delete {
            background: #dc3545;
        }
		        #room-list-body td{
		    color:black;
		}

        .rooms-table .btn-edit:hover, .rooms-table .btn-delete:hover {
            background: #333;
        }
        
        tbody#room-list-body tr {
    border: 1px solid red;
    background-color: lightyellow;
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
        <section id="manage-rooms" class="content-section">
            <h2>Rooms Management</h2>
            <button class="btn-add" id="btn-add-room" onclick="toggleRoomForm()">Add New Room Details</button>
            <div id="room-list-container">
                <table class="rooms-table" id="room-list">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Room No.</th>
                            <th>Seater</th>
                            <th>Fees Per Month</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="room-list-body"  style="color:black;">
                        <!-- Rows will be dynamically added here -->
                    </tbody>
                </table>
                <p id="no-rooms-message" style="display: none;">No rooms available.</p>
            </div>
        </section>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const roomListBody = document.getElementById('room-list-body');
        let rooms = JSON.parse(localStorage.getItem('rooms')) || [];
		
        console.log("Loaded rooms:", rooms);
        // Sample data (can be removed after testing)
        if (rooms.length === 0) {
            rooms = [
                { roomNumber: '101', seater: '2', fees: '5000' },
                { roomNumber: '102', seater: '3', fees: '7000' }
            ];
            localStorage.setItem('rooms', JSON.stringify(rooms));
        }

        function renderRooms() {
        	console.log("Rendering rooms:", rooms);
            roomListBody.innerHTML = '';
            if (rooms.length === 0) {
                document.getElementById("no-rooms-message").style.display = "block";
            } else {
                document.getElementById("no-rooms-message").style.display = "none";
                rooms.forEach((room, index) => {
                	 console.log(`Rendering Room ${index + 1}:`, room); 
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${index + 1}</td>
                        <td>${room.roomNumber || 'n/a'}</td>
                        <td>${room.seater || 'n/a'}</td>
                        <td>${room.fees || 'n/a'}</td>
                        <td>
                        	<button class="btn-edit" onclick="editRoom(${index})"><i class="ri-pencil-fill"></i></button>
                            <button class="btn-delete" onclick="deleteRoom(${index})"><i class="ri-delete-bin-fill"></i></button>
                        </td>
                    `;
                    roomListBody.appendChild(row);
                    console.log("Appending row:", row.innerHTML);
                });
            }
            console.log("Final table body content:", roomListBody.innerHTML);
        }
		
        // Function to edit a room
        window.editRoom = function(index) {
            const room = rooms[index];
            if (!room) {
                alert("Room data not found. Please try again.");
                return;
            }
            
            const newRoomNumber = prompt("Enter new Room Number:", room.roomNumber);
            const newSeater = prompt("Enter new Seater:", room.seater);
            const newFees = prompt("Enter new Fees Per Month:", room.fees);

            if (newRoomNumber && newSeater && newFees) {
                rooms[index] = {
                    roomNumber: newRoomNumber,
                    seater: newSeater,
                    fees: newFees
                };
                localStorage.setItem('rooms', JSON.stringify(rooms));
                renderRooms();
            }
        };

        
     // Function to delete a room
        window.deleteRoom = function(index) {
            if (confirm("Are you sure you want to delete this room?")) {
                rooms.splice(index, 1);
                localStorage.setItem('rooms', JSON.stringify(rooms));
                renderRooms();
            }
        };

        window.toggleRoomForm = function() {
            window.location.href = 'addRooms.jsp';
        };

        window.logout = function() {
            alert('Logging out...');
            window.location.href = 'login.jsp';
        };

        renderRooms();
    });
    </script>
</body>
</html>
