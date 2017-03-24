package happytummy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import happytummy.beans.MenuItems;
import happytummy.beans.Plans;
import happytummy.utils.DBUtils;
import happytummy.connect.ConnectionUtils;

/**
 * Servlet implementation class CheckoutServlet
 */
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
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
		 System.out.println("Entered doPost of checkout Servlet"); //test
		 Connection conn;
		try {
			    conn = ConnectionUtils.getConnection();
		        // Set Auto commit to false
		        conn.setAutoCommit(false);
		        int preference=0;
		        int height=0;
		        String gender="";
		        String name="";
		        String phone="";
		        String email="";
		        int weight=0;
		       /* var dataString = "pref=" + sessionStorage.getItem("Preference")+"&height=" + sessionStorage.getItem('Height')+"&weight=" + sessionStorage.getItem('Weight')+"&gender=" + 
		        		sessionStorage.getItem("custgender")+"&DOB=" + sessionStorage.getItem("DOB")+"&Name=" + sessionStorage.getItem("Name")+"&Email=" + sessionStorage.getItem("Email")+
		        		+"&Phone=" + sessionStorage.getItem("Phone")+"&Zip=" + sessionStorage.getItem("Zip")+"&Address=" + sessionStorage.getItem("Address");
*/
		        
		        if(request.getParameter("pref")!=null)
		        {
		        	preference=Integer.parseInt(request.getParameter("pref"));
		        }
		        if(request.getParameter("weight")!=null && !((request.getParameter("weight")).toString().equals("")))
		        {
		        	weight=Integer.parseInt(request.getParameter("weight"));
		        }
		        if(request.getParameter("height")!=null && !((request.getParameter("height")).toString().equals("")))
		        {
		        	height=Integer.parseInt(request.getParameter("height"));
		        }
		        if(request.getParameter("gender")!=null && !((request.getParameter("gender")).toString().equals("")))
		        {
		        	gender=(request.getParameter("gender")).toString();
		        }
		        if(request.getParameter("Name")!=null && !((request.getParameter("Name")).toString().equals("")))
		        {
		        	name=(request.getParameter("Name")).toString();
		        }
		        if(request.getParameter("Phone")!=null && !((request.getParameter("Phone")).toString().equals("")))
		        {
		        	phone=(request.getParameter("Phone")).toString();
		        }

		        if(request.getParameter("Email")!=null && !((request.getParameter("Email")).toString().equals("")))
		        {
		        	email=(request.getParameter("Email")).toString();
		        }
		        String errorString = null;
		        System.out.println("weight"+weight+"height"+height);
		       
		       
		        try {
		        	int result= DBUtils.insertRecord(conn,preference, height, weight, gender, 29,name,phone,email); //pending to change
		       
		            } 
		        catch (Exception e) {
		            e.printStackTrace();
		            errorString = e.getMessage();
		        }
		       
				
		        
		        
		       
	    
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
	}

}
