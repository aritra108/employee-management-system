<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Employee Management System</title>
		<link rel="stylesheet" href="index.css" />
		<link rel="stylesheet" href="home.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section home">
			<h1>Dashboard</h1>
			<div class="divider"></div>
			
			<!-- First Grid Container -->
			<div class="grid-container">
				<div class="grid-item">
					<h3>No. of Employees</h3>
					<h1><%= Driver.getEmployeeCount() %></h1>
				</div>
				<div class="grid-item">
					<h3>No. of Admins</h3>
					<h1><%= Driver.getAdminCount() %></h1>
				</div>
				<div class="grid-item">
					<h3>Total Salary Given</h3>
					<h1>
						<i class="fas fa-rupee-sign"></i>
						<%= Driver.getTotalSalary()[0] %>
						<span class='unit'><%= Driver.getTotalSalary()[1] %></span>
					</h1>
				</div>
				<div class="grid-item">
					<h3>Average Experience</h3>
					<h1><%= Driver.getAverageExperience() %><span class="unit">yrs</span></h1>
				</div>
			</div>
			
			<!-- Options Heading -->
			<h2 class="options-heading">Options</h2>
			<div class="divider"></div>
			
			<!-- Options Grid Container -->			
			<div class="options-grid-container">
				<div class="options-grid-item home">
					<i class="fas fa-home"></i>
					<p>Home</p>
				</div>
				<a href="add-employee.jsp" class="options-grid-item other" >
					<i class="fas fa-user-plus"></i>
					<p>Add an Employee</p>
				</a>
				<a href="view-employees.jsp" class="options-grid-item other">
					<i class="fas fa-list"></i>
					<p>View all Employees</p>
				</a>
				<a href="search-employee.jsp" class="options-grid-item other">
					<i class="fas fa-search"></i>
					<p>Search an Employee</p>
				</a>
				<a href="update-salary.jsp" class="options-grid-item other">
					<i class="fas fa-dollar-sign"></i>
					<p>Update Employee Salary</p>
				</a>
				<a href="update-designation.jsp" class="options-grid-item other">
					<i class="fas fa-briefcase"></i>
					<p>Update Employee Designation</p>
				</a>
				<a href="remove-employee.jsp" class="options-grid-item other">
					<i class="fas fa-user-minus"></i>
					<p>Remove an Employee</p>
				</a>
				<a href="remove-employee.jsp" class="options-grid-item other">
					<i class="fas fa-cog"></i>
					<p>Add Admin</p>
				</a>
			</div>
			
		</div>
	</body>
	<%
		} else {
	%>
		<jsp:include page="not-login.jsp" />
	<% } %>
</html>