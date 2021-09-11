<%@page import="sql.Driver"%>
<link rel="stylesheet" href="header.css">

<%
	// Getting admin details from the session ID attribute
	String adminDetails[] = Driver.getAdminNameAndDesignation(session.getAttribute("id").toString());
	String name = adminDetails[0];
	String designation = adminDetails[1];
%>

<header>
	<div class="header-container">
		<h2><a href="home.jsp">Employee Management</a></h2>
		<div class="header-profile">
			<div id="header-avatar" class="avatar"><%= name.charAt(0) %></div>
			<div id="header-profile-dropdown" class="header-profile-dropdown">
				<div class="header-profile-description">
					<h4 class="name"><%= name %></h4>
					<small class="designation"><%= designation %></small>
				</div>
				<div class="header-profile-nav-item">
					<a id="header-logout" href="login.jsp">
						<i class="fas fa-sign-out-alt"></i>
						Logout
					</a>
				</div>
			</div>
		</div>
	</div>
</header>

<script>
	// Handling Profile Dropdown Display
	const avatar = document.querySelector("#header-avatar");
	const dropdown = document.querySelector("#header-profile-dropdown");
	
	document.addEventListener("click", e => {
		const clickedElement = e.target;
		
		if(clickedElement.id === "header-avatar") { // If the avatar is clicked 
			if(window.getComputedStyle(dropdown).display === "none") {
				dropdown.style.display = "block";
			} else {
				dropdown.style.display = "none";
			}
			
		} else if (!dropdown.contains(clickedElement)) { // If clicked inside the dropdown
			dropdown.style.display = "none";
		}
	});
</script>