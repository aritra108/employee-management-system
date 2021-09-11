<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Admin Login</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="login.css">
	</head>
	<body class="login-body">
		<div class="login">
			<%
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				
				if(Driver.validateAdmin(id, password)) {
					// Create a session
					session.setAttribute("id", id);
					
					// Redirect to Home 
					String redirectUrl = "http://localhost:8010/employee-management/home.jsp";
					response.sendRedirect(redirectUrl);
				} else {
			%>
					<h1>Employee Management</h1>
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
					<h3 class='login-feedback'>Incorrect Username or Password!</h3>
			<%
				}
			%>
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