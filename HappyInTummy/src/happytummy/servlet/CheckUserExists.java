package happytummy.servlet;

import happytummy.beans.User;
import happytummy.connect.ConnectionUtils;
import happytummy.utils.DBUtils;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.json.simple.JSONObject;

/**
 * Servlet implementation class CheckUserExists
 */
public class CheckUserExists extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserExists() {
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
		// TODO Auto-generated method stub
		System.out.println("Entered doPost of CheckUSerExists "+ request.getParameter("email_id")+" "+request.getParameter("dob")); //test
		Connection conn;
		try {
			boolean userFound=false;
			conn = ConnectionUtils.getConnection();
			conn.setAutoCommit(false);
/*			String dateStr = "21/20/2011";
			15
			             
			16
			            DateFormat srcDf = new SimpleDateFormat("dd/MM/yyyy");
			17
			             
			18
			            // parse the date string into Date object
			19
			            Date date = srcDf.parse(dateStr);
			20
			             
			21
			            DateFormat destDf = new SimpleDateFormat("MM-dd-yyyy hh:mm:ss");
			22
			              
			23
			            // format the date into another format
			24
			            dateStr = destDf.format(date);
			25
			             
			26
			            System.out.println("Converted date is : " + dateStr);*/

			String errorString = null;
			String emailID=request.getParameter("email_id");
			String dob=request.getParameter("dob");			
			try{	   
				DateFormat sourceFormat=new SimpleDateFormat("yyyy-MM-dd");
				DateFormat destFormat=new SimpleDateFormat("dd-MMM-yyyy");
				Date birthDate = sourceFormat.parse(dob);
				dob=destFormat.format(birthDate);
				userFound =DBUtils.userExists(conn, emailID, dob);
			} catch (Exception e) {
	            e.printStackTrace();
	            errorString = e.getMessage();
	        }
			response.setContentType("application/json");
	        response.setHeader("Cache-control", "no-cache, no-store");
	        response.setCharacterEncoding("utf-8");
	        PrintWriter out = response.getWriter();
	        out.print(userFound);
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
