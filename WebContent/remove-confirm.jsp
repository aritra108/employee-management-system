<%@page import="sql.Driver"%>
<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Removal Confirmation</title>
		<link rel="stylesheet" href="index.css" />
		<style>
			.remove-confirm .remove-confirm-message {
				text-align: center;
				color: var(--dark-red);
			}
		</style>
	</head>
	<%
		if(session.getAttribute("id") != null) {
	%>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="main-section remove-confirm">
			<%
				String id = request.getParameter("id");
				
				// 1. Get a connection to the database 
				Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
				
				// 2. Create a statement 
				Statement myStmt = myConn.createStatement();
				
				// 3. Execute a SQL query 
				String sql = "delete from employees where id='" + id + "'";
				int rows = myStmt.executeUpdate(sql);
				
				if(rows == 0) {
					out.println("<h4 class='remove-confirm-message'>Some error occurred!!! Please try again.</h4>");
				} else {
					out.println("<h4 class='remove-confirm-message'>The employee with ID = " + id + " has been removed successfully!</h4>");
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