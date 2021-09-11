<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Employee Details</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="search-employee.css">
		<link rel="stylesheet" href="employee-details.css">
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
					<p>Enter Employee ID:</p>
					<input type="number" name="id" id="search-employee-id" placeholder="Enter the 4-digit ID" />
				</div>
				<button type="submit">Search</button>
			</form>
			
			<%
				// Get the ID 
				String id = request.getParameter("id");
				
				// Set up connection to MySQL
				Class.forName("com.mysql.jdbc.Driver");
				Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
				Statement myStmt = myConn.createStatement();
				
				//  Execute SQL query
				ResultSet myRs = myStmt.executeQuery("select * from employees where id=" + id);
				
				// Calculate length of result set
				int len = 0;
				while(myRs.next()) {
					len++;
				}
				
				// Generate the HTML
				if(len == 1) {
					myRs = myStmt.executeQuery("select * from employees where id=" + id);	
					while(myRs.next()) {
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
					}
				} else if (len == 0) {
					out.println("<div class='employee-details'>");
					out.println("<h3 class='no-employee'>No employee exists with this ID!</h3>");
					out.println("</div>");
				}
			%>
		</div>
	</body>
	</body>
	<script>
		const form = document.querySelector("#search-employee-form");
		const id = document.querySelector("#search-employee-id");
		
		form?.addEventListener("submit", e => {
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