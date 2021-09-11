<html>
	<head>
		<title>Update Designation</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="update-designation.css">
		<style>
			.update-designation form > div > p {
				margin-right: 15px;
			}
		</style>
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section update-designation">
			<h1>Update Designation</h1>
			<div class="divider"></div>
			
			<form id="update-designation-form">
				<div>
					<p>ID:</p>
					<input type="number" id="update-designation-id" name="id" placeholder="Enter 4-digit ID" />
				</div>
				<div>
					<p>New Designation:</p>
					<input type="text" id="update-designation-designation" name="designation" placeholder="Enter new designation" />
				</div>
				<button type="submit">Update</button>
			</form>
		</div>
	</body>
	<script>
		const form = document.querySelector("#update-designation-form");
		const id = document.querySelector("#update-designation-id");
		const designation = document.querySelector("#update-designation-designation");
		
		form.addEventListener("submit", e => {
			e.preventDefault();
			
			if (id.value.length !== 4) {
				alert("ID must have 4 digits!");
				return;
			}
			
			if(designation.value.length === 0) {
				alert("Please provide the new designation!");
				return;
			}
			
			form.setAttribute("action", "update-designation-confirm.jsp");
			form.submit();
		});
		
	</script>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>