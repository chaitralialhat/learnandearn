


import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/StudentLoginServlet1")
public class StudentLoginServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//final LoggerClass log = LoggerClass.getLoggerInstance();
	private static String authenticationType;
	
    public static String getAuthenticationType() {
		return authenticationType;
	}

	public static void setAuthenticationType(String authenticationType) {
		StudentLoginServlet1.authenticationType = authenticationType;
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLoginServlet1() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try{
    		PrintWriter out = response.getWriter();
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
    		String studentUsername = request.getParameter("username");
    		String studentPassword = request.getParameter("password");
    		String role=request.getParameter("role");
    		//Encryption
    		byte [] salt = EncryptorDecryptor.getSalt256();
    		String encryptedPassword = EncryptorDecryptor.getHash256(studentPassword, salt);
    		
    		boolean result = databaseObject.checkLoginCredentials(studentUsername,encryptedPassword,role);
    		if(result){
    			System.out.println("Login successful");
    			HttpSession session = request.getSession();
       			session.setAttribute("username", studentUsername);
       			
    			RequestDispatcher dispatcher = null;
    			if(getAuthenticationType().equalsIgnoreCase("student")){
        			dispatcher = request.getRequestDispatcher("/StudentHome.html");
        			}
        			if(getAuthenticationType().equalsIgnoreCase("admin")){
        				dispatcher = request.getRequestDispatcher("/AdminHome.html");	
        			}
        			if(dispatcher!=null){
        			dispatcher.forward(request, response);
        			}
        			else{
        				System.out.println("Null Dispatcher");
        			}
    		}
    		else{
    			System.out.println("Invalid Credentials");
    		   out.println("<script type=\"text/javascript\">");
    	       out.println("alert('Username or password incorrect');");
    	       out.println("</script>");
    	       response.sendRedirect("http://localhost:8085/LearnAndEarnSystem/StudentLogin.html"); 
    		}
    	}
    	catch(Exception e){
    		System.out.println(e);
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
		catch(Exception e)
		{
			System.out.println(e);
		}
		}

}
