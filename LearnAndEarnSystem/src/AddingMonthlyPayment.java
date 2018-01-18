import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Locale;

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

	// EncryptorDecryptor encryptor = new EncryptorDecryptor();
	/**
	 * Default constructor.
	 */
	public AddingMonthlyPayment() {
		// System.out.println("Constructor body");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ServletContext context = getServletContext();
			Enumeration<String> e = context.getInitParameterNames();
			ArrayList<String> initParameter = new ArrayList<>();
			ArrayList<Double> monthlyPaymentList = new ArrayList<Double>();
			ArrayList<String> usernameList = new ArrayList<String>();
			ArrayList<String> monthList = new ArrayList<String>();
			String str = "";

			while (e.hasMoreElements()) {
				str = e.nextElement();
				initParameter.add(context.getInitParameter(str));
			}
			String database = initParameter.get(0);
			String password = initParameter.get(1);
			String driver = initParameter.get(2);
			String uname = initParameter.get(3);
			System.out.println(database + "\n" + driver + "\n" + uname + "\n" + password);
			DBUtilities databaseObject = new DBUtilities(driver, database, uname, password);
			System.out.println("Connection Successful");
			String fname = request.getParameter("firstname");
			// System.out.println(fname);
			String lname = request.getParameter("lastname");
			// System.out.println(lname);

			Calendar now = Calendar.getInstance();
			String month2 = now.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.ENGLISH);
			// int month2 = month + 1;
			// String month1 = String.valueOf(month2);
			// System.out.println("MONTH: " + month2);

			int year = now.get(Calendar.YEAR);
			String year1 = String.valueOf(year);
			String username = null;
			double pay = 0;
			double monthlypayment = 0;
			double payment = 0;
			String month3 = null;
			String user = null;
			int flag = 0;
			HttpSession session1 = request.getSession();
			String usname = (String) session1.getAttribute("username");
			// System.out.println("in payment calculate: "+usname);
			session1.setAttribute("username", usname);

			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdetailsdb", "root",
					"root");
			Statement statement = con.createStatement();

			String sql1 = ("SELECT username from student where fname = '" + fname + "' and lname = '" + lname + "'");
			ResultSet resultSet1 = statement.executeQuery(sql1);
			while (resultSet1.next()) {
				username = resultSet1.getString("username");
				// System.out.println("After Query execution username: " +
				// username);
			}

			String sql2 = ("SELECT totalpayment from studentdetailsdb.workingtime where username='" + username
					+ "' and MONTH(date) = MONTH(CURDATE()) and YEAR(date) = YEAR(CURDATE())");
			ResultSet resultSet2 = statement.executeQuery(sql2);
			while (resultSet2.next()) {
				pay = resultSet2.getDouble("totalpayment");

				monthlypayment = monthlypayment + pay;

			}
			// System.out.println("The total monthly payment is: " +
			// monthlypayment);

			String sqlquery = ("SELECT totalmonthlypayment from studentdetailsdb.monthlypayment");
			ResultSet result = statement.executeQuery(sqlquery);
			while (result.next()) {
				payment = result.getDouble("totalmonthlypayment");
				monthlyPaymentList.add(payment);
			}
			// System.out.println("Size of monthly paymnet list: " +
			// monthlyPaymentList.size());
			if (monthlyPaymentList.size() == 0) {
				boolean resultOfAddTime = databaseObject.addmonthlyPay(username, monthlypayment, month2, year1);
				if (resultOfAddTime) {
					System.out.println("User added successfully when database was empty");
					HttpSession session = request.getSession();
					session.setAttribute("username", usname);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentMonthlyDisplayReport.jsp");
					dispatcher.forward(request, response);
				}

			}

			else {

				String sql8 = ("SELECT username from studentdetailsdb.monthlypayment");
				ResultSet resultSet8 = statement.executeQuery(sql8);
				while (resultSet8.next()) {
					user = resultSet8.getString("username");
					usernameList.add(user);
				}
				// System.out.println("After Query execution user: " +
				// usernameList.toString() + " Size: " + usernameList.size());

				String sql6 = ("SELECT month from studentdetailsdb.monthlypayment");
				ResultSet resultSet6 = statement.executeQuery(sql6);
				while (resultSet6.next()) {
					month3 = resultSet6.getString("month");
					monthList.add(month3);
				}
				// System.out.println("monthList:::::" + monthList.toString() +
				// " size" + monthList.size());

				System.out.println("Size of usernameList:   " + usernameList.size());
				for (int i = 0; i <= usernameList.size(); i++) {
					// System.out.println(" " + monthList.get(i) + " " +
					// usernameList.get(i));
					// System.out.println("month: " + month2 + "username:: " +
					// username);
					if (monthList.get(i).equals(month2) && usernameList.get(i).equals(username)) {
						flag = 0;
						// System.out.println("if loof in for");
						String sql = "UPDATE monthlypayment SET totalmonthlypayment = ? WHERE username = ?";
						PreparedStatement preparedStmt = con.prepareStatement(sql);
						preparedStmt.setDouble(1, monthlypayment);
						preparedStmt.setString(2, username);

						// execute the java preparedstatement
						preparedStmt.executeUpdate();
						HttpSession session = request.getSession();
						session.setAttribute("username", usname);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentMonthlyDisplayReport.jsp");
						dispatcher.forward(request, response);
						System.out.println("Updated successfully");
						break;
					} else {
						// System.out.println("set flag to 1");
						flag = 1;
						// System.out.println("doesnt exist");
						// System.out.println("value of i::::"+i);
					}
					if (i >= (usernameList.size() - 1)) {
						// System.out.println("username list size at end:
						// "+usernameList.size());
						break;
					}
				}

				if (flag == 1) {

					boolean resultOfAddTime = databaseObject.addmonthlyPay(username, monthlypayment, month2, year1);
					if (resultOfAddTime) {
						System.out.println("User added successfully");
						HttpSession session = request.getSession();
						session.setAttribute("username", usname);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentMonthlyDisplayReport.jsp");
						dispatcher.forward(request, response);
					} else {
						System.out.println("Problem in adding user");
						RequestDispatcher dispatcher = request.getRequestDispatcher("/ErrorPage.html");
						dispatcher.forward(request, response);
					}
				}

			}

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doGet(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
