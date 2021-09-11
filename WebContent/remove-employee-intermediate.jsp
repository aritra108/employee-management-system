<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Remove Employee</title>
		<link rel="stylesheet" href="index.css" />
		<link rel="stylesheet" href="employee-details.css">
		<link rel="stylesheet" href="remove-employee-intermediate.css">
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section remove-employee-intermediate">
			<h1>Remove Employee</h1>
			<div class="divider"></div>
			
			<form id="remove-employee-form">
				<div>
					<p>ID:</p>
					<input type="number" id="remove-employee-id" name="id" placeholder="Enter the 4-digit ID" />
				</div>
				<button type="submit">Remove</button>
			</form>
			
			<%
				// Get the ID
				String id = request.getParameter("id");
				String salary = request.getParameter("salary");
				
				// Set up connection to MySQL
				Class.forName("com.mysql.jdbc.Driver");
				Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
				Statement myStmt = myConn.createStatement();
				
				//  Execute SQL query
				ResultSet myRs = myStmt.executeQuery("select * from employees where id=" + id);
				
				// Generate HTML
				int len = 0;
				while(myRs.next()) {
					len++;
				}
				
				if(len == 0) { // Invalid ID
					out.println("<h4 class='remove-message'>No user found with this ID!!!</h4>");
				} else { // User found
					myRs = myStmt.executeQuery("select * from employees where id=" + id);
					while(myRs.next()) {
						out.println("<h4 class='remove-message'>Are you sure you want to remove the following employee?</h4>");
						
						out.println("<div class='employee-details'>");
						
						// Header
						out.println("<div class='header'>");
						out.println("<h2>" + myRs.getString("fullName") + "</h2>");
						out.println("<h4>ID: " + myRs.getString("id") + "</h4>");
						out.println("</div>");
						
						// Divider 
						out.println("<div class='divider'></div>");
						
						// Flex Container 
						out.println("<div class='flex-container'>");
						
						// Personal Details 
						out.println("<div class='detail-container personal-details'>");
						out.println("<h3>Personal Details</h3>");
						out.println("<p><strong>Name:</strong>" + myRs.getString("fullName") + "</p>");
						out.println("<p><strong>Gender:</strong>" + myRs.getString("gender") + "</p>");
						out.println("<p><strong>Location:</strong>" + myRs.getString("location") + "</p>");
						out.println("<p><strong>Email:</strong>" + myRs.getString("email") + "</p>");
						out.println("</div>");
						
						// Job details 
						out.println("<div class='detail-container job-details'>");
						out.println("<h3>Company Details</h3>");
						out.println("<p><strong>ID:</strong>" + myRs.getString("id") + "</p>");
						out.println("<p><strong>Department:</strong>" + myRs.getString("department") + "</p>");
						out.println("<p><strong>Designation:</strong>" + myRs.getString("designation") + "</p>");
						out.println("<p><strong>Experience:</strong>" + myRs.getString("experience") + " years</p>");
						out.println("<p><strong>Salary:</strong>Rs. " + myRs.getString("salary") + "</p>");
						out.println("</div>");
						
						// End of Flex Container 
						out.println("</div>");
						
						// End of Employee Details 
						out.println("</div>");
						
						// Remove Button
						out.println("<form id='remove-employee-final-form'>");
						out.println("<input name='id' value=" + id + " />");
						out.println("<button type='submit' id='remove-employee-btn' class='remove-employee-btn'>Remove</button>");
						out.println("</form>");
						
						break;
					}
				}
			%>
		</div>
	</body>
	<script>
		const form = document.querySelector("#remove-employee-form");
		const id = document.querySelector("#remove-employee-id");
		
		// Searching by ID 
		form?.addEventListener("submit", e => {
			e.preventDefault();
			
			if (id.value.length !== 4) {
				alert("ID must have 4 digits!");
				return;
			}
			
			form.setAttribute("action", "remove-employee-intermediate.jsp");
			form.submit();
		});
		
		// Final Removal
		const finalForm = document.querySelector("#remove-employee-final-form");
		
		finalForm?.addEventListener("submit", e => {
			e.preventDefault();
			
			finalForm.setAttribute("action", "remove-confirm.jsp");
			finalForm.submit();
		});
	</script>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>