/*Created by Rini Shaji
 * to fetch user details from database
 * and display in Manage Orders screen*/
package happytummy.servlet;

import happytummy.beans.User;
import happytummy.connect.ConnectionUtils;
import happytummy.utils.DBUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub\
		System.out.println("Entered doPost of EditUserDetails:  email: "+request.getParameter("email")+" deskdate: "+request.getParameter("date")+" mobdate: "+request.getParameter("datem")); //test
		System.out.println(" dobbbb.:"+request.getParameter("dob")); 
		Connection conn;
		try {			
			conn = ConnectionUtils.getConnection();
			conn.setAutoCommit(false);
			String errorString = null;
			String dob=null;
			String emailID=request.getParameter("email");
				
			dob=request.getParameter("dob");
			User user=new User();
			try{
				DateFormat sourceFormat=new SimpleDateFormat("yyyy-MM-dd");
				DateFormat destFormat=new SimpleDateFormat("dd-MMM-yyyy");
				Date birthDate = sourceFormat.parse(dob);
				dob=destFormat.format(birthDate);
				user =DBUtils.getUserDetails(conn, emailID, dob);
				System.out.println(user);
			} catch (Exception e) {
	            e.printStackTrace();
	            errorString = e.getMessage();
			}
			request.setAttribute("errorString", errorString);
	        request.setAttribute("user", user);
	        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/ManageOrders.jsp");
	        dispatcher.forward(request, response);	        
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}
