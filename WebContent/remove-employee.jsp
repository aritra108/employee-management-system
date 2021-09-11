<html>
	<head>
		<title>Remove Employee</title>
		<link rel="stylesheet" href="index.css" />
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section remove-employee">
			<h1>Remove Employee</h1>
			<div class="divider"></div>
			
			<form id="remove-employee-form">
				<div>
					<p>ID:</p>
					<input type="number" id="remove-employee-id" name="id" placeholder="Enter the 4-digit ID" />
				</div>
				<button type="submit">Remove</button>
			</form>
		</div>
	</body>
	<script>
		const form = document.querySelector("#remove-employee-form");
		const id = document.querySelector("#remove-employee-id");
		
		form?.addEventListener("submit", e => {
			e.preventDefault();
			
			if (id.value.length !== 4) {
				alert("ID must have 4 digits!");
				return;
			}
			
			form.setAttribute("action", "remove-employee-intermediate.jsp");
			form.submit();
		});
	</script>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>