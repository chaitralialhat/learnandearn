

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.javafx.scene.traversal.TopMostTraversalEngine;

import jdk.management.resource.internal.TotalResourceContext;

import java.sql.*;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * Servlet implementation class SuccessServlet
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//final LoggerClass log = LoggerClass.getLoggerInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        System.out.println("Success Servlet construtor");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	try{
    	String username=null;
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		String uname=(String)session.getAttribute("username");
		System.out.println("In Payment.java username:        \t"+uname);
		try {
		NumberFormat nf = NumberFormat.getInstance();
		String intime=null;
		String outtime = null;
		long totalhours = 0;
		double totalpayment=0;
		double totalpay = 0;
		float hours1 = 0;
		float min = 0;
			Class.forName("com.mysql.jdbc.Driver");
			

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdetailsdb", "root", "root");
			
			Statement statement = con.createStatement();
			
			String sql5 = ("SELECT totalhours from workingtime where username='"+uname+"'" );
			ResultSet resultSet5 = statement.executeQuery(sql5);
			while(resultSet5.next()){
			totalhours = resultSet5.getLong("totalhours");
			System.out.println("After Query execution totalhours: "+totalhours);
			}
			if(totalhours == 0.0){
			String sql = ("SELECT intime from workingtime where username='"+uname+"'" );
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			intime=resultSet.getString("intime");
			System.out.println("After Query execution intime: "+intime); 
			
			}
			String sql1 = ("SELECT outtime from workingtime where username='"+uname+"'" );
			ResultSet resultSet1 = statement.executeQuery(sql1);
			while(resultSet1.next()){
			outtime=resultSet1.getString("outtime");
			System.out.println("After Query execution outtime: "+outtime);
			}
			
			}
			
			
			if(totalhours == 0){
				nf.setMaximumFractionDigits(3);
				
				String dateStart = intime;
				String dateStop = outtime;
				
				//HH converts hour in 24 hours format (0-23), day calculation
				SimpleDateFormat format = new SimpleDateFormat("HH:mm");
				
				Date d1 = null;
				Date d2 = null;
				
				String s1= "0";
			
					d1 = format.parse(dateStart);
					d2 = format.parse(dateStop);

					//in milliseconds
					long diff = d2.getTime() - d1.getTime();

					long diffMinutes = diff / (60 * 1000) % 60;
					long diffHours = diff / (60 * 60 * 1000) % 24;
					
					
										
					System.out.println("totalhours calculated:" +diffHours+":"+diffMinutes);
				
				String sql2 = "UPDATE workingtime SET totalhours= ? WHERE totalhours= ?";
				PreparedStatement preparedStmt = con.prepareStatement(sql2);
				System.out.println("in prepared statement");
			      preparedStmt.setString(1,(diffHours+":"+diffMinutes));
			      preparedStmt.setString(2, s1);

			      // execute the java preparedstatement
			      preparedStmt.executeUpdate();
				
				System.out.println("Updated totalhours");
				
				String sql8 = "UPDATE workingtime SET hours= ? WHERE hours= ?";
				PreparedStatement preparedStmt1 = con.prepareStatement(sql8);
				System.out.println("in prepared statement");
			      preparedStmt1.setFloat(1,(diffHours));
			      preparedStmt1.setFloat(2, 0);

			      // execute the java preparedstatement
			      preparedStmt1.executeUpdate();
				
				System.out.println("Updated in hours");
				
				
				String sql9 = "UPDATE workingtime SET minites= ? WHERE minites= ?";
				PreparedStatement preparedStmt2 = con.prepareStatement(sql9);
				System.out.println("in prepared statement");
			      preparedStmt2.setFloat(1,(diffMinutes));
			      preparedStmt2.setFloat(2, 0);

			      // execute the java preparedstatement
			      preparedStmt2.executeUpdate();
				
				System.out.println("Updated in min");
				}
			
			
			//calculate total payment
			
			String sql6 = ("SELECT totalpayment from workingtime where username='"+uname+"'" );
			ResultSet resultSet6 = statement.executeQuery(sql6);
			while(resultSet6.next()){
			totalpayment = resultSet6.getDouble("totalpayment");
			System.out.println("After Query execution totalpayment: "+totalpayment);
			}
			String sql7 = ("SELECT hours from workingtime where username='"+uname+"'" );
			ResultSet resultSet7 = statement.executeQuery(sql7);
			while(resultSet7.next()){
			hours1 = resultSet7.getFloat("hours");
			System.out.println("After Query execution hours: "+hours1);
			}
			String sql9 = ("SELECT minites from workingtime where username='"+uname+"'" );
			ResultSet resultSet9 = statement.executeQuery(sql9);
			while(resultSet9.next()){
			min = resultSet9.getFloat("minites");
			System.out.println("After Query execution min: "+min);
			}
			if(totalpayment == 0.0){
				nf.setMaximumFractionDigits(3);
				//considering 0.5 rs for 1min 
				//and 30 rs for per hrs
				Double hourpay = (double) (hours1 * 30);
				Double minitepay = (double) (min*0.5);
				totalpay = hourpay + minitepay;
				
				System.out.println("total payment of day: "+totalpay);
				
				
				
				
				String sql2 = "UPDATE workingtime SET totalpayment = ? WHERE totalpayment = ?";
				PreparedStatement preparedStmt = con.prepareStatement(sql2);
			      preparedStmt.setString(1, nf.format(totalpay));
			      preparedStmt.setDouble(2, 0);

			      // execute the java preparedstatement
			      preparedStmt.executeUpdate();
				
				System.out.println("Updated");
			}
			
			writer.println("<script> alert(Student named  "+session.getAttribute("username")+" has been added in database)</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/AddTiming.jsp");
			dispatcher.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		} 
	
		
		
		}
		catch(Exception e){
			System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
		}
	}

}
