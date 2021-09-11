<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Admin Login</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="login.css">
	</head>
	<%
		// Logout from the previous session
		session.removeAttribute("id");
	%>
	<body class="login-body">
		<div class="login">
			<div class="login-left">
				<div class="login-left-content">
					<h1>Employee Management System</h1>
					<p>Manage your employees more smoothly than ever with the functionalities of viewing live stats, adding, 
					viewing, searching, removing and updating perks of the employee. 
					Add multiple admins to make your work more easy!</p>
					<small>Made by Prasun, Suranjit, Aritra and Subhankar.</small>
				</div>
			</div>
			
			<div class = "login-right">
				<form id="login-form">
					<h2>Admin Login</h2>
					<div>
						<p>ID:</p>
						<input type="number" id="login-id" name="id" placeholder="Enter your 4-digit ID" />
					</div>
					<div>
						<p>Password:</p>
						<input type="password" id="login-password" name="password" placeholder="Enter your Password" />
					</div>
					<button type="submit">Login</button>
				</form>
			</div>
		</div>
	</body>
	<script>
		const form = document.querySelector("#login-form");
		const id = document.querySelector("#login-id");
		const password = document.querySelector("#login-password");
		
		form?.addEventListener("submit", e => {
			e.preventDefault();
			
			if(id.value.length != 4) {
				alert("Please enter a valid 4-digit ID!");
				return;
			}
			
			if(password.value.length === 0) {
				alert("Please provide a password!");
				return;
			}
			
			form.setAttribute("action", "login-confirm.jsp");
			form.submit();
		});
		
	</script>
</html>