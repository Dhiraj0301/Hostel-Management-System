<%@ page import="jakarta.servlet.*"%>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="Register.css">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet">
</head>
<body>
	<div class="container" style="margin-top:20px;">
		<div class="background"></div>
		<form id="regform" action='Register.jsp' method='post'
			onsubmit="return validateForm()">
			<div class="title">
				<h2>Register</h2>
			</div>
			<div class="form-field">
				<i class="ri-user-4-fill"></i> <input type="text" name='fullname'
					placeholder="Fullname">
			</div>
			<div class="form-field">
				<i class="ri-user-fill"></i> <input type="email" name='username'
					placeholder="Email Address">
			</div>
			<div class="form-field">
				<i class="ri-phone-fill"></i> <input type="number" name='contact'
					placeholder="Contact No">
			</div>
			<div class="form-field">
				<i class="ri-lock-2-fill"></i> <input type="password" name='pwd'
					placeholder="Password">
			</div>
			<div class="form-field">
				<i class="ri-lock-2-fill"></i> <input type="password" name='cnf'
					placeholder="Confirm password">
			</div>
			<div class='button-field'>
				<input type='submit' value='Register'>
			</div>
			<p>
				Already have an account? <a href='login.jsp'>Click here</a> to go to
				the login page.
			</p>
		</form>
	</div>

	<%
	String fullname = request.getParameter("fullname");
	String username = request.getParameter("username");
	String contact = request.getParameter("contact");
	String pwd = request.getParameter("pwd");
	String cnf = request.getParameter("cnf");

	if (fullname != null && username != null && contact != null && pwd != null && cnf != null) {
		out.println("Fullname: " + fullname + "<br>");
		out.println("Username: " + username + "<br>");
		out.println("Contact: " + contact + "<br>");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root",
			"Dhiraj@1234");

			String sql1 = "INSERT INTO register (Fullname, Username, ContactNo) VALUES (?, ?, ?)";
			PreparedStatement stmt1 = con.prepareStatement(sql1);
			stmt1.setString(1, fullname);
			stmt1.setString(2, username);
			stmt1.setString(3, contact);
			stmt1.executeUpdate();

			String sql2 = "INSERT INTO login (Username, Password) VALUES (?, ?)";
			PreparedStatement stmt2 = con.prepareStatement(sql2);
			stmt2.setString(1, username);
			stmt2.setString(2, pwd);
			stmt2.executeUpdate();

			stmt1.close();
			stmt2.close();
			con.close();

			response.sendRedirect("login.jsp");
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	%>

	<script type="text/javascript">
		function validateForm() {
			var fullname = document.getElementById("regform").fullname.value;
			var username = document.getElementById("regform").username.value;
			var contact = document.getElementById("regform").contact.value;
			var pwd = document.getElementById("regform").pwd.value;
			var cnf = document.getElementById("regform").cnf.value;

			if (fullname === '' || username === '' || contact === ''
					|| pwd === '' || cnf === '') {
				alert("All fields are required!!");
				return false;
			}
			if (pwd != cnf) {
				alert("Password does not match");
				document.getElementById('regform').pwd.value = "";
				document.getElementById('regform').cnf.value = "";
				return false;
			}
			if (contact.length != 10) {
				alert('Invalid contact no.');
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
