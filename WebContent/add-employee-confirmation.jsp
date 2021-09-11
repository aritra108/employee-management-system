<%@page import="sql.Driver"%>
<html>
	<head>
		<title>Add Employee Confirmation</title>
		<link rel="stylesheet" href="index.css" />
		<link rel="stylesheet" href="add-employee-confirmation.css" />
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section add-employee-confirmation">
			<h1>Confirmation</h1>
			<div class="divider"></div>
			
			<!-- Get the form values -->
			<%
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String gender = request.getParameter("gender");
				String location = request.getParameter("location");
				String email = request.getParameter("email");
				String designation = request.getParameter("designation");
				String department = request.getParameter("department");
				String experience = request.getParameter("experience");
				String salary = request.getParameter("salary");
				
				// Check if the ID is already present 
				if(Driver.validateID(id)) {
					// Insert details into the database
					sql.Driver.addEmployee(id, name, gender, location, email, designation, department, experience, salary);
				
					// Show confirmation details
					out.println("<h4>The following employee has been successfully added to the database!</h4>");
					
					out.println("<div class='employee-details'>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>ID</strong></p>");
					out.println("<p class='employee-detail-value'>" + id + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Name</strong></p>");
					out.println("<p class='employee-detail-value'>" + name + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Gender</strong></p>");
					out.println("<p class='employee-detail-value'>" + gender + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Location</strong></p>");
					out.println("<p class='employee-detail-value'>" + location + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Email</strong></p>");
					out.println("<p class='employee-detail-value'>" + email + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Designation</strong></p>");
					out.println("<p class='employee-detail-value'>" + designation + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Department</strong></p>");
					out.println("<p class='employee-detail-value'>" + department + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Experience</strong></p>");
					out.println("<p class='employee-detail-value'>" + experience + "</p>");
					out.println("</div>");
					
					out.println("<div class='employee-detail-row'>");
					out.println("<p class='employee-detail-attribute'><strong>Salary</strong></p>");
					out.println("<p class='employee-detail-value'>" + salary + "</p>");
					out.println("</div>");
					
					out.println("</div>");
					
					out.println("<a href='view-employees.jsp' class='view-employees' >View all Employees</a>");
				} else {
					out.println("<h3 class='message'>The entered ID is already assigned to another employee!</h3>");
					out.println("<a href='view-employees.jsp' class='view-employees' >View all Employees</a>");
				}
			%>
		</div>
	</body>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>