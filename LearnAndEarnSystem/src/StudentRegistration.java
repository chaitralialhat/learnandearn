


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
@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EncryptorDecryptor encryptor = new  EncryptorDecryptor();
    /**
     * Default constructor. 
     */
    public StudentRegistration() {
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
		String  username=  initParameter.get(3);
		System.out.println(database+"\n"+driver+"\n"+username+"\n"+password);
		DBUtilities databaseObject = new DBUtilities(driver, database, username, password);
		System.out.println("Connection Successful");
		String studentName = request.getParameter("fname");
		request.setAttribute("fname", studentName);
		System.out.println(studentName);
		String lastName = request.getParameter("lname");
		request.setAttribute("lname", lastName);
		System.out.println(lastName);
		String gender = request.getParameter("gender");
		System.out.println(gender);
		
		long mobileNumber = Long.parseLong(request.getParameter("mobile"));
		String college = request.getParameter("college");
		System.out.println(college);
		String department = request.getParameter("department");
		System.out.println(department);
		String address = request.getParameter("address");
		/*String teleNo = request.getParameter("telephone");
		long telephone = 0000;
		if(teleNo != ""){
			telephone = Long.parseLong(teleNo);
		}*/
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		
		String email = request.getParameter("mailID");
		String studentUsername = request.getParameter("username");
		String studentPassword = request.getParameter("password");
		String role=request.getParameter("role");
		//System.out.println(studentName+" "+mobileNumber+" "+address+" "+username+" "+" "+gender+" "+city+" "+" "+studentPassword);
		
		byte [] salt = EncryptorDecryptor.getSalt256();
		String encryptedPassword = EncryptorDecryptor.getHash256(studentPassword, salt);

		boolean resultOfAddCustomer =databaseObject.addStudent(studentName, gender, mobileNumber, college, department, email, address, city, state, country, studentUsername, lastName, role);
		boolean resultOfAddUser = databaseObject.addUserCredentials(studentUsername,encryptedPassword,role);
		if(resultOfAddCustomer && resultOfAddUser){
			System.out.println("User added successfully");
			HttpSession session = request.getSession();
			session.setAttribute("studentName", studentName);
			session.setAttribute("lname", lastName);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SuccessServlet");
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
