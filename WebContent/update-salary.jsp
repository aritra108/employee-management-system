<html>
	<head>
		<title>Update Salary</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="update-salary.css">
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section update-salary">
			<h1>Update Salary</h1>
			<div class="divider"></div>
			
			<form id="update-salary-form">
				<div>
					<p>ID:</p>
					<input type="number" id="update-salary-id" name="id" placeholder="Enter the 4-digit ID" />
				</div>
				<div>
					<p>New Salary:</p>
					<input type="number" id="update-salary-salary" name="salary" placeholder="Enter the New Salary" />
				</div>
				<button type="submit">Update</button>
			</form>
		</div>
	</body>
	<script>
		const form = document.querySelector("#update-salary-form");
		const id = document.querySelector("#update-salary-id");
		const salary = document.querySelector("#update-salary-salary");
		
		form.addEventListener("submit", e => {
			e.preventDefault();
			
			if (id.value.length !== 4) {
				alert("ID must have 4 digits!");
				return;
			}
			
			if(salary.value.length === 0) {
				alert("Please provide the new salary!");
				return;
			}
			
			form.setAttribute("action", "update-salary-confirm.jsp");
			form.submit();
		})
		
	</script>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>