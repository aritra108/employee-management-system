<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Add Admin</title>
		<link rel="stylesheet" href="index.css" />
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section add-admin">
			<h1>Add an Admin</h1>
			<div class="divider"></div>
			
			<form class="add-admin-form">
				<div>
					<p>ID:</p>
					<input type="number" id="add-admin-id" name="id" placeholder="Enter a 4-digit ID" required/>
				</div>
				<div>
					<p>Name:</p>
					<input type="text" id="add-admin-name" name="name" placeholder="Enter the Name" required/>
				</div>
				<div>
					<p>Designation:</p>
					<input type="text" id="add-admin-designation" name="designation" placeholder="Enter the Designation" required/>
				</div>
				<div>
					<p>Set Password:</p>
					<input type="password" id="add-admin-password" name="password" placeholder="Set a Password" required/>
				</div>
				<button type="submit">Submit</button>
			</form>
		</div>
		
		<script>
			// Form Validation
			const form = document.querySelector(".add-admin-form");
			
			const name = document.querySelector("#add-admin-name");
			const designation = document.querySelector("#add-admin-designation");
			const id = document.querySelector("#add-admin-id");
			const password = document.querySelector("#add-admin-password");

						
			form.addEventListener("submit", e => {
				e.preventDefault();
								
				if(name.value.length < 3 || name.value.length > 50) {
					alert("Name must be at least 3 characters and atmost 50 characters long!")
					return;
				}
				
				if(password.value.length < 4 || password.value.length > 20) {
					alert("Password must be at least 4 characters and atmost 20 characters long!")
					return;
				}
				
				// Invoking the JSP confirmation page
				form.setAttribute("action", "add-admin-confirm.jsp");
				form.submit();
			})
		</script>
	</body>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>