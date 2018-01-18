

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SuccessServlet
 */
@WebServlet("/SuccessServlet")
public class SuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//final LoggerClass log = LoggerClass.getLoggerInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuccessServlet() {
        super();
       System.out.println("Success Servlet construtor");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		writer.println("<script> alert(Customer named  "+session.getAttribute("customerName")+" with Username as  "+session.getAttribute("user")+" Has been added in database)</script>");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentLogin.html");
		dispatcher.forward(request, response);
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
