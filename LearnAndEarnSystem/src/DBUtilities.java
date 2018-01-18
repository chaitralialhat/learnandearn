
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class DBUtilities {
	Connection con = null;

	// LoggerClass log = LoggerClass.getLoggerInstance();
	public DBUtilities(String driver, String database, String user, String password) {
		try {
			System.out.println("Driver = " + driver);
			Class.forName(driver);
			con = DriverManager.getConnection(database, user, password);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	String getAddStudentQuery(String studentName, String gender, long mobileNumber, String college, String department,
			String email, String address, String city, String state, String country, String username, String lname,
			String role) {
		return "INSERT INTO `studentdetailsdb`.`student` (`fname`, `gender`, `mobile`, `college`,`department`, `mailID`,`address`,`city`,`state`,`country`,`username`,`lname`,`role`) VALUES ('"
				+ studentName + "', '" + gender + "', '" + mobileNumber + "', '" + college + "','" + department + "','"
				+ email + "','" + address + "','" + city + "','" + state + "','" + country + "','" + username + "','"
				+ lname + "','" + role + "')";
	}

	public boolean addStudent(String studentName, String gender, long mobileNumber, String college, String department,
			String email, String address, String city, String state, String country, String username, String lname,
			String role) {
		boolean result = false;
		Statement st = null;
		try {
			st = con.createStatement();
			String query = getAddStudentQuery(studentName, gender, mobileNumber, college, department, email, address,
					city, state, country, username, lname, role);
			int i = st.executeUpdate(query);
			if (i > 0) {
				System.out.println("Row Inserted in table " + i);
				result = true;
			} else
				System.out.println("No rows inserted " + i);
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	String getAddTimeQuery(String username, String intime, String outtime, String date) {
		return "INSERT INTO `studentdetailsdb`.`workingtime` (`username`, `intime`, `outtime`, `date`) VALUES ('"
				+ username + "', '" + intime + "', '" + outtime + "', '" + date + "')";
	}

	public boolean addTime(String username, String intime, String outtime, String date) {
		boolean result = false;
		Statement st = null;
		try {
			st = con.createStatement();
			String query = getAddTimeQuery(username, intime, outtime, date);
			int i = st.executeUpdate(query);
			if (i > 0) {
				System.out.println("Row Inserted in table " + i);
				result = true;
			} else
				System.out.println("No rows inserted " + i);
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	String getAddYearlyPayQuery(String username, double totalyearpayment, String year) {

		return "INSERT INTO `studentdetailsdb`.`yearlypayment` (`username`, `totalyearpayment`, `year`) VALUES ('"
				+ username + "', '" + totalyearpayment + "', '" + year + "')";
	}

	public boolean addYearlyPay(String username, double totalyearpayment, String year) {
		boolean result = false;
		Statement st = null;
		try {
			st = con.createStatement();
			String query = getAddYearlyPayQuery(username, totalyearpayment, year);
			int i = st.executeUpdate(query);
			if (i > 0) {
				System.out.println("Row Inserted in table " + i);
				result = true;
			} else
				System.out.println("No rows inserted " + i);
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	String getAddmonthlyPayQuery(String username, double totalmonthlypayment, String month, String year) {

		return "INSERT INTO `studentdetailsdb`.`monthlypayment` (`username`, `totalmonthlypayment`, `month`, `year`) VALUES ('"
				+ username + "', '" + totalmonthlypayment + "', '" + month + "', '" + year + "')";
	}

	public boolean addmonthlyPay(String username, double totalmonthlypayment, String month, String year) {
		boolean result = false;
		Statement st = null;
		try {
			st = con.createStatement();
			String query = getAddmonthlyPayQuery(username, totalmonthlypayment, month, year);
			int i = st.executeUpdate(query);
			if (i > 0) {
				System.out.println("Row Inserted in table " + i);
				result = true;
			} else
				System.out.println("No rows inserted " + i);
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	public boolean addUserCredentials(String username, String password, String role) {
		boolean result = false;
		Statement st = null;
		try {
			st = con.createStatement();
			String query = getAddUserQuery(username, password, role);
			int i = st.executeUpdate(query);
			if (i > 0) {
				System.out.println("Row Inserted in table " + i);
				result = true;
			} else
				System.out.println("No rows inserted " + i);
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	private String getAddUserQuery(String username, String password, String role) {
		return "INSERT INTO `studentdetailsdb`.`studentlogin` (`username`, `password`, `role` ) VALUES ('" + username
				+ "', '" + password + "', '" + role + "');";
	}

	public boolean checkLoginCredentials(String customerUsername, String customerPassword, String role) {
		boolean result = false;
		String dbUsername = null;
		String dbPassword = null;
		String authType = null;
		try (Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(getCustomerLoginQuery(customerUsername, customerPassword))) {
			System.out.println(getCustomerLoginQuery(customerUsername, customerPassword));
			while (rs.next()) {
				dbUsername = rs.getString(1);
				dbPassword = rs.getString(2);
				authType = rs.getString(3);
			}
			if (dbUsername != null && dbPassword != null && dbPassword.equals(customerPassword)
					&& dbUsername.equalsIgnoreCase(customerUsername)) {
				StudentLoginServlet1.setAuthenticationType(authType);
				result = true;
			} else {
				result = false;
				System.out.println("Something went wrong " + dbPassword + " " + dbUsername + " " + customerPassword
						+ " " + customerUsername);
			}

		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e);
			}

		}
		return result;
	}

	private String getCustomerLoginQuery(String customerUsername, String customerPassword) {
		return "SELECT * FROM studentdetailsdb.studentlogin where username = '" + customerUsername
				+ "' and password = '" + customerPassword + "';";
	}

	

	

	

}
