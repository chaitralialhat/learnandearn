import java.io.IOException;

import java.util.ArrayList;

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
@WebServlet("/PaymentCalculate")
public class PaymentCalculate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//EncryptorDecryptor encryptor = new  EncryptorDecryptor();
    /**
     * Default constructor. 
     */
    public PaymentCalculate() {
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
		String intime = (request.getParameter("intime"));
		System.out.println(intime);
		String outtime = request.getParameter("outtime");
		System.out.println(outtime);
		String date = request.getParameter("date");
		System.out.println(date);
		
		//System.out.println(outtime);
		
		HttpSession session1 = request.getSession();
		String username=(String)session1.getAttribute("username");
		System.out.println("in payment calculate: "+username);
		session1.setAttribute("username", username);
		String fname=request.getParameter("fname");
		 System.out.println("in payment calculate: "+fname);
       String lname=request.getParameter("lname");
       System.out.println("in payment calculate: "+lname);
		 
        
		boolean resultOfAddTime =databaseObject.addTime(username, intime, outtime, date);
		if(resultOfAddTime){
			System.out.println("User added successfully");
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			//session.setAttribute("user", studentUsername);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Payment");
			dispatcher.forward(request, response);
		}
		else
			System.out.println("Problem in adding user");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ErrorPage.html");
		dispatcher.forward(request, response);
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
