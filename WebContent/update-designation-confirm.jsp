<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Update Designation</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="updated-details.css">
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section update-designation-confirm">
			<h1>Designation Updation Confirmation</h1>
			<div class="divider"></div>
			
			<div class="updated-details">
				<%
					// Get the ID and New Designation
					String id = request.getParameter("id");
					String designation = request.getParameter("designation");
					
					// Set up connection to MySQL
					Class.forName("com.mysql.jdbc.Driver");
					Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
					Statement myStmt = myConn.createStatement();
					
					//  Execute SQL query
					int rows = myStmt.executeUpdate("update employees set designation = '" + designation + "' where id = " + id);
					
					// Generate HTML
					if(rows == 0) { // Invalid ID 
						out.println("<form id='update-designation-form'>");
						out.println("<div>");
						out.println("<p>ID:</p>");
						out.println("<input type='number' id='update-designation-id' name='id' placeholder='Enter the 4-digit ID' />");
						out.println("</div>");
						out.println("<div>");
						out.println("<p>New Designation:</p>");
						out.println("<input type='text' id='update-designation-designation' name='designation' placeholder='Enter the New Designatio' />");
						out.println("</div>");
						out.println("<button type='submit'>Update</button>");
						out.println("</form>");
						out.println("<h4 class='update-message'>No user found with the given ID!!!</h4>");
					} else { // Successful
						ResultSet myRs = myStmt.executeQuery("select * from employees where id=" + id);
						
						while(myRs.next()) {
							out.println("<h4 class='update-message'>Designation has been updated successfully!!!</h4>");
							out.println("<div class='updated-information'>");
							out.println("<h3>Updated Details</h3>");
							out.println("<p><strong>ID:</strong>" + myRs.getString("id") + "</p>");
							out.println("<p><strong>Name:</strong>" + myRs.getString("fullName") + "</p>");
							out.println("<p><strong>Department:</strong>" + myRs.getString("department") + "</p>");
							out.println("<p class='highlight'><strong>New Designation:</strong>" + myRs.getString("designation") + "</p>");
							out.println("<p><strong>Salary:</strong>" + myRs.getString("salary") + "</p>");
							out.println("</div>");
							
							break;
						}
					}
				%>
			</div>
		</div>
	</body>
	<script>
		const form = document.querySelector("#update-designation-form");
		const id = document.querySelector("#update-designation-id");
		const designation = document.querySelector("#update-designation-designation");
		
		form?.addEventListener("submit", e => {
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