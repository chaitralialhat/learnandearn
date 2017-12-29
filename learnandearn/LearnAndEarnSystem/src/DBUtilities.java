

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class DBUtilities {
Connection con =null;
//LoggerClass log = LoggerClass.getLoggerInstance();
public DBUtilities(String driver,String database,String user,String password) {
	try {
		System.out.println("Driver = "+driver);
		Class.forName(driver);
		con=DriverManager.getConnection(database,user,password);
		
	} catch (ClassNotFoundException|SQLException e) {
		System.out.println(e.getMessage());
	}
}
String getAddCustomerQuery(String studentName,String gender, long mobileNumber,String college, String department, String email, String address,String city, String state,String country,String username,String lname,String role){
	return "INSERT INTO `studentdetailsdb`.`student` (`fname`, `gender`, `mobile`, `college`,`department`, `mailID`,`address`,`city`,`state`,`country`,`username`,`lname`,`role`) VALUES ('"+studentName+"', '"+gender+"', '"+mobileNumber+"', '"+college+"','"+department+"','"+email+"','"+address+"','"+city+"','"+state+"','"+country+"','"+username+"','"+lname+"','"+role+"')";
}
public boolean addCustomer(String studentName,String gender, long mobileNumber,String college, String department, String email, String address,String city, String state,String country,String username,String lname,String role) {
	boolean result = false;
	Statement st = null;
	try {
		st= con.createStatement();
		String query =getAddCustomerQuery(studentName, gender, mobileNumber, college, department, email, address, city, state, country, username,lname,role); 
		int i = st.executeUpdate(query);
		if(i>0){
			System.out.println("Row Inserted in table "+i);
			result=true;
		}
			else
			System.out.println("No rows inserted "+i);
	st.close();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
	finally {
		try {
			if(st!=null)
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	return result;
}

String getAddTimeQuery(String username, String intime, String outtime,String date){
	return "INSERT INTO `studentdetailsdb`.`workingtime` (`username`, `intime`, `outtime`, `date`) VALUES ('"+username+"', '"+intime+"', '"+outtime+"', '"+date+"')";
}

public boolean addTime(String username, String intime, String outtime,String date) {
	boolean result = false;
	Statement st = null;
	try {
		st= con.createStatement();
		String query =getAddTimeQuery(username, intime, outtime,date);
		int i = st.executeUpdate(query);
		if(i>0){
			System.out.println("Row Inserted in table "+i);
			result=true;
		}
			else
			System.out.println("No rows inserted "+i);
	st.close();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
	finally {
		try {
			if(st!=null)
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	return result;
}


String getAddYearlyPayQuery(String username, double totalyearpayment, String year){
	
	return "INSERT INTO `studentdetailsdb`.`yearlypayment` (`username`, `totalyearpayment`, `year`) VALUES ('"+username+"', '"+totalyearpayment+"', '"+year+"')";
}

public boolean addYearlyPay(String username, double totalyearpayment, String year) {
	boolean result = false;
	Statement st = null;
	try {
		st= con.createStatement();
		String query =getAddYearlyPayQuery(username, totalyearpayment, year);
		int i = st.executeUpdate(query);
		if(i>0){
			System.out.println("Row Inserted in table "+i);
			result=true;
		}
			else
			System.out.println("No rows inserted "+i);
	st.close();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
	finally {
		try {
			if(st!=null)
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	return result;
}

String getAddmonthlyPayQuery(String username, double totalmonthlypayment, String month){
	
	return "INSERT INTO `studentdetailsdb`.`monthlypayment` (`username`, `totalmonthlypayment`, `month`) VALUES ('"+username+"', '"+totalmonthlypayment+"', '"+month+"')";
}

public boolean addmonthlyPay(String username, double totalmonthlypayment, String month) {
	boolean result = false;
	Statement st = null;
	try {
		st= con.createStatement();
		String query =getAddmonthlyPayQuery(username, totalmonthlypayment, month);
		int i = st.executeUpdate(query);
		if(i>0){
			System.out.println("Row Inserted in table "+i);
			result=true;
		}
			else
			System.out.println("No rows inserted "+i);
	st.close();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
	finally {
		try {
			if(st!=null)
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	return result;
}

public boolean addUserCredentials(String username,String password, String role){
	boolean result = false;
	Statement st = null;
	try {
		st= con.createStatement();
		String query =getAddUserQuery(username,password, role); 
		int i = st.executeUpdate(query);
		if(i>0){
			System.out.println("Row Inserted in table "+i);
		result=true;
		}
			else
			System.out.println("No rows inserted "+i);
	st.close();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
	finally {
		try {
			if(st!=null)
			st.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	return result;
}
private String getAddUserQuery(String username, String password, String role) {
	return "INSERT INTO `studentdetailsdb`.`studentlogin` (`username`, `password`, `role` ) VALUES ('"+username+"', '"+password+"', '"+role+"');";
}
public boolean checkLoginCredentials(String customerUsername, String customerPassword, String role) {
	boolean result=false;
	String dbUsername = null;
	String dbPassword = null;
	String authType = null;
	try(Statement st=con.createStatement();ResultSet rs = st.executeQuery(getCustomerLoginQuery(customerUsername,customerPassword))){		 
		System.out.println(getCustomerLoginQuery(customerUsername, customerPassword));
		while(rs.next()){
			dbUsername = rs.getString(1);
			dbPassword=rs.getString(2);
			authType = rs.getString(3);
		}
		if(dbUsername!=null && dbPassword!=null && dbPassword.equals(customerPassword) && dbUsername.equalsIgnoreCase(customerUsername)){
			StudentLoginServlet1.setAuthenticationType(authType);
			result=true;
		}
		else{
			result=false;
			System.out.println("Something went wrong "+dbPassword+" "+dbUsername+" "+customerPassword+" "+customerUsername);
		}
	
	}
	catch(SQLException se){
		System.out.println(se);
	}
	finally {
		try {			
			con.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		
	}
	return result;
}
private String getCustomerLoginQuery(String customerUsername, String customerPassword) {
	return "SELECT * FROM studentdetailsdb.studentlogin where username = '"+customerUsername+"' and password = '"+customerPassword+"';";
}
public  List<String> getCustomerID(String attribute) {
	List<String> list = new ArrayList<>();
	String query = getSelectCustomerDetailsQuery(attribute);
	System.out.println(query);
	try(Statement stmt=con.createStatement();ResultSet rset = stmt.executeQuery(query)){
		if(rset.next()){
			
			list.add(rset.getString(1));
			list.add(rset.getString(2));
			list.add(rset.getString(3));
			list.add(rset.getString(4));
			list.add(rset.getString(5));
		}
		else{
			System.out.println(" Empty Result Set");	
		}
	} catch (SQLException e) {
		System.out.println(e);
	}
	System.out.println(list);
	return list;
}
private static String getSelectCustomerDetailsQuery(String attribute) {

	return "SELECT customerID,name,address,mobile,emailId FROM studentdetailsdb.student where username="+attribute;
}
public int addRequest(int customerID, String status) {
	String query = getAddRequestQuery(customerID,status);
	int finalResult=0;
	ResultSet rs=null;
	try(Statement stmt=con.createStatement()){
		
		int result = stmt.executeUpdate(query,Statement.RETURN_GENERATED_KEYS);
		if(result>0){
			System.out.println(result);
			rs = stmt.getGeneratedKeys();
			while(rs.next())
			finalResult = rs.getInt(1);
		}
	} catch (SQLException e) {
		System.out.println(e);
	}
	finally {
		try{
			if(rs!=null){
				rs.close();
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	return finalResult;
}
private String getAddRequestQuery(int customerID, String status) {
	return "INSERT INTO `gasbookingdb`.`bookingrequest` (`customerID`, `status`) VALUES ('"+customerID+"', '"+status+"');";
}

}
