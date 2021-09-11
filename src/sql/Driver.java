package sql;

import java.sql.*;

public class Driver {
	public static int addEmployee(String id, String name, String gender, String location, String email, String designation, String department, String experience, String salary) throws SQLException, ClassNotFoundException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		// 1. Get a connection to the database 
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		
		// 2. Create a statement 
		Statement myStmt = myConn.createStatement();
		
		// 3. Execute a SQL query 
		String sql = "insert into employees values ('" + id + "', '" + name + "', '" + gender + "', '" + location + "', '" + email + "', '" + designation + "', '" + department + "', '" + experience + "', '" + salary + "')";
		
		int rows = myStmt.executeUpdate(sql);
				
		return rows;
	}
	
	public static int addAdmin(String id, String name, String designation, String password) throws SQLException, ClassNotFoundException {
	Class.forName("com.mysql.jdbc.Driver");
			
			// 1. Get a connection to the database 
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
			
			// 2. Create a statement 
			Statement myStmt = myConn.createStatement();
			
			// 3. execute the SQL query
			String sql = "insert into admins values ('" + id + "', '" + password + "', '" + name + "', '" + designation + "')";
	
			int rows = myStmt.executeUpdate(sql);
			
			return rows;
	}
	
	public static int getEmployeeCount() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from employees");
		
		int len = 0;
		while(myRs.next()) {
			len++;
		}
		
		return len;
	}
	
	public static String[] getTotalSalary() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from employees");
		
		float total = 0;
		while(myRs.next()) {
			float salary = Float.parseFloat(myRs.getString("salary"));
			total += salary;
		}
		
		// Formatting the total currency
		String formattedTotal[] = new String[2];	
		
		if(total < 1000) {
			formattedTotal[0] = Float.toString(total);
		}
		else if(total < 100000) {
			formattedTotal[0] = Float.toString(total / 1000);			
			formattedTotal[1] = "K";
		}
		else if(total < 10000000) {
			formattedTotal[0] = Float.toString(total / 100000);
			formattedTotal[1] = "Lacs";
		}
		else {
			formattedTotal[0] = Float.toString(total / 10000000);
			formattedTotal[1] = "Cr";
		}
		
		int decimalIndex = -1; // Get the index of the decimal
		for(int i = 0; i < formattedTotal[0].length(); i++) {
			char ch = formattedTotal[0].charAt(i);
			if(ch == '.') {
				decimalIndex = i;
				break;
			}
		}
		
		if(formattedTotal[0].length() - decimalIndex == 2) { // only one place after decimal point 
			// if it is zero
			if(formattedTotal[0].charAt(decimalIndex + 1) == '0') formattedTotal[0] = formattedTotal[0].substring(0, decimalIndex);
		} else {
			formattedTotal[0] = formattedTotal[0].substring(0, decimalIndex + 3);
		}
		
		return formattedTotal;
	}
	
	public static String getAverageExperience() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from employees");
		
		float years = 0;
		while(myRs.next()) {
			float exp = Float.parseFloat(myRs.getString("experience"));
			years += exp;
		}
		
		years = years / getEmployeeCount();
		
		// Format the years 
		String formattedYears = Float.toString(years);
		
		int decimalIndex = -1; // Get the index of the decimal
		for(int i = 0; i < formattedYears.length(); i++) {
			char ch = formattedYears.charAt(i);
			if(ch == '.') {
				decimalIndex = i;
				break;
			}
		}
		
		if(formattedYears.length() - decimalIndex == 2) { // only one place after decimal point 
			// if it is zero
			if(formattedYears.charAt(decimalIndex + 1) == '0') formattedYears = formattedYears.substring(0, decimalIndex);
		} else {
			formattedYears = formattedYears.substring(0, decimalIndex + 3);
		}
		
		return formattedYears;
	}
	
	public static boolean validateID(String id) throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from employees");
		
		// Check if the given ID is already assigned to any other employee
		boolean flag = true;
		while(myRs.next()) {
			String currId = myRs.getString("id");
			if(id.equals(currId)) {
				flag = false;
				break;
			}
		}
		
		return flag;
	}
	
	public static boolean validateAdminID(String id) throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from admins");
		
		// Check if the given ID is already assigned to any other employee
		boolean flag = true;
		while(myRs.next()) {
			String currId = myRs.getString("id");
			if(id.equals(currId)) {
				flag = false;
				break;
			}
		}
		
		return flag;
	}
	
	public static boolean validateAdmin(String id, String password) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from admins where id = '" + id + "'");
		
		boolean flag = false;
		
		while(myRs.next()) {
			String org_password = myRs.getString("password");
			
			if(org_password.equals(password)) {
				flag = true;
			}
			
			break;
		}
		
		return flag;
	}
	
	public static int getAdminCount() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from admins");
		
		int len = 0;
		while(myRs.next()) {
			len++;
		}
		
		return len;
	}
	
	public static String[] getAdminNameAndDesignation(String id) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management", "root", "5646");
		Statement myStmt = myConn.createStatement();
		
		ResultSet myRs = myStmt.executeQuery("select * from admins where id = '" + id + "'");
		
		String adminDetails[] = new String[2];
		while(myRs.next()) {
			adminDetails[0] =  myRs.getString("fullName");
			adminDetails[1] = myRs.getString("designation");
		}
		
		return adminDetails;
	}
}

