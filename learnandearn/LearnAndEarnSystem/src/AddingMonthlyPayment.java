import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterCustomerServlet
 */
@WebServlet("/AddingMonthlyPayment")
public class AddingMonthlyPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//EncryptorDecryptor encryptor = new  EncryptorDecryptor();
    /**
     * Default constructor. 
     */
    public AddingMonthlyPayment() {
    	System.out.println("Constructor body");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		ServletContext context=getServletContext();  
		Enumeration<String> e=context.getInitParameterNames();  
		ArrayList<String> initParameter = new ArrayList<>();      
		String str="";  
	
		while(e.hasMoreElements()){  
		    str=e.nextElement();  
		    initParameter.add(context.getInitParameter(str));  
		}
		String database =  initParameter.get(0);
		String password =  initParameter.get(1);
		String driver =  initParameter.get(2);
		String  uname=  initParameter.get(3);
		System.out.println(database+"\n"+driver+"\n"+uname+"\n"+password);
		DBUtilities databaseObject = new DBUtilities(driver, database, uname, password);
		System.out.println("Connection Successful");
		String fname = request.getParameter("firstname");
		System.out.println(fname);
		String lname = request.getParameter("lastname");
		System.out.println(lname);
		
		Calendar now = Calendar.getInstance();
		int month = now.get(Calendar.MONTH);
		int month2=month+1;
		String month1 = String.valueOf(month2);
		System.out.println("MONTH:  "+month1);
		String username = null;
		double pay = 0;
		double monthlypayment = 0;
		double payment = 0;
		String month3 = null;
		String user = null;
		
		HttpSession session1 = request.getSession();
		String usname=(String)session1.getAttribute("username");
		System.out.println("in payment calculate: "+usname);
		session1.setAttribute("username", usname);
		
		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdetailsdb", "root", "root");
		Statement statement = con.createStatement();
		String sql1 = ("SELECT username from student where fname = '"+fname+"' and lname = '"+lname+"' ");
		ResultSet resultSet1 = statement.executeQuery(sql1);
		while(resultSet1.next()){
		username = resultSet1.getString("username");
		System.out.println("After Query execution username: "+username);
		}
		
		String sql2 = ("SELECT totalpayment from studentdetailsdb.workingtime where username='"+username+"' and MONTH(date) = MONTH(CURDATE())");
		ResultSet resultSet2 = statement.executeQuery(sql2);
		while(resultSet2.next()){
		pay = resultSet2.getDouble("totalpayment");

		monthlypayment= monthlypayment + pay;

		}
		System.out.println("The total monthly  payment is: "+monthlypayment);
	
		String sqlquery = ("SELECT totalmonthlypayment from studentdetailsdb.monthlypayment");
		ResultSet result = statement.executeQuery(sqlquery);
		while(result.next()){
		 payment = result.getDouble("totalmonthlypayment");
		System.out.println("After Query execution payment: "+payment);
		}
		if(payment == 0){
			boolean resultOfAddTime = databaseObject.addmonthlyPay(username, monthlypayment, month1);
			if(resultOfAddTime){
				System.out.println("User added successfully in else loop");
				HttpSession session = request.getSession();
				session.setAttribute("username", usname);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentMonthlyDisplayReport.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		
		String sql8 = ("SELECT username from studentdetailsdb.monthlypayment");
		ResultSet resultSet8 = statement.executeQuery(sql8);
		while(resultSet8.next()){
		user = resultSet8.getString("username");
		System.out.println("After Query execution user: "+user);
		}
		
		String sql6 = ("SELECT month from studentdetailsdb.monthlypayment");
		ResultSet resultSet6 = statement.executeQuery(sql6);
		while(resultSet6.next()){
		 month3 = resultSet6.getString("month");
		System.out.println("After Query execution month: "+month3);
		
		System.out.println(username+" ***********"+month3);
		
	
		if(month3.equals(month1) && username.equals(user)){
			
			String sql = "UPDATE monthlypayment SET totalmonthlypayment = ? WHERE username = ?";
			PreparedStatement preparedStmt = con.prepareStatement(sql);
		      preparedStmt.setDouble(1, monthlypayment );
		      preparedStmt.setString(2, username);

		      // execute the java preparedstatement
		      preparedStmt.executeUpdate();
		      HttpSession session = request.getSession();
				session.setAttribute("username", usname);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentMonthlyDisplayReport.jsp");
				dispatcher.forward(request, response);
			System.out.println("Updated in if loop");
			break;
			
		}
		else{
		
			boolean resultOfAddTime = databaseObject.addmonthlyPay(username, monthlypayment, month1);
			if(resultOfAddTime){
				System.out.println("User added successfully in else loop");
				HttpSession session = request.getSession();
				session.setAttribute("username", usname);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentMonthlyDisplayReport.jsp");
				dispatcher.forward(request, response);
				
			}
		else{
			System.out.println("Problem in adding user");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ErrorPage.html");
		dispatcher.forward(request, response);
		}
			break;
		}
		
		}
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		}
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		doGet(request, response);
	}
		catch(Exception e){
			System.out.println(e);
		}
	}

}
