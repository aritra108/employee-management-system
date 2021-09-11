<html>
	<head>
		<title>Search Employee</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="search-employee.css">
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		<div class="main-section search-employee">
			<h1>Search an Employee</h1>
			<div class="divider"></div>
			
			<form id="search-employee-form">
				<div>
					<p>ID:</p>
					<input type="number" name="id" id="search-employee-id" placeholder="Enter the 4-digit ID" />
				</div>
				<button type="submit">Search</button>
			</form>
		</div>
	</body>
	<script>
		const form = document.querySelector("#search-employee-form");
		const id = document.querySelector("#search-employee-id");
		
		form.addEventListener("submit", e => {
			e.preventDefault();
			
			if(id.value.length != 4) {
				alert("An ID must be of 4 digits");
				return;
			}
			
			form.setAttribute("action", "employee-details.jsp");
			form.submit();
		})
	</script>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>