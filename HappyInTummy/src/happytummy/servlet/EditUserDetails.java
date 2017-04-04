package happytummy.servlet;

import happytummy.beans.Plans;
import happytummy.beans.User;
import happytummy.connect.ConnectionUtils;
import happytummy.utils.DBUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class EditUserDetails
 */
public class EditUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entered doGet of EditUserDetails"+request.getParameter("email")+request.getParameter("dob")); //test
		
		Connection conn;
		try {
			conn = ConnectionUtils.getConnection();
			conn.setAutoCommit(false);
			String errorString = null;
			String emailID=request.getParameter("email");
			String dob=request.getParameter("dob");
			User user=new User();
			try{	        
	        user =DBUtils.getUserDetails(conn, emailID, dob);
			} catch (Exception e) {
	            e.printStackTrace();
	            errorString = e.getMessage();
	        }
			request.setAttribute("errorString", errorString);
	        request.setAttribute("user", user);
	        RequestDispatcher dispatcher = this.getServletContext()
	                .getRequestDispatcher("/ManageOrders.jsp");
	        dispatcher.forward(request, response);	        
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 System.out.println("Entered doPost of EditUserDetails"); //test
		 doGet(request, response);
	}

}
