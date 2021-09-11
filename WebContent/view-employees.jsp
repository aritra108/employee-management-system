<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>View all Employees</title>
		<link rel="stylesheet" href="view-employees.css" />
		<link rel="stylesheet" href="index.css" />
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		<div class="main-section view-employees">
			<h1>My Employees</h1>
			<div class="divider"></div>
			
			<table CELLSPACING=0>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Location</th>
					<th>Email</th>
					<th>Designation</th>
					<th>Department</th>
					<th>Experience</th>
					<th>Salary</th>
				</tr>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
					Statement myStmt = myConn.createStatement();
					
					// Get the result set
					ResultSet myRs = myStmt.executeQuery("select * from employees");
					
					// Process the result set
					while(myRs.next()) {
						String id = myRs.getString("id");
						String name = myRs.getString("fullName");
						String gender = myRs.getString("gender");
						String location = myRs.getString("location");
						String email = myRs.getString("email");
						String designation = myRs.getString("designation");
						String department = myRs.getString("department");
						String experience = myRs.getString("experience");
						String salary = myRs.getString("salary");
						
						// Generate the HTML
						out.println("<tr>");
						out.println("<td>" + id + "</td>");
						out.println("<td>" + name + "</td>");
						out.println("<td>" + gender + "</td>");
						out.println("<td>" + location + "</td>");
						out.println("<td>" + email + "</td>");
						out.println("<td>" + designation + "</td>");
						out.println("<td>" + department + "</td>");
						out.println("<td>" + experience + " years</td>");
						out.println("<td>" + salary + "</td>");
						out.println("</tr>");
					}
				%>
			</table>
		</div>
	</body>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>