<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
<link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<body>
	<!-- Navbar -->
    <nav class="navbar" style="height: 50px;">
        <div class="logo">
            <img src="https://www.shutterstock.com/shutterstock/photos/727553260/display_1500/stock-vector-hostel-logo-hotel-logo-travel-rest-place-vector-illustration-727553260.jpg" alt="Logo">
        </div>
        <ul class="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About Us</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#contact">Contact Us</a></li>
        </ul>
    </nav>

    <!-- Background Section -->
    <section class="Background" id="home">
        
        <div class="Background-content"></div>
            <h1>Welcome to Our Hostel</h1>
            <p>Your journey begins here.</p>
        </div>
        <div class="login-cards" style="margin-bottom: 100px">
            <div class="card login-card">
                <i class="ri-graduation-cap-fill"></i>
                <h3>Student panel</h3>
                <a href="login.jsp">Login</a>
            </div>
            <div class="card login-card">
                <i class="ri-user-settings-fill"></i>
                <h3>Admin panel</h3>
                <a href="admin.jsp">Login</a>
            </div>
        
    </section>

    <!-- services section -->
    <section class="services" id="services">
        <h1>Our Services</h1>
        <div class="card-container">
            <div class="card">
                <img src="https://cdn.pixabay.com/photo/2016/06/26/18/00/icon-1480926_1280.png" alt="">
                <h3>Wi-Fi</h3>
                <p>High-speed internet available throughout the premises.</p>
            </div>
            <div class="card">
                <img src="https://cdn.pixabay.com/photo/2018/03/01/17/36/room-3191241_1280.jpg" alt="">
                <h3>Furnished Room</h3>
                <p>Well-equipped and furnished rooms for comfort and convenience.</p>
            </div>
            <div class="card">
                <img src="https://cdn.pixabay.com/photo/2016/08/04/17/12/bread-1569541_1280.png" alt="">
                <h3>Canteen</h3>
                <p>Enjoy delicious meals in our well-maintained canteen.</p>
            </div>
            <div class="card">
                <img src="https://cdn.pixabay.com/photo/2022/08/19/05/19/janitor-7396138_1280.png" alt="">
                <h3>Housekeeping</h3>
                <p>Regular cleaning and maintenance services for a tidy environment.</p>
            </div>
            <div class="card">
                <img src="https://image2.jdomni.in/banner/22062022/19/D3/E2/3A42C85A2386370F123F3B3108_1655900163162.jpg?output-format=webp" alt="">
                <h3>Warden</h3>
                <p>On-site warden available for student support and assistance.</p>
            </div>
            <div class="card">
            	<img src="https://img.freepik.com/premium-vector/police-officer-with-gun-vector-illustration-flat-cartoon-style_106788-2661.jpg?ga=GA1.1.494754234.1694440942&semt=ais_hybrid" alt="">
                <h3>Watchmen</h3>
                <p>24/7 security with vigilant watchmen for your safety.</p>
            </div>
        </div>
    </section>

    <!-- About Us Section -->
    <section class="about-us" id="about">
        <div class="about-content">
            <h1>About Us</h1>
            <p>We are committed to providing the best services and facilities to ensure a comfortable and secure environment. Our team is dedicated to making your stay enjoyable with top-notch amenities and round-the-clock support.</p>
        </div>
    </section>

    <!-- Contact Us Section -->
    <section class="contact-us" id="contact">
        <h1>Contact Us</h1>
        <div class="contact-box">
            <div class="contain">
                <i class="ri-map-pin-fill"></i>
                <h4>Our office address!</h4>
                <p>Asansol-713303</p>
            </div>
            <div class="contain">
                <i class="ri-mail-unread-fill"></i>
                <h4>Gmail Enquiries!</h4>
                <p>myhostel@gmail.com</p>
            </div>
            <div class="contain">
                <i class="ri-phone-fill"></i>
                <h4>Call us!</h4>
                <p>+91-22774432</p>
            </div>
            <div class="contain">
                <i class="ri-calendar-schedule-fill"></i>
                <h4>Our Timings!</h4>
                <p>Mon - Sun : 10:00 AM - 07:00 PM</p>
            </div>
        </div>
        

        <form action="#">
            <div class="form-row">
                <div class="form-group">
                    <label for="name"></label>
                    <input type="text" id="name" name="name" placeholder="Name" required>
                </div>
                <div class="form-group">
                    <label for="email"></label>
                    <input type="email" id="email" name="email" placeholder="Email" required>
                </div>
            </div>
            <div class="form-group">
                <label for="message"></label>
                <textarea id="message" name="Message" rows="4"placeholder="Message" required></textarea>
            </div>
            <button type="submit">Send</button>
        </form>
    </section>

    <!-- Footer Section -->
    <footer class="footer">
        <p>&copy; 2024 Your Company. All Rights Reserved.</p>
    </footer>
</body>
</html>