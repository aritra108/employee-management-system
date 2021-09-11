<html>
	<head>
		<title>Add Employee</title>
		<link rel="stylesheet" href="index.css" />
		<link rel="stylesheet" href="add-employee.css" />
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section add-employee">
			<h1>Add an Employee</h1>
			<div class="divider"></div>
			
			<form class="add-employee-form">
				<div>
					<p>ID:</p>
					<input type="number" id="add-employee-id" name="id" placeholder="Enter a 4-digit ID" />
				</div>
				<div>
					<p>Name:</p>
					<input type="text" id="add-employee-name" name="name" placeholder="Enter the Name" />
				</div>
				<div>
					<p>Gender:</p>
					<div class="radio-buttons">
						<div>
							<p>Male</p>
							<input id="add-employee-gender" type="radio" name="gender" value="Male" />
						</div>
						<div>
							<p>Female</p>
							<input id="add-employee-gender" type="radio" name="gender" value="Female" />
						</div>
						<div>
							<p>Other</p>
							<input id="add-employee-gender" type="radio" name="gender" value="Other" />
						</div>
					</div>
				</div>
				<div>
					<p>Location:</p>
					<input type="text" id="add-employee-location" name="location" placeholder="Enter the City and Country" />
				</div>
				<div>
					<p>Email:</p>
					<input type="email" id="add-employee-email" name="email" placeholder="Enter the Email Address" />
				</div>
				<div>
					<p>Designation:</p>
					<input type="text" id="add-employee-designation" name="designation" placeholder="Enter the Designation" />
				</div>
				<div>
					<p>Department:</p>
					<input type="text" id="add-employee-department" name="department" placeholder="Enter the Department" />
				</div>
				<div>
					<p>Years of Exp:</p>
					<input type="number" id="add-employee-experience" name="experience" placeholder="Enter the Years of Experience" />
				</div>
				<div>
					<p>Salary:</p>
					<input type="number" id="add-employee-salary" name="salary" placeholder="Enter the Salary" />
				</div>
				<button type="submit">Submit</button>
			</form>
		</div>
		
		<script>
			// Form Validation
			const form = document.querySelector(".add-employee-form");
			
			const id = document.querySelector("#add-employee-id");
			const name = document.querySelector("#add-employee-name");
			const gender = document.querySelector("#add-employee-gender");
			const _location = document.querySelector("#add-employee-location");
			const email = document.querySelector("#add-employee-email");
			const designation = document.querySelector("#add-employee-designation");
			const department = document.querySelector("#add-employee-department");
			const experience = document.querySelector("#add-employee-experience");
			const salary = document.querySelector("#add-employee-salary");
						
			form.addEventListener("submit", e => {
				e.preventDefault();
								
				if(name.value.length < 3 || name.value.length > 50) {
					alert("Name must be at least 3 characters and atmost 50 characters long!")
					return;
				}
				
				if(_location.value.length === 0) {
					alert("Please provide a location!")
					return;
				}
				
				if(email.value.length === 0) {
					alert("Please provide an email address!")
					return;
				}
				
				if(designation.value.length === 0) {
					alert("Please provide a designation!")
					return;
				}
				
				if(department.value.length === 0) {
					alert("Please provide a department!")
					return;
				}
				
				if(experience.value.length === 0) {
					alert("Please provide the years of experience!")
					return;
				}
				
				if(salary.value.length === 0) {
					alert("Please provide a salary!")
				}
				
				// Invoking the JSP confirmation page
				form.setAttribute("action", "add-employee-confirmation.jsp");
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