<%@page import="sql.Driver"%>
<link rel="stylesheet" href="sidebar.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />

<%
	// Getting admin details from the session ID attribute
	String adminDetails[] = Driver.getAdminNameAndDesignation(session.getAttribute("id").toString());
	String name = adminDetails[0];
	String designation = adminDetails[1];
%>

<div class="sidebar">
	<div class="sidebar-profile">
		<div class="avatar"><%= name.charAt(0) %></div>
		<div class="admin-details">
			<h3><%= name %></h3>
			<p><%= designation %></p>
		</div>
	</div>
	<div class="sidebar-items">
		<a href="home.jsp"><i class="fas fa-home"></i>Dashboard</a>
		<a href="add-employee.jsp"><i class="fas fa-user-plus"></i>Add an Employee</a>
		<a href="view-employees.jsp"><i class="fas fa-list"></i>View Employees</a>
		<a href="search-employee.jsp"><i class="fas fa-search"></i>Search an Employee</a>
		<a href="update-salary.jsp"><i class="fas fa-dollar-sign"></i>Update Salary</a>
		<a href="update-designation.jsp"><i class="fas fa-briefcase"></i>Update Designation</a>
		<a href="remove-employee.jsp"><i class="fas fa-user-minus"></i>Remove an Employee</a>
		<a href="add-admin.jsp"><i class="fas fa-cog"></i>Add Admin</a>
	</div>
</div>