<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
<link rel="stylesheet" href="login.css">
</head>
<body>
	<%
		HttpSession session1 = request.getSession();
		String user = (String)session1.getAttribute("users");
		if(user!=null){
			response.sendRedirect("hostelForm.jsp");
			
		}
	%>
	<div class="container">
        <form id="loginForm" action="checkLogin1" method="post" onsubmit="return validateForm()">
        <div class="title">
        <h2>Login</h2>
        </div>
            
            <div class="form-filled" style="margin-top:50px;">
                <i class="ri-user-fill"></i>
                <input type="email" name="username" placeholder="Username">
            </div>
            <div class="form-filled">
                <i class="ri-lock-2-fill"></i>
                <input type="password" name="pwd" placeholder="number">
            </div>
            <div class="button-filled">
                <input type="submit" value="login"></input>
                <p>Don't have account? <a href="Register.jsp">Click here</a> to create new account</p>
            </div>
            
        </form>
        <div class="background">

        </div>
        <div class="notification" >
        	<div class="box" id="box" value="<%= (String)request.getAttribute("msg") %>">
        	
        		<p class="error">Login Failed!!</p>
        		
        	</div>
        </div>
        <script>
        
        	function validateForm(){
        		var username=document.getElementById('loginForm').username.value;
        		var pwd=document.getElementById('loginForm').pwd.value;
        		if(username==="" || pwd===""){
        			alert("username and password required!!");
        			return false
        		}
        		return true
        	}
        	var box=document.getElementById("box")
        	if(box.getAttribute("value")==="failed"){
        		box.style.display="grid"
        		setTimeout(()=>{
        			box.style.display="none"
        		},5000)
        	}
        </script>
</body>
</html>