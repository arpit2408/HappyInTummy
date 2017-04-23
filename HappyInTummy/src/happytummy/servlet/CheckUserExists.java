/*Created by Rini Shaji
 * to check if the Email ID and date of birth 
 * corresponds to an existing Customer */ 
package happytummy.servlet;

import happytummy.connect.ConnectionUtils;
import happytummy.utils.DBUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		System.out.println("Entered doPost of CheckUserExists "+ request.getParameter("email_id")+" "+request.getParameter("dob")); //test
		Connection conn;
		try {
			String userFound=null;
			conn = ConnectionUtils.getConnection();
			conn.setAutoCommit(false);
			String errorString = null;
			String emailID=request.getParameter("email_id");
			String dob=request.getParameter("dob");			
			try{	   
				DateFormat sourceFormat=new SimpleDateFormat("yyyy-MM-dd");
				DateFormat destFormat=new SimpleDateFormat("dd-MMM-yyyy");
				Date birthDate = sourceFormat.parse(dob);
				dob=destFormat.format(birthDate);
				userFound =DBUtils.userExists(conn, emailID, dob);
				System.out.println("CheckUserExists "+ userFound); //test
			} catch (Exception e) {
	            e.printStackTrace();
	            errorString = e.getMessage();
	        }
			response.setContentType("application/json");
	        response.setHeader("Cache-control", "no-cache, no-store");
	        response.setCharacterEncoding("utf-8");
	        JSONObject json = new JSONObject();
	        json.put("user",userFound);
	        System.out.println("CheckUserExists "+ json); //test
	        
	        PrintWriter out = response.getWriter();	        
	        out.print(json);
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}